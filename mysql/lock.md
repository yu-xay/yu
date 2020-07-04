[innoDb](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/innodb-locking.html)
```
update table set str =  '1'  where id = 1 and  version = version; 乐观锁
```
+ Shared and Exclusive Locks 共享锁(S锁)和排他锁(X锁) => 悲观锁 测试
    > + S锁允许事务 =>    读取   => 一条记录的锁
    > + *SELECT ... LOCK IN SHARE MODE*
    > + 事务T对数据对象A加上S锁，则事务T可以读A但不能修改A
    > + 其他事务只能再对A加S锁，而不能加X锁，直到T释放A上的S锁。
    > + 保证其他事务可以读取A,但在T释放A上的S锁之前不能对A做任何修改

    > + X锁允许事务 => 更新或删除 => 一条记录的锁
    > + *SELECT ... FOR UPDATE*
    > + 若事务T对数据对象A加上X锁，事务T可以读A也可以修改A，
    > + 其他事务不能再对A加任何锁，直到T释放A上的锁。
    > + 这保证了其他事务在T释放A上的锁之前不能再读取和修改A。
    > + > 为什么可以读????
+ Intention Locks 不与行级锁冲突的表级锁 让表锁和行锁共存
    - [详解 MySql InnoDB 中意向锁的作用](https://juejin.im/post/5b85124f5188253010326360);
    + 意向锁是有数据引擎自己维护的，用户无法手动操作意向锁;
    + 意向共享锁(IS): 事务想获得一个表中某几行的S锁;必先获取表的IS锁。 V
    + 意向排他锁(IX): 事务想获得一个表中某几行的X锁;必先获取表的IX锁。 V
    + |     |IX   |IS   |
      |:---:|:---:|:---:|
      |IX   |兼容 |兼容|
      |IS   |兼容 |兼容|

    + |     | IX  |IS   |
      |:---:|:---:|:---:|
      |X    |互斥 |互斥|
      |S    |互斥 |兼容|
    + ##### 这里的排他 / 共享锁指的都是表锁！！！
    + ##### 意向锁不会与行级的共享 / 排他锁互斥！！
    1. 事务A申请意向锁
    2. 事务A检查到事务B持有意向锁
    3. 意向锁之间并不互斥 获取到 意向排他锁
    4. 该行无如何排他锁，成功获取到该行的排他锁
    
    总结
    ```text
        1. InnoDB 支持多粒度锁，特定场景下，行级锁可以与表级锁共存。
        2. 意向锁之间互不排斥，但除了 IS 与 S 兼容外，意向锁会与 共享锁 / 排他锁 互斥。
        3. IX，IS是表级锁，不会和行级的X，S锁发生冲突。只会和表级的X，S发生冲突。
        4. 意向锁在保证并发性的前提下，实现了行锁和表锁共存且满足事务隔离性的要求。
    ```
+ Record Locks 记录锁 为某行记录加锁，封锁该行的索引记录
    ```sql
      select * from table where id = 1 for update
    ```
    + id列必须是唯一索引且精准匹配，不能为 >、<、like等，否则上述语句加的锁会变成 临键锁。
    + 通过主键索引 与 唯一索引 对数据行进行 UPDATE 操作，也会对该行数据加 记录锁。
+ Gap Locks 间隙锁 锁定一定范围内的索引记录。
    + 锁定的是一个区间，而不仅仅是这个区间的每一条数据。

+ Next-Key Locks 临键锁 
    +  每个数据行上的非唯一索引列上都会存在一把临键锁，当某个事务持有该数据行的临键锁时，会锁住一段左开右闭区间的数据
    +  临键锁只与非唯一索引列有关，在唯一索引列（包括主键列）上不存在临键锁

https://juejin.im/post/5b8577c26fb9a01a143fe04e

+ Insert Intention Locks 插入意向锁

+ AUTO-INC Locks 自增长锁 
    + 特殊的表级锁
+ Predicate Locks for Spatial Indexes 空间锁

## 查看锁
information_schema下面有三张表:INNODB_TRX、INNODB_LOCKS、INNODB_LOCK_WAITS，

## 表锁
+ [官网](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/lock-tables.html)
+ 读锁定 LOCK TABLES [table] READ; 该线程和所有其他线程只能从表中读数据，不能进行任何写操作。
+ 写锁定 LOCK TABLES [table] WRITE; 只有拥有这个锁的线程可以从表中读取和写表。其它的线程被阻塞。
+ 解除锁定 UNLOCK TABLES;










[5.7](https://dev.mysql.com/doc/refman/5.7/en/internal-locking.html)
row-level: 
    优点： 更少的锁冲突；回滚的变换较少；可以长时间锁定单行；
