#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]]
then
	echo "You need to run this script with superuser privileges." >&2
	exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
if [[ $# -lt 1 ]]
then
	echo "Usage: $0 USER_NAME [COMMENT] ..." >&2 
	exit 1
	# The first parameter is the user name.
else
	USER_NAME=$1
	shift
	# The rest of the paremeters are for the account comments.
	COMMENT=$@
fi

# Generate a password.
PASSWORD="$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c32)"

# Create the user with the password.
useradd -c "${COMMENT}" ${USER_NAME}
echo "${USER_NAME}:${PASSWORD}" | chpasswd
# Check to see if the passwd command succeeded.
if [[ $? -eq 0 ]]
then
	echo "The user was created successfully."
else
	echo "Failed to create the user." >&2
	exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME} > /dev/null 2>&1

# Display the username, password, and the host where the user was created.

echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Host: ${HOSTNAME}"
