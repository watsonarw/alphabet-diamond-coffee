#!/bin/bash

command_exists () {
    type "$1" &> /dev/null ;
}

if ! command_exists node || ! command_exists npm; then
  echo "You need node and npm to run this!"
  echo "You'll need to install these yourself as I can't install them for you :("
  echo "Try using NVM https://github.com/creationix/nvm"
  exit 1
fi

if [[ $(npm -s outdated) ]]; then
  npm -s install
fi

if [[ $1 && $1 == "test" ]]; then
  npm -s test
  exit $?
fi

if [[ $1 && $1 == "start" && $2 ]]; then
  npm -s start $2
  exit $?
fi

echo "Usage: ./go <command>"
echo ""
echo "where <command> is one of:"
echo "    test             runs the unit tests"
echo "    start <letter>   runs the program with <letter> as defined in README.md"
