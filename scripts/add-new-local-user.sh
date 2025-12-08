#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]]
then
	echo 'Please run with sudo or as root'
	exit 1
fi
# If the user doesn't supply at least one argument, then give them help.
if [[ $# -lt 1 ]]
then
	echo "Usage: $0 USER_NAME [COMMENT] ..."
	echo "Create a local user with the specified USER_NAME and optional COMMENT."
	exit 1
fi
# The first is the user name.
USER_NAME=$1
shift
# The rest of the parameters are for the account comments.
COMMENT=$*
# Generate a password.
PASSWORD=$(date +%s%N"${RANDOM}${RANDOM}" | sha256sum | head -c32)
CHAR_1=$(echo '!@#$%^&*()_+' | fold -w 1 | shuf -n 1)
PASSWORD="${PASSWORD}${CHAR_1}"
# Create the user with the password.
useradd -m -c "${COMMENT}" "${USER_NAME}"
# Check to see if the useradd command succeeded.
if [[ $? -ne 0 ]]
then
	echo "Fail to create user."
	exit 1
fi

# Set the password.
echo "${USER_NAME}:${PASSWORD}" | chpasswd
if [[ $? -ne 0 ]]
then
	echo "Fail to set password."
	exit 1
fi
# Force password change on first login.
passwd -e "${USER_NAME}"
if [[ $? -ne 0 ]]
then
	echo "Fail to expire password."
	exit 1
fi
#  Display the username, password, and the host where the user was created.
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Host: $(hostname)"
