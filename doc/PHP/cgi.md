Module加载: 把PHP作为apache一个子模块运行，web 访问php文件是，apache就回调用php5_module解析php代码
```text
apache -> httpd -> php5_module -> sapi -> php
```
CGI: 通用网关接口 web server 与web application 交互的协议

PHP-CGI: 是CGI的实现版，会未每个请求fork一个进程，处理完成后退出（fork-and-execute模式）
```text
    缺点： 变更配置 需重启; 杀死php-cgi进程 php无法运行
```

[官网](https://www.php.net/manual/zh/install.fpm.php)
FastCGI： 像一个常驻（long-live）的cgi;类似于CGI，提高了CGI性能 可以说是一种协议
```text
    缺点： 多线程 会销毁更多的服务器内存；
    原理： 预先启动一个master进程读取配置文件，然后fork多个work进程等待连接，
            监听到请求后，分配work进程处理（处理完成不会轻易销毁）
```

PHP——FPM： 是FASTCGI的具体实现，负责管理一个进程池，来处理WEB服务器请求，可以检查管理;

nginx: => ngx_http_fastcgi_module => 把请求分发给PHPFPM处理