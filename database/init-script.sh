#!/bin/bash

# Wait for the MySQL container to be ready
until mysql -hdb -uroot -proot_password -e 'SELECT 1'; do
  echo 'Waiting for MySQL to be ready...'
  sleep 5
done

# Execute the SQL script
mysql -hdb -uroot -proot_password mydatabase < /docker-entrypoint-initdb.d/init.sql
