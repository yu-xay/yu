[在线测试](http://php.jsrun.net/)

```
- js arguments                                          arge_func——
- js Object.fromEntries()
- property_exists                                       判断对象是否存在属性 
```

[php特性](https://xiaoxiami.gitbook.io/php-7/php-71x-xin-te-xing/xin-te-xing/ke-wei-kong-ff08-nullable-ff09-lei-xing)
### 文件系统
fopen fgets() ftell() rewind()

## 
+ strstr(string need before_needle) 查找字符串首次出现结尾字符串 == strchr
+ strpos(string need offset)       查找字符串首次出现位置 strripos
+ ucfirst(string)大写  lcfirst(string)小 strtoupper strtolower
+ str_split(string, [int]) 字符串转数组
- substr(string, start, [length])               截取子串
+ substr_count(string,need, [offset], [length]) 子串重复次数
+ substr_replace(string,need,offset, length) 返回替换后的子串
+ str_replace(search, need,string,&count) 根据搜索替换字符串
- array_fill(start,end,value)   创建填充数组
+ array_pad(array, size, value); 数组填充到size
+ array_filp(array) 交互键值

- array_slice($arr, $offset, [$length,] [$Index])        获取部分数组
- array_splice(&$arr, $offset,[$length,] [(array)$need]) 子数组替换成$arr

###unimportant
debug_zval_dump('encode');   引用次数 
memory_get_usage()           内存
sys_get_temp_dir()           临时文件的目录
array_multisort()            多个数组或多维数组排序
preg_match                   执行匹配正则表达式
preg_replace                 执行一个正则表达式的搜索和替换

openssl_random_pseudo_bytes  安全随机数
bin2hex                      二转16
highlight_file()             代码高亮

```text
  str => 子字符串   str => 返回值
  i   => insensitive 不敏感
  l   => left
  r   => right
  pos => position 位置
  ucfirst => uppercase 大写
  lcfirst => lowercase 小写
  len     => 长度
  substr  => substring 子串
  replace => 替换
    split   => 分裂;使分开(成为几个部分);
    pad     => 填充
    fill    => 填满
    filp    => 翻转
    slice   => 部分
    splice  => 粘接
  repeat  => 重复
  compare => 比较
```
#END
- str_repeat()                                           字符串重复次数
- number_format($number,decimals, '.', ',')              千位数格式化
- http_build_query(mixed $array)                         生成请求字符串
- extract(&$array, EXTR_OVERWRITE,_as)                   从数组中到出变量


- wordwrap(string, width, limit, English)                字符串切割
- substr_compare(main_str,str,offset,length,Aa true) int 二进制比较文件
- realpath()                                             获取真实路径
- parse_url($url, PHP_URL_SCHEME):mixed                  解析url
- base64_encode($data):string                            base64编码
- php_sapi_name() PHP_SAPI                               接口类型
- getallheaders():array                                  获取全部 HTTP 请求头信息
- usort($arr,function($item,$next){ $item <=> $next})    排序