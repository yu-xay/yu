<?php
echo "开始进行硬盘读写测试...";
$random_int = mt_rand(0, 9);
$str = '';
$str = str_pad($str, 512, $random_int);
$file = fopen("z.php","a+");
$i = 0;
$bytes = 102400;
$size = $bytes / 1000000;
$s1 = microtime(true);
while($i < $bytes){
$i += fwrite($file, $str);
}
$s2 = microtime(true);
$ws = $s2 - $s1;
$write_speed = round($size / $ws, 2);

$disk_score = round(($ws + $write_speed) * 100);
echo "测试完成，耗时：" . round($ws, 2) . "s\n";
echo "\n + 硬盘写入测试: {$write_speed}MB/s | 硬盘性能跑分: {$disk_score}\n\n";
exit;