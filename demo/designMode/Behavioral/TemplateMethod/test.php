<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\TemplateMethod;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testFood()
    {
        $price_a = new beijingPrice();
        $price_a = $price_a->getPrice();
        $this->assertSame('goods junk-food',$price_a);
    }
}
