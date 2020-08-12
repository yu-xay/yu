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
    master_log_file = 'mysql-bin.000367',
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
    
  
    
    
