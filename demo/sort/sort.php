<?php

namespace Algorithm;

use PHPUnit\Framework\TestCase;

/**
 * https://www.cnblogs.com/onepixel/p/7674659.html
 */
class sort extends TestCase
{
    private const END = [0, 1, 2, 2, 3, 5, 6, 6, 8, 13, 14, 25, 45, 183, 256];

    public $start = [5, 8, 2, 2, 6, 6, 0, 1, 3, 13, 45, 14, 256, 183, 25];

    /**
     * Bucket 桶排序
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015232107090-1920702011.png
     */
    public function testBucket()
    {
        $arr = $this->start;
        $bucketSize = 10;
        if (count($arr) === 0) {
            return $arr;
        }

        $minValue = $arr[0];
        $maxValue = $arr[0];
        for ($i = 1; $i < count($arr); $i++) {
            if ($arr[$i] < $minValue) {
                $minValue = $arr[$i];
            } elseif ($arr[$i] > $maxValue) {
                $maxValue = $arr[$i];
            }
        }

        $bucketCount = floor(($maxValue - $minValue) / $bucketSize) + 1;
        $buckets = array_fill(0, $bucketCount, []);
        for ($i = 0; $i < count($buckets); $i++) {
            $buckets[$i] = [];
        }

        // *****数组拆分处理*****
        for ($i = 0; $i < count($arr); $i++) {
            $buckets[floor(($arr[$i] - $minValue) / $bucketSize)][] = $arr[$i];
        }

        $arr = array();
        for ($i = 0; $i < count($buckets); $i++) {
            $bucketTmp = $buckets[$i];
            sort($bucketTmp);
            for ($j = 0; $j < count($bucketTmp); $j++) {
                $arr[] = $bucketTmp[$j];
            }
        }

        $this->assertSame(self::END, $arr);
    }

    /**
     * Counting 计数
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015231740840-6968181.gif
     */
    public function testCounting()
    {
        //implode 需要使用定长数组 * php数组是hash表的实现 ↓↓
        $bucket = new \SplFixedArray(max($this->start) + 1);
        for ($i = 0; $i < count($this->start); $i++) {
            if (empty($bucket[$this->start[$i]])) {
                $bucket[$this->start[$i]] = 0;
            }
            $bucket[$this->start[$i]] += 1;
        }

        $this->start = [];
        for ($j = 0; $j < count($bucket); $j++) {
            $v = current($bucket);
            while ($v > 0) {
                $this->start[] = key($bucket);
                $v--;
            }
            next($bucket);
        }
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Radix 基数
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015232453668-1397662527.gif
     */
    public function testRadix()
    {
        $maxDigit = 0;
        for ($a = 0; $a < count($this->start); $a++) {
            $maxDigit = strlen($this->start[$a]) > $maxDigit ? strlen($this->start[$a]) : $maxDigit;
        }

        for ($i = 1; $i <= $maxDigit; $i++) {
            $radix = array_fill(0, 10, []);
            for ($j = 0; $j < count($this->start); $j++) {
                //可使用mod
                if (strlen($this->start[$j]) < $i) {
                    $index = 0;
                } else {
                    $index = substr($this->start[$j], -1 * $i, 1);
                }
                $radix[$index][] = $this->start[$j];
            }

            $this->start = [];
            for ($k = 0; $k < count($radix); $k++) {
                while (count($radix[$k]) > 0) {
                    $key = null;
                    for ($l = 0; $l < count($radix[$k]); $l++) {
                        if (is_null($key) || $radix[$k][$key] > $radix[$k][$l]) {
                            $key = $l;
                        }
                    }
                    $merge = array_splice($radix[$k], $key, 1);
                    $this->start = array_merge($this->start, $merge);
                }
            }
        }
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Heap 堆排序
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015231308699-356134237.gif
     */
    public function testHeap()
    {
        function swap(array &$arr, int $a, int $b)
        {
            $arr[$b] ^= $arr[$a];
            $arr[$a] ^= $arr[$b];
            $arr[$b] ^= $arr[$a];
        }

        //用数组建立最小堆
        function buildHeap(&$arr, $arrSize)
        {
            for ($index = intval($arrSize / 2) - 1; $index >= 0; $index--) {
                if ($index * 2 + 1 < $arrSize) {
                    $max = $index * 2 + 1;
                    if ($index * 2 + 2 < $arrSize && $arr[$index * 2 + 2] > $arr[$index * 2 + 1]) {
                        $max = $index * 2 + 2;
                    }
                    if ($arr[$max] > $arr[$index]) {
                        swap($arr, $max, $index);
                    }
                }
            }
        }

        $arr = $this->start;
        $arrSize = count($arr);

        //1
        //2 3
        //45 67
        //89 1011 1213 1415
        buildHeap($arr, $arrSize);

        for ($i = $arrSize - 1; $i > 0; $i--) {
            swap($arr, $i, 0);
            $arrSize--;
            buildHeap($arr, $arrSize);
        }
        $this->assertSame(self::END, $arr);
    }

    /**
     * Shell 希尔
     * https://images2018.cnblogs.com/blog/849589/201803/849589-20180331170017421-364506073.gif
     */
    public function testShell()
    {
        function swap(array &$arr, int $a, int $b)
        {
            $arr[$b] ^= $arr[$a];
            $arr[$a] ^= $arr[$b];
            $arr[$b] ^= $arr[$a];
        }

        $arr = $this->start;
        for ($gap = floor(count($arr) / 2); $gap > 0; $gap = floor($gap / 2)) {
            echo $gap;
            //注意：这里和动图演示的不一样，动图是分组执行，实际操作是多个分组交替执行
            for ($j = $gap; $j < count($arr); $j++) {
                //echo implode(',', $arr) . PHP_EOL;
                //$j = 5,6,7,8
                //5 = 5 => 0 <=> 5;
                //6 = 5 => 1 <=> 6;
                //7 = 5 => 2 <=> 7;
                echo implode(',', [$j, $gap]) . PHP_EOL;
                while ($j - $gap >= 0 && $arr[$j - $gap] > $arr[$j]) {
                    swap($arr, $j, $j - $gap);
                    $j -= $gap;
                }
                //echo implode(',', $arr) . PHP_EOL;
            }
            //echo implode(',', $arr) . PHP_EOL;
        }
        $this->assertSame(self::END, $arr);
    }

    /**
     * Merge 归并
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015230557043-37375010.gif
     */
    public function testMerge()
    {
        function merge($arrA, $arrB)
        {
            /********灵魂所在*******/
            $arrC = array();
            while (count($arrA) && count($arrB)) {
                $arrC[] = $arrA[0] < $arrB[0] ? array_shift($arrA) : array_shift($arrB);
            }
            return array_merge($arrC, $arrA, $arrB);
        }

        function mergeSort($arr)
        {
            $len = count($arr);
            if ($len <= 1) {
                return $arr;
            }

            $mid = intval($len / 2);
            $left = array_slice($arr, 0, $mid);
            $right = array_slice($arr, $mid);
            $left = mergeSort($left);
            $right = mergeSort($right);
            $arr = merge($left, $right);
            return $arr;
        }

        $this->assertSame(self::END, mergeSort($this->start));
    }

    /**
     * Quick 快速
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015230936371-1413523412.gif
     */
    public function testQuick()
    {
        $func = function ($data) use (&$func) {
            if (count($data) <= 1) {
                return $data;
            }
            $count = count($data);
            $middle = $data[0];
            $left = $right = [];
            for ($i = 1; $i < $count; $i++) {
                if ($middle < $data[$i]) {
                    $right[] = $data[$i];
                } else {
                    $left[] = $data[$i];
                }
            }
            $left = $func($left);
            $right = $func($right);

            return array_merge($left, array($middle), $right);
        };
        $this->assertSame(self::END, $func($this->start));
    }

    /**
     * Insert 插入
     * https://upload-images.jianshu.io/upload_images/5194559-53026031adf83874.gif?imageMogr2/auto-orient/strip|imageView2/2/w/666/format/webp
     */
    public function testInsert()
    {
        $count = count($this->start);
        for ($i = 1; $i < $count; $i++) {
            for ($j = 0; $j < $i; $j++) {
                if ($this->start[$i] < $this->start[$j]) {
                    $this->start[$i] ^= $this->start[$j];
                    $this->start[$j] ^= $this->start[$i];
                    $this->start[$i] ^= $this->start[$j];
                }
            }
        }
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Select 选择
     * https://images2015.cnblogs.com/blog/1094457/201703/1094457-20170313214825557-329405797.gif
     */
    public function testSelect()
    {
        $count = count($this->start);
        for ($i = 0; $i < $count - 1; $i++) {
            $tmp = $i;
            for ($j = $i + 1; $j < $count; $j++) {
                if ($this->start[$j] <= $this->start[$tmp]) {
                    $tmp = $j;
                }
            }
            $sin = $this->start[$i];
            $this->start[$i] = $this->start[$tmp];
            $this->start[$tmp] = $sin;
        }

        $this->assertSame(self::END, $this->start);
    }

    /**
     * Bubble 冒泡
     * https://images2015.cnblogs.com/blog/599210/201706/599210-20170619085503132-2067568088.gif
     */
    public function testBubble()
    {
        $count = count($this->start);
        for ($i = 0; $i < $count; $i++) {
            for ($j = 0; $j < $count; $j++) {
                if ($this->start[$i] < $this->start[$j]) {
                    $this->start[$j] ^= $this->start[$i];
                    $this->start[$i] ^= $this->start[$j];
                    $this->start[$j] ^= $this->start[$i];
                }
            }
        }
        $this->assertSame(self::END, $this->start);
    }
}
