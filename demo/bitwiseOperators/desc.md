### 位运算
用途： 多个参数使用true false;

|例子|名称|*权限|结果|
|:---|:---|:---|:---|
|$a & $b |And（按位与）      |$a和$b都存在的权限   |将把 $a 和 $b 中都为 1 的位设为 1。| 
|$a 分隔符 $b |Or（按位或）	|$a和$b所有权限       |将把 $a 和 $b 中任何一个为 1 的位设为 1。|
|$a ^ $b |Xor（按位异或）    |从$a中去掉$b的权限   |将把 $a 和 $b 中一个为 1 另一个为 0 的位设为 1。|
|~$a	 |Not（按位取反）    |获取非$a的权限	     |将 $a 中为 0 的位设为 1，反之亦然。|
|$a << $b|Shiftleft（左移）  |                    |将 $a 中的位向左移动 $b 次（每一次移动都表示 “乘以 2”）。|
|$a >> $b|Shift right（右移）|                    |将 $a 中的位向右移动 $b 次（每一次移动都表示 “除以 2”）。|



[官网](https://www.php.net/manual/zh/language.operators.bitwise.php "php位运算")
[PHP 位运算使用](https://learnku.com/articles/22312 "")
