<?php declare(strict_types=1);

namespace yu\Tests;

use yu\Singleton;
use PHPUnit\Framework\TestCase;

class SingletonTest extends TestCase
{
    public function testUniqueness()
    {
        $firstCall = \yu\Tests\Singleton::getInstance();

    }
}
