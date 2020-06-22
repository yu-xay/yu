#### NOTE ####
[NULL值问题](https://dev.mysql.com/doc/refman/5.7/en/problems-with-null.html)
1. NULL: 表示没有（未知）的值
2. null与任何其他值相比(算术比较操作符) 永远不会为真 => [where a <> Null, a = Null, a > Null]
   => 需使用 [is NULl, is not Null, IFNULL()函数],
3. 0或Null 代表 false 其他为true

SELECT benchmark(100000000, 1+1) //测试表达式和函数的速度
8.4.1 优化数据大小
##### table列:
+  如果可能 将列声明为 NOT NULL。它通过更好的使用索引并消除测试每个value是否为 NULL 的开销使SQL操作更快。然后确实需要表中的 NULL 值，只需避免每列允许 NULL 值的默认设置
    

+ 尽可能使用最有效（最小）的数据类型 例：

|类型|存储(字节)|最小 Value 签名|最小 Value 无符号|最大 Value 签名|最大 Value 无符号|
|:---:|:---:|:---:|:---:|:---:|:---:|
|TINYINT   |1 |	-128	   | 0	|127	 |255
|SMALLINT  |2 |	-32768	   | 0	|32767	 |65535
|MEDIUMINT |3 |	-8388608   | 0	|8388607 |	16777215
|INT	   |4 |	-2147483648| 0	|2147483647 | 4294967295
|BIGINT	   |8 |	-263       | 0	|263-1 |	264-1

##### 行格式
[行格式](https://www.docs4dev.com/docs/zh/mysql/5.7/reference/innodb-row-format.html)


##### 索引
