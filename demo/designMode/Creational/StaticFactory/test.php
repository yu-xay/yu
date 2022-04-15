<?php

namespace DesignMode\Creational\StaticFactory;

use PHPUnit\Framework\TestCase;

/**
 * Class Index
 * @package DesignMode\Creational\StaticFactory
 * 抽象工厂模式类似，此模式用于创建一系列相关或相互依赖的对象。
 * 『静态工厂模式』与『抽象工厂模式』的区别在于，只使用一个静态方法来创建所有类型对象，
 * 此方法通常被命名为 factory 或 build。
 */
class test extends TestCase
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