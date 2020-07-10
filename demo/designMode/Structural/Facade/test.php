<?php declare(strict_types=1);

namespace DesignMode\Structural\Facade;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testDependencyInjection()
    {
        $big = $this->createMock(Pig::class);
        $big->method('cname')
            ->will($this->returnValue('烤鸭'));

        $food = new Food(new RoastChicken(), $big);

        $food->getName();
        $end = $food->eat();
        $this->assertSame('end', $end);
    }
}
