<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\Command;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testCook()
    {
        $cook = new Cook();
        $c = new Drinks($cook);

        $waiter = new Waiter();
        $waiter->add($c);
        $waiter->run();
        $this->assertSame('dog,dog', $cook->text);
    }
}
