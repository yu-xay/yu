<?php

namespace DesignMode\Structural\Decorator;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        $p = new Man();
        $this->assertSame(0.2, $p->totalPrice());
    }

    public function testTotalPrice()
    {
        $p = new Man();
        $p = new San($p);
        $p = new Xiezi($p);
        $this->assertSame(160.2, $p->totalPrice());
    }
}
