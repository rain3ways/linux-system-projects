#!/bin/bash

# This script displays various information to the screen.

# Display 'Hello'
echo 'Hello'

# Assign  a valur to a variable
WORD='script'

# Display that value using the variable.
echo "$WORD"

# Demonstrate that single quotes cause variables to NOT get expanded.
echo '$WORD'

# Combine the variables with hard-coded text.
echo "This is a shell $WORD"

# Display the contents of the variable using and alternative syntax.
echo "This is a shell ${WORD}"

# Append text to the variable.
echo "${WORD}ing is fun!!"
