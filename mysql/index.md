+ [中文文档](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/mysql-indexes.html)
https://www.percona.com/blog/2013/01/09/how-does-mysql-replication-really-work/
### 单列索引
+ PRIMARY KEY 主键适应
+ UNIQUE 唯一索引
+ NORMAL 普通索引
+ SPATIAL 空间索引 =>  R-trees
+ FULLTEX 全文索引
###
联合索引：实际建立了(a)、(a,b)、(a,b,c) 三个索引;
最左侧原则：
1:顺序可以任意的 a=1 and b=2 和 b=2 and a=1;

覆盖索引：一条索引包含(或覆盖)所有查询字段的值，即只需扫描索引而无需会表； explain => using index

索引前缀： 创建仅使用列的前N个字符的索引，可以使索引文件更小；

##### 依据是否聚簇区分

- 聚簇索引
  + 引擎类型：InnoDB
  + 叶子结点存放数据本身
- 非聚簇索引
  + 引擎类型：MyISAM
  + 叶子结点存的指针指向数据的实际地址，索引和数据分开
#### explain
```
index   这种类型表示mysql会对整个该索引进行扫描。要想用到这种类型的索引，对这个索引并无特别
        要求，只要是索引，或者某个联合索引的一部分，mysql都可
        
        能会采用index类型的方式扫描。但是呢，
        缺点是效率不高，mysql会从索引中的第一个数据一个个的查找到最后一个数据，
        直到找到符合判断条件的某个索引。所以，上述语句会触发索引。

ref:    这种类型表示mysql会根据特定的算法快速查找到某个符合条件的索引，而不是会对索引中每一个数据都
        进行一一的扫描判断，也就是所谓你平常理解的使用索引查询会更快的取出数据。而要想实现这种查找，索引却是有要求的，
        要实现这种能快速查找的算法，索引就要满足特定的数据结构。
        简单说，也就是索引字段的数据必须是有序的，才能实现这种类型的查找，才能利用到索引。

```
##### 索引底层数据结构 (待补充)
- b-tree
  + 介绍
    * 可用于 =, >, >=, <, <=,  BETWEEN, like (不以通配符开头的常量)

    * For example, the following SELECT statements use indexes:
    ````````
        SELECT * FROM tbl_name WHERE key_col LIKE 'Patrick%';
        SELECT * FROM tbl_name WHERE key_col LIKE 'Pat%_ck%';
    ````````
    * The following SELECT statements do not use indexes:
    * 
    ````````
        SELECT * FROM tbl_name WHERE key_col LIKE '%Patrick%';
        SELECT * FROM tbl_name WHERE key_col LIKE other_col;
    ````````
  + 优点
- hash索引
  + 介绍
    * 只能进行=，<=>，in查询，无法进行范围查询 
  + 优点
    * 效率高，一次查找 时间复杂度O(1)
  + 缺点
    * 只能进行=，<=>，in查询，无法进行范围查询
    * 无法使用哈希索引来加快ORDER BY操作速度
    * 不支持索引排序
    * 无法避免回表查找
    * 大量hash值相同情况性能不一样比b-tree高
  - 低层实现
    * hash表(散列表) 
- b+tree

###说明
1. 选择唯一索引
2. 为经常需要排序，分组，联合操作的字段建立索引
3. 为常作为查询条件的字段建立索引
4. 限制索引的数目
5. 尽量使用数据量少的索引
6. 尽量使用前缀来索引
7. 删除不再使用或者很少使用的索引
8. 经常更新的字段 无效建立索引（字段更改 索引需重新建立）
9. 不推荐在同一列建立多个索引


###执行过程
[mysql执行过程以及顺序 - Yrion - 博客园](https://www.cnblogs.com/wyq178/p/11576065.html)
[最左](https://blog.csdn.net/LJFPHP/article/details/90056936)
![](https://img2018.cnblogs.com/blog/1066538/201910/1066538-20191003155130049-1800625122.png)
































