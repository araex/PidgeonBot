#!/bin/bash

## ModuleWatcher

# Rebuilds the Interpreter if changes happen in /modules 

chsum1=""
for f in $(ls modules)
do
	chsum1="${chsum2}$(md5sum modules/${f})"
done

while true
do
	chsum2="";
	for f in $(ls modules)
	do
		chsum2="${chsum2}$(md5sum modules/${f})"
	done
   	if [ "${chsum1}" != "${chsum2}" ]; then
    		chsum1=${chsum2}
    		sh InterpreterBuilder
    		echo "rebuilt Interpreter"
    	fi
    	sleep 10
done




