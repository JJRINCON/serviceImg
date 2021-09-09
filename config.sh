#!/bin/bash
sudo systemctl stop mysqld
sudo systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"
sudo systemctl restart mysqld
mysql -u root mysql
update user set authentication_string=password('@Sistemas2021') where user='root';
flush privileges;
exit;
sudo systemctl unset-environment MYSQLD_OPTS
sudo systemctl restart mysqld
