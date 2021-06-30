#!/bin/sh
#not sure if '%' is necessary here for boss user

#mysql_install_db --basedir=/var/lib/mysql #conflict in the install, should check what happened that mess up the container

service mysql start

mysql -e "CREATE DATABASE Inception"
mysql -e "CREATE USER 'boss'@'Inception' IDENTIFIED BY 'bruh'"
mysql -e "CREATE USER 'corrector'@'Inception' IDENTIFIED BY 'oof'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'bruh'"
mysql -e "GRANT ALL PRIVILEGES ON Inception.* TO 'corrector'@'Inception'"
mysql -e "FLUSH PRIVILEGES"
mysql Inception < /database.sql

exec mysqld -u root --datadir="/var/lib/mysql"

# socket issues again, maybe because of a start failure ?
#
#Last log issue report :

#Starting MariaDB database server: mysqld . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . failed!
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
#ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
#2021-06-30 12:42:32 0 [Note] mysqld (mysqld 10.3.29-MariaDB-0+deb10u1) starting as process 1 ...
#2021-06-30 12:42:32 0 [Note] InnoDB: Using Linux native AIO
#2021-06-30 12:42:32 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
#2021-06-30 12:42:32 0 [Note] InnoDB: Uses event mutexes
#2021-06-30 12:42:32 0 [Note] InnoDB: Compressed tables use zlib 1.2.11
#2021-06-30 12:42:32 0 [Note] InnoDB: Number of pools: 1
#2021-06-30 12:42:32 0 [Note] InnoDB: Using SSE2 crc32 instructions
#2021-06-30 12:42:32 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
#2021-06-30 12:42:32 0 [Note] InnoDB: Completed initialization of buffer pool
#2021-06-30 12:42:32 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
#2021-06-30 12:42:32 0 [Note] InnoDB: 128 out of 128 rollback segments are active.
#2021-06-30 12:42:32 0 [Note] InnoDB: Creating shared tablespace for temporary tables
#2021-06-30 12:42:32 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
#2021-06-30 12:42:32 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
#2021-06-30 12:42:32 0 [Note] InnoDB: Waiting for purge to start
#2021-06-30 12:42:32 0 [Note] InnoDB: 10.3.29 started; log sequence number 1624978; transaction id 21
#2021-06-30 12:42:32 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
#2021-06-30 12:42:32 0 [Note] Plugin 'FEEDBACK' is disabled.
#2021-06-30 12:42:32 0 [Note] InnoDB: Buffer pool(s) load completed at 210630 12:42:32
#2021-06-30 12:42:33 0 [Note] Server socket created on IP: '127.0.0.1'.
#2021-06-30 12:42:33 0 [Note] Reading of all Master_info entries succeeded
#2021-06-30 12:42:33 0 [Note] Added new Master_info '' to hash table
#2021-06-30 12:42:33 0 [Note] mysqld: ready for connections.
#Version: '10.3.29-MariaDB-0+deb10u1'  socket: '/var/lib/mysql/mysql.sock'  port: 3306  Debian 10
#