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
1: [和彩云下载](http://caiyun.feixin.10086.cn/dl/175Cjf9LVi9ol"https://github.com/MSOpenTech/redis/releases")

2: 配置命令环境

### LINUX(未测试) ###  
![菜鸟教程](http://download.caiyun.feixin.10086.cn:80/storageWeb/servlet/GetFileByURLServlet?root=/mnt/wfs75&fileid=K4630f8ac8f2b7338958be490632069ffa.png&ct=1&type=1&code=B0906A5B9D793627B533F2BE9D3BEFD41877E55B730C30A428E213A6EFADFDC7&exp=36689&account=MTM5NjYzNDkxODY=&p=0&ui=1711WlBcR1F3&ci=1711WlBcR1F3055202003230928482mx&cn=Linux%E4%B8%8B%E5%AE%89%E8%A3%85&oprChannel=10000025&dom=D971)

#####附录
[Redis桌面管理 可搭配和彩云虚拟邮箱](https://redisdesktop.com/ "Redis Desktop Manager")
[我的下载](http://caiyun.feixin.10086.cn/dl/175Cjf9LVi9ol "lpuT")