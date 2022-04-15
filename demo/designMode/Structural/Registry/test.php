<?php

declare(strict_types=1);

namespace DesignMode\Structural\Registry;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testBuild()
    {
        $p = new Registry();
        $p::save(1, 'A');
        $get = $p::get(1);
        $this->assertSame($get, 'A');
    }
}
