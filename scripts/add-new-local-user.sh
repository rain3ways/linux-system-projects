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

# The rest of the parameters are for the account comments.

# Generate a password.

# Create the user with the password.

# Check to see if the useradd command succeeded.

# Set the password.

# Check to see if the passwd command succeeded.

# Force password change on first login. 

# Display the username, password, and the host where the user was created.
