<?php

require_once './vendor/autoload.php';
$start = [5, 8, 2, 2, 6, 6, 3, 1, 0, 13, 45, 14, 256, 183, 25];
const END = [0, 1, 2, 2, 3, 5, 6, 6, 8, 13, 14, 25, 45, 183, 256];

$maxDigit = 0;
foreach ($start as $item) {
    $maxDigit = $maxDigit < strlen($item) ? strlen($item) : $maxDigit;
}
for ($i = 1; $i < $maxDigit + 1; $i++) {
    $arr = array_fill(0, 10, []);
    foreach ($start as $item) {
        $text = substr($item, -1 * $i, 1);
        if (strlen($item) < $i || $text === false) {


            array_push($arr[0], $item);
        } else {
            array_push($arr[$text], $item);
        }
    }
    $start = [];
    foreach ($arr as $item2) {
        if (!empty($item2)) {
            $start = array_merge($start, $item2);
        }
    }
}

//
dd($start);
//dd(END === $start);
