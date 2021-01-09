#!/bin/bash

# 接收参数列表 $0 文件名 $1 第一个参数: 用户名 $2 第二个参数: 密码 $3 第三个参数: 数据库名 ...
if ( $1 || $2 || $3 )
then
	echo "Error"
else
	USENAME=$1
	PASSWORD=$2
	DBNAME=$3
	LOGIN_CMD="mysql -u${USENAME} -p${PASSWORD}"
	# echo ${LOGIN_CMD}
	create_database() {
		# echo "create database ${DBNAME}"
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
fi
