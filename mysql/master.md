+ 描述
    1. 将用户对数据库更新的操作以二进制格式保存到Binary Log日志中，然后由Binlog Dump进程将Binary Log日志文件传输给从服务器
    2. 从服务器的Slave_IO_Running线程将Binary Log日志文件的 更新 操作复制到 Relay Log的中继日志文件中
    3. 从服务器的Slave_SQL_Running线程 将Relay Log 中继文件依次在本地执行，实现主从复制。
+ Binlog Dump
    + 可使用 SHOW PROCESSLIST(查看mysql所有进程) 查看 Binlog Dump是否在运行
+ I/O线程
    + 可使用SHOW SLAVE STATUS 查看I/O线程状态
    
###步骤
+ select version(); 查看mysql 版本号，最后相同， 必须保证主服务器不高于从服务器版本
+ Master
    1. 配置账户使用 REPLICATION SLAVE 权限 创建账户admin 密码 123456
    2. GRANT REPLICATION SLAVE ON *.* TO 'admin' @'127.0.0.1' IDENTIFIED BY '123456'
    3. 保证server-id 与slave 唯一即可
    ```mysql based
        [mysqld]
        log-bin=mysql-bin
        server-id=3306
    ```
    4. show master status;
     ```
        file                    position           Binlog_Do_DB     Binlog_lgnore_DB  Executed_Gtid_Set
        mysql-bin.000001        文件大小               主服务器控制binlog的过滤器选项    
    ```
+ SLAVE
    1. 保证server-id 与master 不一样
           ```mysql based
               [mysqld]
               log-bin=mysql-bin
               server-id=3308
           ```
    2. 启动从服务器 并开始从做主服务器binlog 文件中的事件
    3. 指定主服务器信息
    ```
    CHANGE MASTER TO master_host = '127.0.0.1',
    master_port = 3306,
    master_user = 'admin',
    master_password = '123456',
    master_log_file = 'mysql-bin.000001',
    master_log_pos = 0;
    ```
    4. SHOW SLAVE STATUS;
    ```
    Slave_IO_State   Slave_IO_Running   Slave_SQL_Running
                   Slave 服务器状态
   ```
+ START
    1. 子服务器 START SLAVE 开始复制
    2.  Waiting for master to send event I/O进程
        Slave has read all relay log; waiting for more updates SQL进程

1.从库停止主从复制
stop slave;
 
2.对主库数据库加锁
flush tables with read lock;
 
3.备份主库数据
mysqldump -uroot -p --databases testdb1 testdb2 > full_bak.sql
 
4.重置主库日志
reset master；
 
5.对主库数据库解锁
unlock tables;
 
6.删除旧数据
drop database testdb1;
drop database testdb2;
 
7.从库导入数据
source /tmp/full_bak.sql
 
8.重置从库日志
reset slave; 或者 reset slave all;
  
清理slave 同步信息：
---reset slave 仅清理master.info 和 relay-log.info 文件
---删除所有的relay log 文件，重启用一个新的relay log 文件。
---重置 MASTER_DELAY  复制延迟间隔为:0
---不清理内存里的同步复制配置信息
---不重置 gtid_executed or gtid_purged 参数值
  
reset slave;
（重启mysqld后，内存里的同步配置信息自动重置）
reset slave all;
---其他功能和reset slave 一样，唯一区别是：会立即清理内存里的同步配置信息。
  
9.开启主从复制
start slave;
  
10.查看主从复制状态
show slave status;
Slave_IO_Running: Yes
Slave_SQL_Running: Yes

### Q
  在备机的mysql上执行：show slave status \G
  发现Slave_SQL_Running: No
        Last_Errno: 1146
        Last_Error: Error 'Table 'opaq_151.vehicle_new' doesn't exist' on query. Default database: 'opaq_151'. Query: 'delete from vehicle_new where ID_>1700001960'；
  分析SQL语句发现，slave机上没有 vehicle_new 表，所以报错。
  这个时候想恢复的话，只要
  stop slave;
  set GLOBAL SQL_SLAVE_SKIP_COUNTER=1;
  start slave;
  就可以了
  
  set GLOBAL SQL_SLAVE_SKIP_COUNTER=1的意思是：
   跳过某个无法执行的命令
     1、set global sql_slave_skip_counter=N中的N是指跳过N个event
  
     2、最好记的是N被设置为1时，效果跳过下一个事务。
  
     3、跳过第N个event后，位置若刚好落在一个事务内部，则会跳过这整个事务
  
     4、一个insert/update/delete不一定只对应一个event，由引擎和日志格式决定
     
     
    
    
