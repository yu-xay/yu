<?php declare(strict_types=1);

namespace DesignMode\Behavioral\Singleton;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testUniqueness()
    {
        $firstCall = Singleton::getModel();
        $secondCall = Singleton::getModel();

        $this->assertInstanceOf(Singleton::class, $firstCall);
        $this->assertSame($firstCall, $secondCall);
    }
}