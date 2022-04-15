#### windows安装
1. [下载mysql社区服务器](https://dev.mysql.com/downloads/mysql/)
2. 新建mysql.ini 文件
```
[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8 
[mysqld]
#设置3306端口
port = 3306 
# 设置mysql的安装目录
basedir=D:\\mysql-5.7.19-winx64
# 设置mysql数据库的数据的存放目录
datadir=D:\\mysql-5.7.19-winx64\\data
# 允许最大连接数
max_connections=200
# 服务端使用的字符集默认为8比特编码的latin1字符集
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
```
3. 进入/bin/ 执行 ./mysqld --initialize-insecure 
```
mysqld –initialize-insecure自动生成无密码的root用户，
mysqld –initialize自动生成带随机密码的root用户。
```
4. ./mysqld -install (remove 卸载) 安装mysql
5. net start mysql 启动mysql