<?php

declare(strict_types=1);

namespace DesignMode\Structural\Proxy\dynamic;

use PHPUnit\Framework\TestCase;

//动态代理
class test extends TestCase
{
    public function testBuild()
    {
        $real = new Real();
        $after = new AfterPorxy($real);
        $proxy = Proxy::createProxy($real, $after);
        $result = $proxy->doSomething('data: ');
        $this->assertSame('data: handle', $result);
    }
}
