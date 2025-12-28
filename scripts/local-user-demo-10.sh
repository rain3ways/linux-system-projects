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
		log "Backing up ${FILE} to local ${BACKUP_FILE}."

		# The status of the funciton will be the exit status of the cp command.
		cp -p ${FILE} ${BACKUP_FILE}
	else
		# The file does not exist, so return a non-zero exit status.
		return 1
	fi

	# Make a decision based on the exit status of the function.
	if [[ ${?} -eq 0 ]]
	then
		echo 'File backup succeeded!'
	else
		echo 'File backup failed!'
	fi
}

readonly VERBOSE='True'

log 'True' 'Hello!'
log 'This is fun!'

backup_file '/etc/passwd'
