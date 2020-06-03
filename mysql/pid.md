#### NOTE ####
[NULL值问题](https://dev.mysql.com/doc/refman/5.7/en/problems-with-null.html)
1. NULL: 表示没有（未知）的值
2. null与任何其他值相比(算术比较操作符) 永远不会为真 => [where a <> Null, a = Null, a > Null]
   => 需使用 [is NULl, is not Null, IFNULL()函数],
3. 0或Null 代表 false 其他为true