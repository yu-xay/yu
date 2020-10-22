##日志
###错误日志
+ 包含mysqld的启动和宕机次数的记录，还包含一些诊断信息，例如： 错误，警告，以及服务器在启动丶运行及关闭期间发出的提升信息

+ log_error_services 配置筛选和写入日志事件
    按顺序 穿过内置的筛选器组件log_filter_internal  然后穿过日志写入组件log_sink_internal

+ log_error_verbosity   =>  1 只输出错误 2输出错误和警告 3输出错误，警告和注释
+ log_error             =>  错误日志位置
+ [所有类型的错误日志](https://dev.mysql.com/doc/refman/8.0/en/error-log.html)

#### 轮转（rotate）错误日志
shell> sudo mv /var/log/mysql/mysqld.log /var/log/mysql/mysqld.log.0 && /usr/local/mysql/bin/mysqladmin -uroot -p flush-logs

#### 使用系统日志记录
+ mysql> install component 'file://component_log_sink_syseventlog'; #安装log_sink_syseventlog
+ mysql> SET persist log_error_services = 'log_filter_internal; log_sink_syseventlog';
** center: /var/log/message； ubuntu /var/log/syslog； windows: 事件查看器；可用pid区分

#### 用JSON格式记录错误日志
+ mysql> install component 'file://component_log_sink_json'; #安装json日志写入器
+ mysql> SET persist log_error_services = 'log_filter_internal; log_sink_json;';
** 会多生成类似 ----.log.00.json 的文件

#### [错误日志配置](https://dev.mysql.com/doc/refman/8.0/en/error-log-configuration.html)

###查询日志
* 一般记录mysqld在做的事。当客户端连接或断开连接时 服务器便将这个信息写入日志，并记录收到的每一条sql
    如果怀疑客户端存在错误，并且想知道客户端发送给mysqld的具体内容时，这是很有效的
* general_log=1
* general_log_file ="D:\\wamp\\bin\\mysql\\mysql-8.0.21-winx64\\data\\mysql-common.log"

###慢日志
* log_queries_not_using_indexes=0   #是否记录不使用索引语句
* log_slow_admin_statements=0       #是否记录管理语句 (e.g: alter table, analyze table ...)
* slow_query_log=1                  #开关
* long_query_time=10                #执行时间超过10s
* min_examined_row_limit=0          #至少扫描limit行
* slow_query_log_file="D:\\mysql-long.log"

### 选择日志输出位置
* log_output="FILE"          #默认FILE,TABLE 
- mysql.general_log 查询日志
- mysql.slow_log 慢日志
- create table mysql.general_log_new like mysql.general_log 创建新表
- rename table mysql.general_log to mysql.general_log_new 或者相换新旧

### 管理二进制文件