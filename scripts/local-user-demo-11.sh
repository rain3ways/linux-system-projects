#!/bin/bash

# This is a script generates a random password.
# This user can set the password length with -l and add a specail character with -s.
# Verbose mode can be enable with -v.

# Set a default password length
LENGTH=48

while getopts vl:s OPTION
do
	case ${OPTION} in
		v)
			VERBOSE='true'
			echo 'Verbose mode on.'
			;;
		l)
			LENGTH="${OPTARG}"
			;;
		s)
			USER_SPECIAL_CHARACTER='true'
			;;
		?)
			echo 'Invalid option.' >&2
			exit 1
			;;
	esac
done
