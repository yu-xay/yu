#### EXPLAIN
+ [一张图彻底搞定 explain](https://learnku.com/articles/38719)

|   Column             |JSON Name ||
|     :---:     |     :---:     |     :---:     |
|      id       |  select_id    |  SELECT标识符 |
|  select_type  |               |  SELECT类型   |
|     table     |               |               |
|   partitions  |               |               |
|     type      |               |               |
| possible_keys |               |               |
|     key       |               |               |
|    key_len    |               |               |
|     ref       |               |               |
|     rows      |               |               |
|   filtered    |               |               |
|    Extra      |               |               |

+ id  SELECT的查询序列号
    + id相同，执行顺序由上至下
    + id不同，执行顺序由下至上 id越大 优先级越高

+ select_type  区分普通查询，联合查询，子查询等
    + #####select 子查询 from 派生表 where dependent 子查询 个人理解
    + simple        ---- 简单查询，不含子查询和UNION
    + primary       ---- 查询中若包含如何复杂的子部分，最外层查询会被标记PRIMARY
    + derived(衍生) ---- 在form子句中的子查询会被标记为derived，Mysql会递归执行这些子查询，把结果放到临时表中
    + subquery      ---- 出现在复制非相关的子查询中，简单相关子查询 mysql会进行改写
    + union         ---- 第二个select出现在union之后，则会被标记为UNION。
    + union result  ---- union的结果集
    + dependent union --- 在UNION中第二个或后面的SELECT语句，依赖于外部查询 select * from table where id in *(select * from table *union select * from table)
    + dependent subquery --- 在子查询中的第一个SELECT，依赖于外部查询 同上
    + materialized --- 物化子查询，子查询的结果通常缓存在内存中或临时表;  select * from *table where column in (select title form *news)
    + uncacheable subquery --- 表示子查询不能被物化，需要逐次运行 select * from table where id in (select count(*) from news where id = *@@sql_log_bin);
    + uncacheable union --- 子查询中的union不能被物化 select * from table where id = (select column from news where id = *@@sql_log_bin union select column form tables where id = *id=@@sql_log_bin)

http://itindex.net/detail/46772-%E4%BC%98%E5%8C%96-mysql-dependent

http://blog.chinaunix.net/uid-29491604-id-4849838.html
https://blog.csdn.net/daohengshangqian/article/details/50561477

+ table 输出的行所引用的表
    + <unionM,N>: M和N的id值的行的集合;
    + <derivedN>:  该行引用value为N的行的派生表的结果
    + <subqueryN>: 该行引用value为N的行的子查询的结果
+ partitions: 分区
    + 匹配查询记录的分区，非分区表， value为Null

+ type： 连接类型
    + system 
        + 是const的特例，表只有一行。一般是系统表
    + const 通过索引一次就能找到
        + 命中PK或UK
        + 被连接的部分是一个常量(const)值
    + eq_ref
        + join 查询
        + 命中PK或UK
        + 等值连接
        + 对于前表的每一行 后表只有一行命中
    + ref 非唯一索引 等值匹配 可能有多行命中
        +
    + range 索引上的范围扫描
        + between/in/>/<
    + index 索引上的全集扫描  差
        + count
        + sql使用了索引但没通过索引进行过滤 一般是 使用覆盖索引或者用索引排序分组
    + all 全表扫描  差
        
+ possible_keys: MySQL能使用哪个索引在该表中找到行。
    + SHOW INDEX FROM table 查看表索引

+ key：实际使用的索引

+ key_len 索引中使用的字节数
    + 可通过计算索引长度，越短越好

+ ref 显示索引的哪一列被使用了
    + 如果使用的是常数来作为查询条件，显示的是const
    + 如果是连接查询，会显示具体的字段。数据库，表，字段
    
+ rows: 行数
    + 大概估算出找到该记录所需要的行数。

+ filtered 按表条件过滤的行百分比

+ Extra 执行情况的描述和说明
    + using filesort 文件内排序
    
    + using temporary
    + using index
    + using where
    + 

#### REMAKE
 + 覆盖索引
 + in 和 =
 + [子查询优化的技术或优化策略](https://www.cnblogs.com/zengkefu/p/5769095.html)
 + http://blog.chinaunix.net/uid-29491604-id-4849838.html
 + https://blog.csdn.net/daohengshangqian/article/details/50561477
 + https://blog.csdn.net/jiadajing267/article/details/81269067
 + https://blog.csdn.net/sggtgfs/article/details/94434938

    