###主从复制
#### 配置
   slaveof 192.168.1.1 6379 #指定Master的IP和端口
####原理
1. Slave服务器主动连接Master服务器
2. Slave服务器发送SYCN命令到Master服务器请求同步
3. Master服务器以快照方式写入rdb文件 同时主进程收集命令
4. Master服务器把rdb文件传输给Slave服务器
5. Slave服务器情况数据库数据，把rdb文件导入数据库
#### Slave工作流程 Master工作流程
+ 不纪录 了解即可
#### reids 2.6 删除VM