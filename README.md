# V-BindShell

> A small bind shell written in V, perfect only for penetration! I am not responsible against misuse of this program testing usage.

### Requirements
* Installed V-Compiler

### Usage
**For debugging**:
Clone the repository and follow these steps:
* build ```v_shell.v``` with ``` v v_shell.v```
* run it and enjoy!

**For penetration testing usage**:
>Do not use this on devices where you do not have permission to do so!
* Download the .sh-file on the remote host (e.g. with wget).
* execute it with ``` . install_run_v.sh``` or ``` source install_run_v.sh ```. This will install the V-Compiler and runs the shell.
* Connect to the specific port from local host (e.g. with netcat).

>Attention!
Use "exit" to close the connection, CTRL-C will raise a V-panic.