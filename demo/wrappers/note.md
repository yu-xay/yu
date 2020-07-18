#### php:// ####
+ cli.php
+ php://memory 内存中读写临时数据
+ php://temp/maxmemory:NN 写入文件


+ php://input 可以访问请求的原始数据的只读流

1.无法获取$_GET数据。
是因为$_GET数据作为query_path写在http请求头部(header)的PATH字段，而不是写在http请求的body部分。

2.而php://input 通过输入流以文件读取方式取得未经处理的POST原始数据;

3: Content-Type="multipart/form-data" 的时候 php://input 是无效的

4.Coentent-Type仅在取值为application/x-www-data-urlencoded和multipart/form-data两种情况下，
PHP才会将http请求数据包中相应的数据填入全局变量$_POST

```html
<form action="post.php" method="post" enctype="multipart/form-data"> 
            <input type="text" name="user"> 
        <input type="password" name="password"> 
            <input type="submit"> 
</form>
```
```php
$raw_post_data=file_get_contents("php://input",'r');
var_dump($raw_post_data,$_POST);
```