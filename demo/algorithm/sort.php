<?php

namespace Algorithm;

use PHPUnit\Framework\TestCase;

class sort extends TestCase
{
    private const END = [0, 1, 2, 2, 3, 5, 6, 6, 8];

    public $start = [5, 8, 2, 2, 6, 6, 0, 1, 3];


    public function testQuick()
    {

    }

    public function testInsert()
    {
        //https://upload-images.jianshu.io/upload_images/5194559-53026031adf83874.gif?imageMogr2/auto-orient/strip|imageView2/2/w/666/format/webp
        $count = count($this->start);
        $arr = [];
        for ($i = 0; $i < $count; $i++) {
            for ($j = 0; $j < $count; $j++) {

            }
        }
        $this->assertSame(self::END, $this->start);
    }

    public function testSelect()
    {
        //https://images2015.cnblogs.com/blog/1094457/201703/1094457-20170313214825557-329405797.gif
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

    public function testBubble()
    {
        //https://images2015.cnblogs.com/blog/599210/201706/599210-20170619085503132-2067568088.gif
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