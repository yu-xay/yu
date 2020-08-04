[在线测试](http://php.jsrun.net/)

```
- ucfirst                                              首字母大小
- str_split                                             数组隔开
- js arguments                                          arge_func——
- js Object.fromEntries()
- property_exists                                       判断对象是否存在属性 
- array_flip                                            反转数组
- array_pad                                             填充数组
- substr_count($string, $need, $offset, $length)         范围内子串重复次数

- substr_replace(string, V$replacementV, $start, $length) 根据位置替换字符串                                
- str_replace($search, $replace, $string, $count)         根据搜索替换字符串
```

[php特性](https://xiaoxiami.gitbook.io/php-7/php-71x-xin-te-xing/xin-te-xing/ke-wei-kong-ff08-nullable-ff09-lei-xing)
### 文件系统
fopen fgets() ftell() rewind()

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

#END
- str_repeat()                                           字符串重复次数
- array_slice($arr, $offset, [$length,] [$Index])        获取部分数组
- array_splice(&$arr, $offset,[$length,] [(array)$need]) 子数组替换成$arr
- number_format($number,decimals, '.', ',')              千位数格式化
- http_build_query(mixed $array)                         生成请求字符串
- extract(&$array, EXTR_OVERWRITE,_as)                   从数组中到出变量
- array_fill(start,end,value)                            填充数组
- substr(string, start, [length])                        截取子串
- wordwrap(string, width, limit, English)                字符串切割
- substr_compare(main_str,str,offset,length,Aa true) int 二进制比较文件
- realpath()                                             获取真实路径
- parse_url($url, PHP_URL_SCHEME):mixed                  解析url
- base64_encode($data):string                            base64编码
- php_sapi_name() PHP_SAPI                               接口类型
- getallheaders():array                                  获取全部 HTTP 请求头信息
- usort($arr,function($item,$next){ $item <=> $next})    排序