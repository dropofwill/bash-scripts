#!/bin/bash

wget -q https://raw.githubusercontent.com/renardchien/Bash-Exercise-cpp/master/hello.cpp -O ./hello.cpp

g++ hello.cpp -o hello

if [ "$1" == "-r" ]
then
  ./hello
fi
