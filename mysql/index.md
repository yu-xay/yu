### 索引
+ PRIMARY KEY
+ UNIQUE
+ INDEX
+ NORMAL
+ FULLTEX 全文索引

##### 依据是否聚簇区分

- 聚簇索引
  + 引擎类型：InnoDB
  + 叶子结点存放数据本身
- 非聚簇索引
  + 引擎类型：MyISAM
  + 叶子结点存的指针指向数据的实际地址，索引和数据分开
  
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
  - 低层实现
    * hash表(散列表) 
- b+tree
























































