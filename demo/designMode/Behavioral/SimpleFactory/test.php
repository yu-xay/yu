<?php

namespace DesignMode\Behavioral\SimpleFactory;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        $bicycle = (new SimpleFactory())->createBicycle();
        $this->assertInstanceOf(Bicycle::class, $bicycle);
    }
}