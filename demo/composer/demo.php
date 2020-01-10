<?php

namespace yu\composer;

use ckg\src\Tools;
use PHPUnit\Framework\TestCase;

class StackTest extends TestCase
{
    public function __construct()
    {
        return parent::__construct();
    }

    protected function setUp(): void
    {
        require_once '../../vendor/autoload.php';
    }

    public function testPushAndPop()
    {
        $a = new Tools();
        $this->expectOutputString('Hello World');
        $a::Hello();
    }
}

?>