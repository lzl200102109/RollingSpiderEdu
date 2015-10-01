#!/bin/bash

# 1. change folder to where this script is
cd `dirname $0`
SCRIPTPATH=$(pwd)

# 1.2 Exit the script if a command fails
set -e

# 2. Pack autogenerated c-code
echo "Drone: Trying to pack autogenerated code using PackEmbeddedCode..."
cd utils/
./PackEmbeddedCode
cd ..
echo "Drone: Autogenerated code using PackEmbeddedCode packed!"

# 3. Build code
echo "Drone: Trying to build code..."
cd ../trunk/embcode/build_arm
make
cd $SCRIPTPATH
echo "Drone: Code built!"

# 4. ftp into the drone and upload the shared library
echo "Drone: Trying to upload shared library..."

echo "> Drone: FTP into the drone"
/usr/bin/expect -c 'set timeout -1; spawn ftp 192.168.1.1; expect "(192.168.1.1:'"$USER"'):"; send "\r"; expect "ftp>"; send "put ../DroneExchange/librsedu.so librsedu.so\r"; expect "ftp>"; send "exit\r"; expect eof'

echo "Drone: Shared library uploaded!"
