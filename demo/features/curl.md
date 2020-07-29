
[官网](https://curl.haxx.se/libcurl/c/libcurl-errors.html)

> + Q: curl(52) Empty reply from server_curl
> + A: 
>   + 防火墙或网络问题
>   + http协议问题
>   + 特殊字段&被截断


#### [html Code]
> + Q: 502 网关错误 PHP-CGI 得到一个无效响应
> + A: 
>   + php.ini 的memory_limit 过小
>   + php-fpm.conf 中 max_children、max_requests 设置不合理
>   + php-fpm.conf 中 request_terminate_timeout、max_execution_time 设置不合理
>   + php-fpm 进程处理不过来，进程数不足、脚本存在性能问题
>
> + Q: 504 PHP-CGI没有在指定时间响应请求
> + A:
>   + Nginx+PHP 架构，可以调整 FastCGI 超时时间，fastcgi_connect_timeout、fastcgi_send_timeout、fastcgi_read_timeout
>
>+ Q: 500 
>+ A:
>   + PHP代码问题，文件权限问题，资源问题
>
> + Q: 503
> + A:
>   + 超载或停机维护
>