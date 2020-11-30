<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\Command;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testCook()
    {
        $cook = new Cook();
        $waiter = new waiter($cook);
        $user = new user($waiter);
        $user->eat('dog');
        $user->eat('dog');
        $this->assertSame('dog, dog', $user->run());
    }
}
