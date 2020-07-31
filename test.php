<?php

function getMissElement($m, $n)
{
    $nArr   = array_fill(0, $n, -1);
    $newArr = array_merge($m, $nArr);
    for ($i = 0; $i < count($newArr); $i++) {
        while ($i + 1 != $newArr[$i]) {
            if ($newArr[$i] == -1) {
                break;
            }
            $temp              = $newArr[$i];
            $newArr[$i]        = $newArr[$temp - 1];
            $newArr[$temp - 1] = $temp;
        }
    }

    for ($i = 0; $i < count($newArr); $i++) {
        if ($newArr[$i] == -1) {
            echo $i + 1;
            echo "\n";
        }
    }
}

$missArr = [1, 9, 4, 5, 8, 3, 7];
$n       = 2;

getMissElement($missArr, $n);
