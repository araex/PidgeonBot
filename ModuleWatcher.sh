#!/bin/bash

## ModuleWatcher

# Rebuilds the Interpreter if changes happen in /modules 

dir="modules"
chsum1=`digest -a md5 $dir | awk '{print $1}'`
chsum2=$chsum1

while true
do
    chsum2=`digest -a md5 $dir | awk '{print $1}'`
    if [ $chsum1 -ne $chsum2 ]; then
    		chsum1=chsum2
    		sh InterpreterBuilder
    		echo "rebuilt Interpreter"
    fi
    sleep 10
done




