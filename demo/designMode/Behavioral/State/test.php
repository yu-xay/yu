<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\State;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        $o = new OrderContext();
        $o->proceedToNext();
        $o->proceedToNext();

    }
}
