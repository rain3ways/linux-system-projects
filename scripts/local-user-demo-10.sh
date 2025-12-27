#!/bin/bash

log() {	
	# This function sends a message to syslog and to standard output if VERBOSE is true.
	local MESSAGE="$@"
	if [[ "${VERBOSE}" = "True" ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t local-user-demo-10.sh "${MESSAGE}"
}

backup_file(){
	# This function creates a backup of a file. Return non-zero status on error.
	
	local FILE="${1}"
	# Make sure the file exists.
	if [[ -f "${FILE}" ]]
	then
		local BACKUP_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
	fi
}

readonly VERBOSE='True'
log 'True' 'Hello!'
log 'This is fun!'
