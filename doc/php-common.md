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

php的自定义头信息都可以使用大写$_SERVER['HTTP_*']来获取

heredoc语法
魔术常量
`````