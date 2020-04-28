######下载图片
```
header('Content-type: image/jpeg');
header('Content-Disposition: attachment; filename=download_name.jpg');
readfile($yourFilePath);
```
####其他
`````
self只能引用当前类中的方法，而static关键字允许函数能够在运行时动态绑定类中的方法。;

error_log(json_encode($data,JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");

$_SERVER['REQUEST_TIME']要好于time();

php的自定义头信息都可以使用大写$_SERVER['HTTP_*']来获取

git cherry-pick 移花接木
`````

```
//phpfpm配置

pm.max_children = 最大并发数

详细的答案：
pm.max_children 表示 php-fpm 能启动的子进程的最大数量。
因为 php-fpm 是多进程单线程同步模式，即一个子进程同时最多处理一个请求，所以子进程数等于最大并发数。
但是实际使用中一般不用考虑，因为php默认配置为动态均衡的子进程管理，不用手动设置这些配置。
```
```
round(memory_get_usage() / 1024 / 1024, 2) . ' MB'. PHP_EOL  MB 为单位获取内存使用量
```