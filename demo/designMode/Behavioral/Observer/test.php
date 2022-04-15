<?php

declare(strict_types=1);

namespace DesignMode\Behavioral\Observer;


use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testFood()
    {
        $a = new Observer('teachar');
        $b = new Observer('student');

        $server = new Subject();
        $server->attach($a);
        $server->attach($b);
        $server->change();
    }
}
