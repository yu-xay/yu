<?php

namespace DesignMode\Behavioral\StaticFactory;

use PHPUnit\Framework\TestCase;

class Index extends TestCase
{
    public function testTT()
    {
        $model = StaticFactory::factory('number');
        $this->assertInstanceOf(FormatNumber::class, $model);
    }

    public function testException()
    {
        $this->expectException(\InvalidArgumentException::class);
        StaticFactory::factory('object');
    }
}