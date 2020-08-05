###主从复制
#### 配置
   slaveof 192.168.1.1 6379 #指定Master的IP和端口
####原理
1. Slave服务器主动连接Master服务器
2. Slave服务器发送SYCN命令到Master服务器请求同步
3. Master服务器以快照方式写入rdb文件 同时主进程收集命令
4. Master服务器把rdb文件传输给Slave服务器
5. Slave服务器情况数据库数据，把rdb文件导入数据库
#### Slave工作流程 
1. 调用anetTcpConnect 连接master服务器
2. 如果master需要认证 先进行认证
3. 发送Sync命令请求同步
4. 监听Master服务器是否可读 可读的话 修改同步状态
5. 读取内存快照文件，保存到本地
6. 清空Slave数据库，导入快照

#### Master工作流程
1. 如果服务器进行内存快照 true 判断是否由slave触发 等待备份结束再次发起请求
2. 遍历slave如果salve需要新的内存备份，则会发起新的内存快照备份
3. 将客户端修改命令转发slave服务器 实现同步

#### reids 2.6~ 删除VM