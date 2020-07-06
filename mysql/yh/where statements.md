####官网说明
#####where
[博客园](https://www.cnblogs.com/katec/p/9324735.html)

3. MYSQL 优化
- [中文](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/optimize-overview.html#%E4%BC%98%E5%8C%96%E6%A6%82%E8%BF%B0)
- [英文](https://dev.mysql.com/doc/refman/5.7/en/optimization-indexes.html)
1. 常量叠算。

2. 删除不必要的括号

3. 消除无用的SQL条。

4. 被索引使用的常量表达式只被计算一次 
    + key = 35 + 3       =>   key = 38
    
5. 对于MyISAM和MEMORY表，单表进行count(*)没有where条件时,会直接从表的信息里返回结果，
    而不是实际执行count(*)语句，这也适合任何不为null的表达式。
    + select count(*) table  =>   select count(col1) table
    
6. 尽早检测无效的常量表达式  Impossible WHERE

7. 如果不使用group by 或聚合函数(count()...),尽量将having 和 where 合并

8. 对于每个进行join的表，构造更小的where条件结果集，使得where添加跳过一些行，使查询更快速。

9. 所有常量表的读取要快于其他表
    ````定义
    一个空表或一个一行数据的表
    与主键上的where子句或唯一索引一起使用的表，其中所有索引部分都与常量表达式比较，并定义为Not null;
    ````

10. [疑问]试着将所有join关联表的组合找到最好的组合。如果和order By和group By条件是同一个表，那么这个表会被第一个进行join;

11. [疑问]如果有group By 和order By不同的子句，或者这个order By或group By子句不在第一个表上，就会创建一个临时表；

12. 如果使用 SQL_SMALL_RESULT 进行修饰，MYSQL 会使用内存临时表；

13. 查询每个表索引，并使用最佳索引，除非优化器认为使用表扫描更有效。 => explain.md
    ````text
        曾今，根据最好的索引是否超过表的30%来扫描，但是固定的百分比不再决定是否使用索引。
        优化器现在更加复杂，它的估计基于其他因素，如表大小，行数 I/O块大小
    ````

14. 在一些情况。如果所有字段都在索引里，mysql读所有行数据都从索引读取，不再需要去数据文件读取，使用索引tree读取。

15. 在输出每一行之前，将跳过不匹配所有having字句的行；