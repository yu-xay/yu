### 事务 ACID ###
如果一个数据库声称支持事务的操作，那么该数据库必须要具备以下四个特性：
- 原子性（Atomicity）  指一个事务要么全部执行,要么不执行.也就是说一个事务不可能只执行了一半就停止了
- 一致性（Consistency）指事务的运行并不改变数据库中数据的一致性.例如,完整性约束了a+b=10,一个事务改变了a,那么b也应该随之改变
- 隔离性（Isolation）  事务的独立性也有称作隔离性,是指两个以上的事务不会出现交错执行的状态.因为这样可能会导致数据不一致
- 持久性（Durability） 事务的持久性是指事务执行成功以后,该事务所对数据库所作的更改便是持久的保存在数据库之中，不会无缘无故的回滚.

### 隔离性 ###
- 脏读：一个事务读取到了其他事务还没有提交的数据；
- 不可重复读：一个事务在进行中读取到了其他事务对旧数据的修改结果；
- 幻读：读取到了其他事务新增的数据，仿佛出现了幻象。(幻读与不可重复读类似，不可重复读是读到了其他事务update/delete的结果，幻读是读到了其他事务insert的结果);
- 更新丢失：当两个事务选择同一行，然后更新数据，由于每个事务都不知道其他事务的存在，就会发生丢失更新的问题；


### MySQL数据库 为我们提供的四种隔离级别  ###
+ SHOW VARIABLES LIKE "%tx_isolation%

| 隔离级别 | 脏读 | 不可重复读 | 幻读 |
| --- | --- | --- | --- |
| Read Uncommitted （读取未提交内容） | √ | √  | √ |
| Read Committed （读取提交内容） | × | √ | √ |
| Repeatable Read （可重复读）Mysql默认 | × | × | √ |
| Serializable （可串行化） | × | × | × |

### 锁 ###
- 乐观锁：
  update table table_name
  set column_name = value, version=version+1
  and
  where version = version;
- 悲观锁：update table table_name set column_name = value for update;
- 共享锁：x锁
引擎