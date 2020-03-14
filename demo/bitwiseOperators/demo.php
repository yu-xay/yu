<?php

namespace yu\bitwiseOperators;

use PHPUnit\Framework\TestCase;

class index extends TestCase
{
    /**
     * 除了提示级别之外的所有错误
     */
    public function testExcept()
    {
        E_ALL; // 0b111111111111111 32767
        E_NOTICE; //0b000000000001000	8

        $a = E_ALL ^ E_NOTICE;
        $this->assertSame(32759, $a);

        $b = E_ALL & E_NOTICE;
        $this->assertSame(8, $b);

        $d = E_ALL & ~E_NOTICE; // 	0b111111111110111	32759
        $this->assertSame(32759, $d);
    }

    public function testMerge()
    {
        JSON_UNESCAPED_UNICODE; // 0b100000000 256
        JSON_PRETTY_PRINT; //0b010000000	128
        $c = JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT; //0b110000000	384
        $this->assertSame(384, $c);
    }

    public function testLess()
    {
        E_ALL; // 0b111111111111111 32767
        E_WARNING; //0b000000000000010  2
        E_NOTICE; //0b000000000001000	8
        $d = E_ALL ^ E_WARNING ^ E_NOTICE; // 	0b111111111110101	32757
        $this->assertSame(32757, $d);
    }

    public function testExchange()
    {
        function swap(int $a, $b): array
        {
            //注意 $a 和 $b 不能指向同一个地址；否则为空
            $a ^= $b;
            $b ^= $a;
            $a ^= $b;
            return [$a, $b];
        }

        $this->assertSame([2, 1], swap(1, 2));
    }
}