#!/data/data/com.termux/files/usr/bin/bash

clear
echo "Welcome to Scriptzo"
sleep 1
echo -n "Please enter the admin code: "
read -r user_input

admin_code="SCR1PTED"

if [ "$user_input" = "$admin_code" ]; then
    echo "Access granted. Welcome, admin!"
else
    echo "Incorrect admin code. Access denied."
fi
