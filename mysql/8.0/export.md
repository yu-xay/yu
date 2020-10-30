#### 备份
- 逻辑备份
    - 将数据库，表结构和存储过程导出到一组可再次执行的SQL语句中，以重新创建数据库的状态
    - example:  mysqldump, mysqlpump 和mydumper(mysql 不提供)
- 物理备份
    - 包含系统上所有文件，这里的系统指数据库用户存储所有数据库的实体
    - example： xtraBackup(mysql 不提供) 和普通文件备份
    
### 备份工具
#### mysqldump
+ 名称
    + [OPTIONS] : -h主机名 -P端口 -u用户名 -p密码
    + [TABLE]: 数据库名
    + [DUMP.sql]: 导出文件名

+ mysqldump [OPTIONS] --database [table] > [DUMP.sql]
    + <8.0 存储过程和事件存储在mysql.proc和mysql.event表中
    + mysqldump [OPTIONS] --all-databases > [DUMP.sql]
    + =8.0 存储过程和事件存储在数据字典表中，但这些表不会被备份
    + mysqldump [OPTIONS] --all-databases --routines --triggers --events > [DUMP.sql]

+ 时间点恢复 应指定 以下
    + --single-transaction 
        - 在执行备份前，通过将事务隔离改为REPEATABLE-READ，并执行START TRANSACTION 来提供一致的备份
        - 仅适用InnoDB之类的事务表，因为在 start transaction 执行时保持数据库的一致而不堵塞如何应用程序
    + --master-data
        - 将服务器二进制日志输出到 dump 文件，如果--master-data=2, 它将打印为注释
        - 使用FLUSH TABLES WITH READ LOCK来获取二进制日志的快照，这是危险的
    + mysqldump --all-databases --routines --events --single-transaction --master-data > dump.sql

+ 保持主库二进制日志位置
    + 备份始终在从服务器上进行。要获取备份主服务器二进制文件位置， 使用--dump-slave
    + 如果在主服务器进行备份，使用--master-data
+ 常用参数
    * --database [DATABASES] --tables [TABLES]          =>  指定数据库和表
    * --ignore-table=[DATABASES].[TABLES]               =>  忽略表 可多次使用改指令 
    * [...][TABLES] --where="param > '3.45' LIMIT 5"    =>  添加过滤信息
    * --hostname       => 远程备份 确保用户具有适当的连接备份权限

+ 重建另一个具有不同schema的服务器的备份
    * --no-date                   => 仅备份不包含数据的schema
    * --complete-insert           => 备份不包含schema的数据 （会在insert中打印列名）
+ 用于与其他服务器合并的数据备份
    * --replace                  => 代表使用REPLACE INSERT 而不是 INSERT
    * --skip-add-drop-table      => 不会将DROP TABLE 语句写入
    * --no-create-info           => 将跳过文件的CREATE TABLE 语句
    * 写入dump文件可以使用insert ignore 代替replace  => 即保留服务器现有数据并 忽略插入错误 插入新数据
    

#### mysqlpump
+ 并行处理
    * --result-file=[DUMP.sql]         => 生成文件
    * --default-parallelism=[NUM]      => 使用NUM 个线程完成备份
    * --parallel-schemas=[NUM]:[DATABASE],[DATABASE] => 为数据库单独分配线程
+ 使用正则排除/包含数据库对象
    * --include-databases=%[prod]         => 对prod结尾的库 备份
    * --exclude-tables=[TABLE]            => 排除 数据库中名称为TABLE的表
    * --include-routines, --include-events --exclude-triggers
    * [更多](https://dev.mysql.com/doc/refman/8.0/en/mysqlpump.html#mysqlpump-filtering)
+ 备份用户
    - mysqldump中 不会在create user和grant 获取用户的备份，因此 必要要备份mysql.user
    * --users              => 备份成账户管理语句(create user 和 grant)，而不是将用户账户插入mysql系统库中
    * --exclude-users=root => 排除莫些用户
+ 压缩备份
    * --compress-output=[lz4, zlib]  => 需要有对应的解压缩工具
+ 加速重复加载
    * 辅助索引从CREATE TABLE 语句中删除了，这将加速恢复过程，
    * 因此将使用ALTER TABLE 语句 在INSERT 结尾添加这些索引
    ** 8.0开始 mysqldump和mysqlpump仅能dump mysql系统数据库中非数据字典表(之前可dump 全部)

#### mydumper
+ 说明 类似于mysqlpump 相比于mysqlpum 第三方
    - 并行和性能 提高
    - 一致性 mysumper维护所有线程的快照，提高准确的主库和从库日志位置等，mysqlpump不能保证一致性
    - 易于管理输出，（表和元数据文件分类，方便查看和解析）
    - 使用这种表达式包含和排除数据库对象
    - 有用户终止阻塞备份和所有后续查询的长事务的选项

#### 普通文件备份
    + 不适合每日备份，适用在维护时段进行升级或降级使用，或主机交换时使用
    + （测试无效，不建议该备份）

#### XtraBackup 备份
    + 开源热备份，能在不关闭服务器的情况下复制普通文件
    + [官网](https://www.percona.com/doc/percona-xtrabackup/8.0/index.html)

#### 锁定实例进行备份 8.0
    + 允许在线备份期间的DML,并阻止可能导致快照不一致的所有操作
    + [](https://dev.mysql.com/doc/refman/8.0/en/lock-instance-for-backup.html)
    + LOCK INSTANCE FOR BACKUP    锁定实例
    + UNLOCK INSTANCE             解锁实例

### 使用二进制日志进行备份
























    