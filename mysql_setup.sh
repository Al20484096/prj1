#!/bin/bash
/usr/bin/mysqld_safe &
sleep 20
mysqladmin -u root password "root"
mysql -u root -p"root" -e "UPDATE mysql.user SET Password=PASSWORD('root') WHERE User='root'"
mysql -u root -p"root" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -p"root" -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -p"root" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -p"root" -e "DROP DATABASE IF EXISTS test"
mysql -u root -p"root" -e "FLUSH PRIVILEGES"
mysql -u root -p"root" -e "CREATE DATABASE ratingdb;USE ratingdb;CREATE TABLE ratings (id int(20) unsigned NOT NULL AUTO_INCREMENT,page varchar(256) NOT NULL,rating enum('1','2','3','4') NOT NULL,uid int(10) unsigned NOT NULL,date date NOT NULL,PRIMARY KEY (id))"

