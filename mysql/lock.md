[innoDb](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/innodb-locking.html)
```
update table set str =  '1'  where id = 1 and  version = version; 乐观锁
悲观锁：update {table_name} set {column_name} = {value} for update; ***测试注意加事务***
```
+ Shared and Exclusive Locks 共享锁(S锁)和排他锁(X锁) => 悲观锁 测试
    + S锁允许事务读取一条记录
    + X锁允许事务更新或删除一条记录的锁
    + |transaction 1|→|transaction 2|
      |:---:|:---:|:---:|
      |S锁|→|S锁(可以立即授予S锁)|
      |S锁|→|~~X锁~~(不予受理)|
      |X锁|→|无论什么锁都会被堵塞|
+ Intention Locks 意向锁 让表锁和行锁共存 表级锁
    + 意向共享锁(IS): 事务T想对表中各个行加上S锁 *SELECT ... LOCK IN SHARE MODE*
    + 意向排他锁(IX): 事务T想要表中各个行加上X锁 *SELECT ... FOR UPDATE*
    + |     |X    |	IX  |S    |IS   |
      |:---:|:---:|:---:|:---:|:---:|
      |X    |互斥 |互斥 |互斥 |互斥|
      |IX   |互斥 |兼容 |互斥 |兼容|
      |S    |互斥 |互斥 |兼容 |兼容|
      |IS   |互斥 |兼容 |兼容 |兼容|

+ Record Locks 行锁 加在索引上的锁

+ Gap Locks 间隙锁

+ Next-Key Locks Next-Key锁

+ Insert Intention Locks 插入意向锁

+ AUTO-INC Locks 自增长锁 
    + 特殊的表级锁
+ Predicate Locks for Spatial Indexes 空间锁












[5.7](https://dev.mysql.com/doc/refman/5.7/en/internal-locking.html)
row-level: 
    优点： 更少的锁冲突；回滚的变换较少；可以长时间锁定单行；
