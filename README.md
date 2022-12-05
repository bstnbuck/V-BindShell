# V-BindShell

> A small bind shell written in V, perfect for penetration testing! I am not responsible against misuse of this program.

### Requirements
* Installed V-Compiler

### Usage
**For debugging**:
Clone the repository and follow these steps:
* build ```v_shell.v``` with ``` v -prod -cc {gcc, msvc, tcc} v_shell.v```
* run it and enjoy!

**For penetration testing usage**:
>Do not use this on devices where you do not have permission to do so!
* Download the .sh-file on the remote host (e.g. with wget) (Linux-only).
* Execute it with ``` bash install_run_v.sh```. This will install the V-Compiler and runs the shell (if root, Linux-only). If non root-user uses this, a precompiled binary will be downloaded and executed.
* Connect to the specific port from local host (e.g. with netcat).
* If you use Windows, just download and execute the precompiled binary.