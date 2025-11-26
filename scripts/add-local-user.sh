#!/bin/bash

# Make sure the script is being executed with super privilleges.
# Get the username (login).
read -p "Enter the username to create: " USER_NAME

# Get the real name (contents for the description field).
read -p "Enter the name of the person or application that will using this account: " DESCRIPTION

# Get the password.
read -p "Enter the password to use for the account: " PASSWORD

# Create the user with the password.
useradd -m ${USER_NAME} 

# Check to see if the useradd command succeeded.
if [[ $? == 0 ]]; then
	echo "Changing password for user ${USER_NAME}"
fi

# Set the password.
echo "${USER_NAME}:${PASSWORD}" | chpasswd
# Check to see if the passwd command succeeded.
if [[ $? == 0 ]]; then
	echo "passwd: all authentication tokens updated successfully."
fi

# Force password change on first login.
echo "Expiring password for user ${USER_NAME}"

passwd ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo "username: ${USER_NAME}"

echo "password: ${PASSWORD}"

echo "host: "
