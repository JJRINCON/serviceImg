#!/bin/bash
sudo apt-get update > /dev/null
# Build Expect script
tee ~/secure_our_mysql.sh > /dev/null << EOF
spawn $(which sudo mysql_secure_installation)

expect "Press y|Y for Yes, any other key for No:"
send "n\r"

expect "Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG:"
send "0\r"

expect "Change the password for root ? ((Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "New password:"
send "@Sistemas2021\r"

expect "Re-enter new password:"
send "@Sistemas2021\r"

expect "Remove anonymous users? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Disallow root login remotely? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Remove test database and access to it? (Press y|Y for Yes, any other key for No) :"
send "y\r"

expect "Reload privilege tables now? (Press y|Y for Yes, any other key for No) :"
send "y\r"

EOF
