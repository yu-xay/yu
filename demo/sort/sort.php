<?php

namespace Algorithm;

use PHPUnit\Framework\TestCase;

/**
 * https://www.cnblogs.com/onepixel/p/7674659.html
 */
class sort extends TestCase
{
    private const END = [0, 1, 2, 2, 3, 5, 6, 6, 8];

    public $start = [5, 8, 2, 2, 6, 6, 0, 1, 3];

    /**
     * Bucket 排序
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015232107090-1920702011.png
     */
    public function testBucket()
    {
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Counting 计数
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015231740840-6968181.gif
     */
    public function testCounting()
    {
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Radix 基数
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015232453668-1397662527.gif
     */
    public function testRadix()
    {
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Heap 堆排序
     * https://images2017.cnblogs.com/blog/849589/201710/849589-20171015231308699-356134237.gif
     */
    public function testHeap()
    {
        $this->assertSame(self::END, $this->start);
    }

    /**
     * Shell 希尔
     * https://images2018.cnblogs.com/blog/849589/201803/849589-20180331170017421-364506073.gif
     */
    public function testShell()
    {
<<<EOL
        //Java 代码实现
public class ShellSort implements IArraySort {


  public int[] sort(int[] sourceArray) throws Exception {
        // 对 arr 进行拷贝，不改变参数内容
        int[] arr = Arrays.copyOf(sourceArray, sourceArray.length);

     int gap = 1;
     while (gap < arr.length) {
            gap = gap * 3 + 1;
        }

      while (gap > 0) {
        for (int i = gap; i < arr.length; i++) {
              int tmp = arr[i];
              int j = i - gap;
             while (j >= 0 && arr[j] > tmp) {
               arr[j + gap] = arr[j];
                 j -= gap;
               }
              arr[j + gap] = tmp;
          }
          gap = (int) Math.floor(gap / 3);
       }

      return arr;
   }
}
EOL;




        $this->assertSame(self::END, $this->start);
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
