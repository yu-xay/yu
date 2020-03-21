[我的下载](http://caiyun.feixin.10086.cn/dl/175Cjf9LVi9ol "lpuT")

### WINDOWS PHP扩展 ###  
1: phpinfo() 查看 Thread Safety	和 Architecture;

2: [下载redis](http://pecl.php.net/package/redis "http://windows.php.net/")

3: 点击DLL 选择对应的redis版本
```
 liblzf
     arrays.markdown
     cluster.markdown
     COPYING
     CREDITS
     php_redis.dll
     php_redis.pdb
     README.markdown
     sentinel.markdown
```
4: 复制php.redis.dll 到 {PHP根目录}/ext/

5: 打开php.ini, 写入
```
extension=php_redis.dll
```
6: 重启php;

### WINDOWS 控制台安装 ###  

### LINUX ###  
``````
待测
``````
#####附录
[Redis桌面管理 可搭配和彩云虚拟邮箱](https://redisdesktop.com/ "Redis Desktop Manager")