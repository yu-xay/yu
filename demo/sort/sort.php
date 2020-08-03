<?php

namespace Algorithm;

use PHPUnit\Framework\TestCase;

/**
 * https://www.cnblogs.com/onepixel/p/7674659.html
 */
class sort extends TestCase
{
    private const END = [0, 1, 2, 2, 3, 5, 6, 6, 8, 13, 14, 25, 45, 183, 256];

    public $start = [5, 8, 2, 2, 6, 6, 3, 1, 0, 13, 45, 14, 256, 183, 25];

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

        // *****数组拆分处理*****
        for ($i = 0; $i < count($arr); $i++) {
            $buckets[floor(($arr[$i] - $minValue) / $bucketSize)][] = $arr[$i];
        }

        $this->start = array();
        for ($i = 0; $i < count($buckets); $i++) {
            $bucketTmp = $buckets[$i];
            sort($bucketTmp);
            while (count($bucketTmp) > 0) {
                array_push($this->start, array_shift($bucketTmp));
            }
        }

        $this->assertSame(self::END, $this->start);
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
            $num = $bucket[$j];
            while ($num > 0) {
                array_push($this->start, $j);
                $num -= 1;
            }
        }
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Radix 基数
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015232453668-1397662527.gif
     */
    public function testRadix()
    {
        array_walk($this->start, function ($item) use (&$maxDigit) {
            $maxDigit = strlen($item) > $maxDigit ? strlen($item) : $maxDigit;
        });
        for ($i = 0; $i <= $maxDigit; $i++) {
            $barrel = array_fill(0, 10, []);
            for ($j = 0; $j < count($this->start); $j++) {
                //可使用mod
                if (strlen($this->start[$j]) < $i + 1) {
                    $barrel[0] = array_merge($barrel[0], [$this->start[$j]]);
                } else {
                    $sub = substr($this->start[$j], -1 * ($i + 1), 1);
                    $barrel[$sub] = array_merge($barrel[$sub], [$this->start[$j]]);
                }
            }
            $this->start = [];
            for ($k = 0; $k < count($barrel); $k++) {
                for ($l = 0; $l < count($barrel[$k]); $l++) {
                    array_push($this->start, $barrel[$k][$l]);
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

//        1 => 1
       // 2  => 23
//        2 => 4 5 67
//        3 => 8 9 10 11 12 13 14 15
        //2*n
        //用数组建立最小堆
        function buildHeap(&$arr, $arrSize)
        {
            for ($index = intval($arrSize / 2) - 1; $index >= 0; $index--) {
                if ($index * 2 + 1 < $arrSize) {
                    $max = $index * 2 + 1;
                    echo $index, PHP_EOL;
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
     * https://upload-images.jianshu.io/upload_images/6095354-ff984d80dbc0455f.png
     */
    public function testShell()
    {
        $gap = $count = count($this->start);
        while (($gap = floor($gap / 2)) && $gap > 0) {
            for ($i = $gap; $i < $count; $i++) {
                $temp = $this->start[$i];
                for ($j = $i - $gap; $j >= 0 && $this->start[$j] > $temp; $j -= $gap) {
                    $this->start[$j + $gap] = $this->start[$j];
                }
                $this->start[$j + $gap] = $temp;
            }
        }
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Merge 归并
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015230557043-37375010.gif
     */
    public function testMerge()
    {
        function merge($left, $right)
        {
            $arr = [];
            while (count($left) && count($right)) {
                $b = $left[0] < $right[0] ? array_shift($left) : array_shift($right);
                array_push($arr, $b);
            };
            return array_merge($arr, $left, $right);
        }
        function mergesort($data)
        {
            $count = count($data);
            if ($count < 2) {
                return $data;
            }
            $middle = intval($count / 2);
            $left = array_slice($data, 0, $middle);
            $right = array_slice($data, $middle);

            $left = mergesort($left);
            $right = mergesort($right);

            return merge($left, $right);
        }
        $this->start = mergesort($this->start);
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Quick 快速 O(N*logN)
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015230936371-1413523412.gif
     */
    public function testQuick()
    {
        function merge(array $data)
        {
            $count = count($data);
            if ($count < 2) {
                return $data;
            }
            $left = [];
            $right = [];
            $middle = [];
            for ($i = 0; $i < $count; $i++) {
                if ($data[$i] > $data[0]) {
                    array_push($right, $data[$i]);
                    continue;
                }
                if ($data[$i] < $data[0]) {
                    array_push($left, $data[$i]);
                    continue;
                }
                array_push($middle, $data[$i]);
            }
            $left = merge($left);
            $right = merge($right);
            return array_merge($left, $middle, $right);
        }

        $this->start = merge($this->start);
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Insert 插入
     * https://upload-images.jianshu.io/upload_images/5194559-53026031adf83874.gif?imageMogr2/auto-orient/strip|imageView2/2/w/666/format/webp
     */
    public function testInsert()
    {
        $count = count($this->start);
        for ($i = 1; $i < $count; $i++) {
            for ($j = $i; $j > 0; $j--) {
                if ($this->start[$j] < $this->start[$j - 1]) {
                    $this->start[$j - 1] ^= $this->start[$j];
                    $this->start[$j] ^= $this->start[$j - 1];
                    $this->start[$j - 1] ^= $this->start[$j];
                }
            }
        }
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Select 选择 O(n2)
     * https://images2015.cnblogs.com/blog/1094457/201703/1094457-20170313214825557-329405797.gif
     */
    public function testSelect()
    {
        $count = count($this->start);
        for ($i = 0; $i < $count - 1; $i++) {
            $min = $i;
            for ($j = $i + 1; $j < $count; $j++) {
                if ($this->start[$min] > $this->start[$j]) {
                    $min = $j;
                }
            }
            if ($i !== $min) {
                $this->start[$min] ^= $this->start[$i];
                $this->start[$i] ^= $this->start[$min];
                $this->start[$min] ^= $this->start[$i];
            }
        }
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Bubble 冒泡 O(n2)
     * https://images2015.cnblogs.com/blog/599210/201706/599210-20170619085503132-2067568088.gif
     */
    public function testBubble()
    {
        $count = count($this->start);
        for ($i = 0; $i < $count - 1; $i++) {
            for ($j = 0; $j < $count - 1 - $i; $j++) {
                if ($this->start[$j] > $this->start[$j + 1]) {
                    $this->start[$j] ^= $this->start[$j + 1];
                    $this->start[$j + 1] ^= $this->start[$j];
                    $this->start[$j] ^= $this->start[$j + 1];
                }
            }
        }
        $this->assertSame(self::END, $this->start);
    }
}
