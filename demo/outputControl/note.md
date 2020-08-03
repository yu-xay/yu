- [PHP输出缓冲区的总结](https://blog.csdn.net/ligupeng7929/article/details/87936868)

#### output_buffering
```
    on/off 或者整数 。
    设置为on时，将在所有脚本中使用输出缓存控制。
    而设置为整数时，如output_buffering=4096，当缓存数据达到4096字节时会自动输出刷新缓存。
    而这个参数的不同正是导致以上代码在不同时候执行结果不同的原因。
    当output_buffering关闭时，脚本所有的输出（echo）都会即时发送到客户端，执行上面代码时就是每秒输出一个数字。
    而开启output_buffering后，输出内容就会先缓存在服务端，直到脚本结束时才一起发送给客户端。
```

#### implicit_flush
```
    是否 自动刷新apache缓存区
    设定ON意味着，当脚本有输出时，自动立即发送到客户端。相当于在echo后自动加flush()。
```

```开始ob后， 一些Web服务器的output_buffering默认是4069字符或者更多 ```
1. 在服务中 如果开启了ob缓存，则echo出来的数据就首先会放入ob中
2. 当php页面执行到最后，则会把ob缓存的数据(如果有的话)， 强制刷新到程序缓存，
    然后通过服务器（apache）对数据进行封装，返回给浏览器
3. 如果没有ob，所有的数据直接放入程序缓存；

[php文档](https://www.php.net/manual/zh/function.flush.php)
```
flush()           将发送指令发送到apache，让apache刷新自身的输出缓冲区， 全部输出至浏览器；
ob_start()        此函数将打开输出缓冲。当输出缓冲激活后，脚本将不会输出内容（除http标头外），相反需要输出的内容被存储在内部缓冲区中。
ob_flush()        指示PHP本身刷新自身的缓冲区,把数据发送到apache，删除缓冲区的内容，不关闭缓冲区。
ob_clean()        清空输出缓冲区中的内容
ob_end_clean()    清空缓存内容，并关闭缓存
ob_end_flush()    输出当前服务器端缓存的输出数据，清空缓存内容，并关闭缓存

ob_get_contents() 获取缓冲区里的内容，并保留缓存。
ob_get_clean()    获取缓存中的数据，并清空缓冲区，相当于依次执行ob_get_contents()和ob_end_clean()。
ob_get_flush()    获取缓冲区里的内容，并且把这些内容发送给apache，并关闭输出缓冲区 //相比与ob_get_clean() 会输出打印缓冲区

ob_get_length()   返回缓存中数据的长度。
ob_get_level()    返回输出缓冲机制的嵌套级别
ob_get_status()   得到所有输出缓冲区的状态

ob_gzhandler()：    使用gzip压缩缓存数据。用于将文本数据压缩后再发送到客户端，可以极大减少数据传输所用的时间，对于提高网站浏览速度帮助很大。通常作为ob_start()的回调函数来使用。
ob_implicit_flush() 相当于开启php.ini中的implicit_flush参数，立即发送脚本的输出。
ob_list_handlers()  列出所有输出使用的操作方法。
```

### 流程：
    + php echo,var_dump -> php output_buffering -> webServer buffer-> browser buff-> browser display

## 用途 ##
1. 使用缓冲区可以避免header setcookie 脚本输入前报错
    一遇到header函数，php马上执行apache发送一个http，而输出的数据存放在缓冲区，等待输入
2. php下载大文件
    + feature/header $class->downBigFile();
    + 可以while循环，一段一段读取文件输送到浏览器，否则全读。
    + 解决了内存问题和用户等待时间
3. 静态文件缓存
    + ob_get_content + file_put_content()
4. 模板使用 导入 .=> test5


## 补充 ##
+ ![Nginx](https://cdn.learnku.com/uploads/images/202003/06/58556/1ZLQnYZAD3.png)



