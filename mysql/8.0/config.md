### 修改配置
+ set persist
    -  set persist max_connections=500
    - [csdn](https://blog.csdn.net/wll_1017/article/details/90291584)
    - set persist更改运行时变量值，将变量设置写入mysqld-auto.cnf数据目录中指定的选项文件 。
        数据库启动时，会首先读取其它配置文件my.cnf，最后才读取mysqld-auto.cnf文件
    - reset persist [max_connections] 取消持久

+ set session
    - 重启失效
    - 仅仅是对本次会话查询，不是针对于全部连接

+ set global
    - 重启失效
    - 仅对于新开启的会话才是有效的，对已经开启的会话不生效

+ 可在启动脚本中 使用mysql 参数

###配置参数
    + 数据目录
        + @@datadir 默认地址为 /var/lib/mysql
        + /data 日志丶innobd表空间丶innodb日志丶mysqld-auto.cnf丶ssl和RSA密钥
            + mysql MYSQL系统库
            + performance_schema: 提供用于在运行检查服务器的内部执行情况
            + sys ： 提供一组对象，帮助更轻松解释performance_schema信息
        + innodb_buffer_pool_size
            - 决定innoDB存储引擎可以使用多少内存空间来缓存内存中的数据和索引
            - 找出合适的数据集大小
        + innodb_buffer_pool_instances
            - 可以将innodb缓冲池划分不同区域，已便在不同 线程 读取和写入时减少争用 提高并发性
            - 如果缓存池大小为64g innodb_buffer_pool_instances为32 则每个区域大小为2
            - 如果缓存池大小超过16G，则可以设置实例，以便每个区域至少获得1G
        + innodb_log_file_size
            - 重做日志空间的大小，用于数据库崩溃时重放已提交的事务
    + 更改数据目录 移到更大卷
        - 检查数据目录位置
        - 停止mysql
        - 检查状态
        - 创建目录 sudo chown -R mysql:mysql /data/ 所有权更改到mysql
        - 移动目录
        - ubuntu 如果启用apparmor 则需要配置acccss control(访问控制)
        - 启动mysql
        - rm -rf 删除老数据
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            