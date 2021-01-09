#!/bin/bash
DBNAME="typecho"
LOGIN_CMD="mysql -uroot -plinux1314"
echo ${LOGIN_CMD}
create_database() {
	echo "create database ${DBNAME}"
	create_db_sql="create database if not exists ${DBNAME} character set utf8mb4"
	echo ${create_db_sql} | ${LOGIN_CMD}
	if [ $? -ne 0 ];
	then
		echo "create database ${DBNAME} failed..."
		exit 1
	else
		echo "succeed to create database ${DBNAME}"
	fi
}
create_database
