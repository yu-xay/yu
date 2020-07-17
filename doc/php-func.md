[在线测试](http://php.jsrun.net/)

### 可补充(5天删除)
```
debug_zval_dump('encode');                              引用次数

http_build_query(array)                                 http头部数组转字符串 2day
array_fill(index,number,value);                         填充数组 3day

array_multisort()
array_slice(array $arr, int $offset [,int $length = null]): array 从数组中取出一段 2day
array_splice(array &$arr, int $offset [, int length = count($arr)[, $reple]] : array 去掉数组莫一部分并用其他值取代 2day
wordwrap(str, num, 分隔符, 是否强制)                                        文本换行 4day
sub: 子
substr_count($haystack,$needle);               字符串出现次数  1dau

substr($string.$start,$length)                 字符串子传                            1day
substr_replace($string,$replact,$start,$length) 根据位置替换 混合参数        =>位置筛选 1day
str_replace($search, $replace,$string,$count)  子字符串替换 遍历 替换 混合参数 =>查找字符串 1day
preg_replace(mixed $pattern, $replacement, $string) 正则替换
extract()                                         数组提交值  1day
number_format($number,位数,小数点，逗号)           千位数字格式化  1day

```

[php特性](https://xiaoxiami.gitbook.io/php-7/php-71x-xin-te-xing/xin-te-xing/ke-wei-kong-ff08-nullable-ff09-lei-xing)





#END
- substr_compare(main_str,str,offset,length,Aa true) int 二进制比较文件
- realpath()                                             获取真实路径
- parse_url($url, PHP_URL_SCHEME):mixed                  解析url
- base64_encode($data):string                            base64编码
- php_sapi_name() PHP_SAPI                               接口类型
- getallheaders():array                                  获取全部 HTTP 请求头信息
- usort($arr,function($item,$next){ $item <=> $next})    排序