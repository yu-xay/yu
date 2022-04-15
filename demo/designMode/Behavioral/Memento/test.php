<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\Memento;


use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testIndex()
    {
        $a = new Ticket();
        $save = $a->save($a);
        $a->end();
        $c = $a->undo($save);

        $this->assertSame($a, $c);
    }
}
