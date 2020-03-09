<?php

namespace designMode\Bahavioral\StaticFactory;

use PHPUnit\Framework\TestCase;

class Index extends TestCase
{
    public function testIndex()
    {

       echo 1;exit;
        $iphone = StaticFactory::factory('iphone');
        echo $iphone;
    }
}