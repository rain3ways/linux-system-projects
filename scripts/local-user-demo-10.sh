#!/bin/bash

log() {	
	local MESSAGE="$@"
	if [[ "${VERBOSE}" = "True" ]]
	then
		echo "${MESSAGE}"
	fi
}
readonly VERBOSE='True'
log 'True' 'Hello!'
log 'This is fun!'
