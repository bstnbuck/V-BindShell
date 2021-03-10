#!/bin/bash

wget https://github.com/vlang/v/releases/download/weekly.2021.5/v_linux.zip -O v.zip
unzip v.zip
rm v.zip
cd v 
make
wget https://gist.githubusercontent.com/bstnbuck/142508b38e508c451dbd2ca87b692596/raw/b41d38cce784eca5c0cd6d3a80c61df78b364282/v_bind_shell.v -O v_shell.v 
./v run v_shell.v