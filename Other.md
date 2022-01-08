###字符串替换
####php
+ str_replace(substr, replace,string, &count);
+ preg_replace(reg, replace, string, $limit = -1,$count)

####js
+ [String].replace(substr/reg,replace);

####java
+ [String].replace(substr, replace)
+ [String].replaceAll(reg, replace)

###正则
####php 加开始结束
+ str_split(string, length)
+ preg_split(reg, string,$limit, $flags)

#### js 加开始结束/  /
+ [String].split(reg/substr, $limit);

#### java   不加开始结束 //
+ [String].split(reg/substr,$limit);

### 字符串是否开始
####php
+ str_pos(string, find,start) == false

#### js + java 
[String].indexOf(str) == 0
[String].startWith(find) true
[String].endWith(find) false

####php
+ substr(String, start,length)

####js
+ [String].substr(start,length)

####java
+ [String].substring(start,end)

###转大小写
####php
strtoupper 转大写
strtolower 转小写

####jave + js
toUpperCase 转大写
toLowerCase 转小写

###字符串提供一组重载的静态方法valueof
String.valueOf([mixed])