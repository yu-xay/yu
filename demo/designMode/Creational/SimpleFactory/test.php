<?php

namespace DesignMode\Creational\SimpleFactory;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        $bicycle = (new SimpleFactory())->createBicycle();
        $this->assertInstanceOf(Bicycle::class, $bicycle);
    }
}