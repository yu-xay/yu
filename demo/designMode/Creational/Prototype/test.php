<?php

namespace DesignMode\Creational\Prototype;


use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        $prototype = new Prototype();
        for ($i = 0; $i < 10; $i++) {
            $prototypeClone = clone $prototype;
            $this->assertSame(9, $prototypeClone->less());
        }
    }
}