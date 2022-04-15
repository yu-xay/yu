+ 类型：
    + String 存放一些静态资源，支持incr 做统计计算
    + List 队列 rpush放队尾 lpop放队头
    + Set hastTable实现 快速查找记录是否存在，记录不能重复的数据
    + Sorted Set SkipList(跳跃表) 实现排序 可以构建优先级的队列
    + HASH 适应存放对象
+ 支持排序 List Set Sorted Set
    + SORT key [BY pattern] [LIMIT start count] [GET pattern] [ASC | DESC] [ALPHA] [STORE dstkey]
    + SORT key 简单排序 默认ASC
    + By tese*: 给定模式排序
    + limit 0 2: 限制数量
    + ALPHA : 字母排序
    + store cachelist: 结构集缓存为cachelist
+ 事务
    + 只能保证每个命令能够连续执行，不支持回滚操作
    
+ config get | config set | config rewrite
+ 持久化：
    + 内存快照 Snapshotting
        + 将内存完整数据以快照方式写入二进制文件中 （dump.rdb）
        + 客户端 使用save和bgsave命令 执行内存快照  save会堵塞，bgsave会fork一个进程
        + save <seconds> <changes> 经过seconds 或changes 次 进行一次内存快照
    
    + 日志追加 Append only file AOF
        + 把增加，修改数据的命令通过write函数追加到文件尾部 （默认appendonly.aof）
        + 由于操作系统I/O接口缓存，所以日志追加不可能立即写入文件中
            + appendonly yes 启用追加
            + appendfsync #everysec 每秒fsync操作写入磁盘 #no写入磁盘 依赖于系统 #always 每一次写 都会调用fsync
        + bgrewriteaof 异步类似于内存快照方式将内存的数据 重写 AOF

+ Redis替代Session 
    + 使用函数 session_set_save_handler() 即可

+ Redis内核
    + 内存淘汰 Redis集群 追加内存
        + maxmemory-policy 指定算法 noeviction
        + 随机淘汰算法： 数据库中随机删除一个key
        + LRU淘汰算法：删除一个最近的key
        + TTL淘汰算法： 数据库中删除一个最快过期的key
    + 对象引用计算器
        + redis 对象结构体(Redis Object) 中 有个 [int refcount]
        + 对象初始化时 refcount = 1;
        + a客户端调用 get命令 引用计数器 ++            incrRefCount
        + b客户端调用 del命令 引用计数器 减1 [还未删除] decrRefcount
        + a客户端get命令完成后 引用计数器 减1 [真正删除]
    + 自动关闭超时连接
        + conf timeout 超时时间 
        + closeTimeoutClients函数遍历所有的客户端连接，
            然后用现在时间减去最后一次操作的时间与timeout配置的时间比较
        + freeClien 超过关闭客户端连接
    + 清楚过期数据
        1. 定时器，每100毫秒redis 调用activeExpireCycle进行过期数据的操作
           + 随机获取一些数据的过期时间，判断是否从内存中删除，
                每次随机取10个数据，如果有超过25%的数据到达过期时间
                这个步骤就会继续执行下去
        2. get,hget等命令获取数据时 
            + redis调用expirelfNeeded函数删除过期的数据 [但仅限于当前获取的数据]
               判断当前获取的数据是否过期，如果则会调用 db Delete函数删除
               
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        