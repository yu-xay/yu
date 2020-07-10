<?php declare(strict_types=1);

namespace DesignMode\Creational\Pool;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        $pool = new Pool();
        $worker1 = $pool->get();
        $worker2 = $pool->get();

        $this->assertSame(2, $pool->count());
        $this->assertNotSame($worker1, $worker2);
    }

    public function testCanGetSameInstanceTwiceWhenDisposingItFirst()
    {
        $pool = new Pool();
        $worker1 = $pool->get();
        $pool->dispose($worker1);
        $worker2 = $pool->get();

        $this->assertSame(1, $pool->count());
        $this->assertSame($worker1, $worker2);
    }
}