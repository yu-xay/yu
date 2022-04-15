<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\Mediator;


use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testFood()
    {
        $a = new me();
        $a->setMediator(new element(new food(),new shop(), $a));
        $food = $a->order();
        $this->assertSame('goods junk-food',$food);
    }
}
