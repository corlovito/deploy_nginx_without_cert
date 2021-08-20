# create random password
USER_NAME=faser
PASSWDDB=faser
# replace "-" with "_" for database username
MAINDB=${USER_NAME//[^a-zA-Z0-9]/_}

mysql -uroot -e "CREATE DATABASE $MAINDB"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $MAINDB.* TO $MAINDB@localhost IDENTIFIED BY '$PASSWDDB'"
