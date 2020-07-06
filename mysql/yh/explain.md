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

+ table 输出的行所引用的表
    + <unionM,N>: M和N的id值的行的union;
    + <derivedN>:
    + <subqueryN>:
    + partitions

    