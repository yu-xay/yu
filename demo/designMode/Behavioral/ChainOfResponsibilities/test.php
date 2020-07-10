<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\ChainOfResponsibilities;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        //大概如此
        $a = new StringHandle(new IntHandle(new NumberHandle()));
        $str = $a->handle(123.3);
        $this->assertSame('is numeric', $str);
    }
}
