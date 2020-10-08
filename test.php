<?php
$var = 'ABCDEFGH:/MNRPQR/';
echo "Original: $var<hr />\n";

/* 这两个例子使用 “bob” 替换整个 $var。*/
echo substr_replace($var, 'bob', 5) . "<br />\n";