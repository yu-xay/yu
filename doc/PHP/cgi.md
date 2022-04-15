Module加载: 把PHP作为apache一个子模块运行，web 访问php文件是，apache就回调用php5_module解析php代码
```text
apache -> httpd -> php5_module -> sapi -> php
```
###CGI (网关)
+ 通用网关接口 web server (nginx) 与web application (php) 交互的协议.
+ 确定web Server 也就是内容分发服务器传递过来什么数据，什么样格式的数据

###PHP-CGI
+ 是CGI协议进程解释器 每次会fork一个进程，处理完成后退出（fork-and-execute模式）
+ 用来执行PHP代码
+ 执行顺序
    - 加载php.ini
    - 初始化环境
    - 处理请求
    - 返回内容给Web Server
    - 退出进程
+  缺点： 变更配置 需重启; 杀死php-cgi进程 php无法运行
+  ![图片](http://mrw.so/5BCBhH "")

###FastCGI协议
+ 像一个常驻(long-live)的cgi；类似于CGI,提高了CGI性能
+ 预先启动一个master进程读取配置文件初始化环境，然后fork多个work进程等待连接，
    监听到请求后，分配work进程处理（处理完成不会轻易销毁）
+ 因为多线程 所以会比cgi消耗更多的服务器内存
+ ![图片](http://mrw.so/5u6rGY)
###PHP-FPM
+ ![fpm](https://www.php.net/manual/zh/install.fpm.php)
+ 是FastCGI的实现，负责管理一个进程池。
+ 平滑重启原理
    - 修改php.ini 会启动新多worker进程加载新多配置，之前已存在多进程会才work完成后销毁
+ nginx工作原理
    - ngx_http_fastcgi_module   把请求分发给PHPFPM处理
    - 每次nginx监听到80端口的url请求，会对url进行location匹配，如果匹配到会继续内部请求重定向
    - 而对于到location配置规则会将请求发送给监听9000端口到php-fpm到master进程

+ ```php-fpm
    daemonize	yes	设置 FPM 在后台运行
    [global]
    pid = /www/server/php/73/var/run/php-fpm.pid           	PID文件的位置
    error_log = /www/server/php/73/var/log/php-fpm.log      错误日志的位置
    log_level = notice   //alert:必须立即处理、error:错误情况、warning:警告情况、notice:一般重要信息、debug:调试信息
    
    [www]
    listen = /tmp/php-cgi-73.sock                     设置接受 FastCGI 请求的地址
    listen.backlog = 8192
    listen.allowed_clients = 127.0.0.1
    listen.owner = www
    listen.group = www
    listen.mode = 0666
    user = www
    group = www
    pm = dynamic //static dynamic ondemand
    pm.status_path = /phpfpm_73_status
    pm.max_children = 80                    //允许创建的最大子进程数
    pm.start_servers = 5                    //动态方式下的起始进程数（服务启动后初始进程数量）
    pm.min_spare_servers = 5                //动态方式下的最小空闲进程数（清理空闲进程后的保留数量）
    pm.max_spare_servers = 20               //动态方式下的最大空闲进程数（当空闲进程达到此值时清理）
    request_terminate_timeout = 100
    request_slowlog_timeout = 30             //慢日志超时
    slowlog = var/log/slow.log               //慢日志
    ```
  
+ ![图片](http://mrw.so/6kK8pU "")