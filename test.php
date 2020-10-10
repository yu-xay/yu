<?php

require_once './vendor/autoload.php';
$start = [5, 8, 2, 2, 6, 6, 3, 1, 0, 13, 45, 14, 256, 183, 25];
const END = [0, 1, 2, 2, 3, 5, 6, 6, 8, 13, 14, 25, 45, 183, 256];

function mergeT($left, $right)
{
    $middle = [];
    while (count($left) && count($right)) {
        array_push($middle, current($left) > current($right) ? array_shift($right) : array_shift($left));
    }
    return array_merge($middle, $left, $right);
}

function mergee(array $data)
{
    if (count($data) < 2) {
        return $data;
    }
    $i = intval(count($data) / 2);
    $left = array_slice($data, 0, $i);
    $right = array_slice($data, $i);
    $left = mergee($left);
    $right = mergee($right);
    return mergeT($left, $right);
}

$start = mergee($start);
dd($start);
dd(END === $start);
