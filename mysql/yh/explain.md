#### EXPLAIN
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
    + simple        ---- 简单查询，不含子查询和UNION
    + primary       ---- 查询中若包含如何复杂的子部分，最外层查询会被标记PRIMARY
    + subquery      ---- 在select或where中包含子查询
    + derived(衍生) ---- 在form列表中包含的子查询被标记为derived，Mysql会递归执行这些子查询，把结果放到临时表中
    + union         ---- 第二个select出现在union之后，则会被标记为UNION。
                        如果union包含在from子句的子查询中，外层select 会标记为derived
    + union result  ---- union的结果集

    + 不常用高级 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    - dependent union --- 在UNION中第二个或后面的SELECT语句，依赖于外部查询
    - dependent subquery --- 在子查询中的第一个SELECT，依赖于外部查询
    - materialized --- 物化子查询
    - uncacheable subquery --- 对于该结果不能被缓存并且必须重新评估外部查询的每一行的子查询。
    - uncacheable union --- 第二个或者最面一个属于一个不可缓存的子查询在UNION中

http://itindex.net/detail/46772-%E4%BC%98%E5%8C%96-mysql-dependent
https://blog.csdn.net/jiadajing267/article/details/81269067
http://blog.chinaunix.net/uid-29491604-id-4849838.html
https://www.cnblogs.com/tufujie/p/9413852.html
https://blog.csdn.net/daohengshangqian/article/details/50561477

+ table 输出的行所引用的表
    + <unionM,N>: M和N的id值的行的集合;
    + <derivedN>:  该行引用value为N的行的派生表的结果
    + <subqueryN>: 该行引用value为N的行的子查询的结果
+ partitions: 分区
    + 匹配查询记录的分区，非分区表， value为Null

+ type： 连接类型
    + system 
        + 是const的特例，表只有一行。
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
        + between/in
    + index 索引上的全集扫描  差
        + count
    + all 全表扫描  差
        
+ possible_keys: MySQL能使用哪个索引在该表中找到行。
    + SHOW INDEX FROM table 查看表索引

+ key

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


    