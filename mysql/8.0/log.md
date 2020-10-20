##日志
###错误日志
+ 包含mysqld的启动和宕机次数的记录，还包含一些诊断信息，例如： 错误，警告，以及服务器在启动丶运行及关闭期间发出的提升信息

+ log_error_verbosity 1 只输出错误 2输出错误和警告 3输出错误，警告和注释
+ log_error           日志位置
+ select @@log_error_verbosity   
+ select @@log_error_services => log_filter_internal; log_sink_internal
+ 日志事件按顺序 穿过内置的筛选器组件log_filter_internal  然后穿过日志写入组件log_sink_internal 
+ [更多](https://dev.mysql.com/doc/refman/8.0/en/error-log.html)

#### 轮转错误日志
shell> sudo mv /var/log/mysql/mysqld.log /var/log/mysql/mysqld.log.0 && /usr/local/mysql/bin/mysqladmin -uroot -p flush-logs 刷新日志
#### 使用系统日志记录
mysql> install component 'file://component_log_sink_syseventlog'  使用系统日志写入器(log_sink_syseventlog) 代替默认log_sink_internal
mysql> SET persist log_error_services = 'log_filter_internal; log_sink_syseventlog';

