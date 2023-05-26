
### 队列监听
0. 信号监听 处理退出相关信号 循环处理暂停
1. 开启1s 事务锁moving_lock.
2. 移出 delayed到期mq 和 reserved进行中(执行失败) 到 waiting中.                                                  
3. 取出waiting 中的一条数据.
4. 添加为执行中的数据(设置延迟过期2) 和 新增重试为1.
5. 执行队列，执行成功或重试后 删除message,attempts，reserved 中对应id数据. //  执行失败 循环执行步骤1

### 队列添加
+ 根据延迟时间加入waiting或delayed

