<?php

declare(strict_types=1);

namespace DesignMode\Structural\Adapter;

use PHPUnit\Framework\TestCase;

class test extends TestCase
{
    public function testBook()
    {
        $book = new PaperBook();
        $book->open();
        $book->turnPage();
        $this->assertSame(2, $book->getPage());
    }

    public function testAdapterBook()
    {
        $kindle = new Kindle();
        $book = new Adapter($kindle);
        $book->open();
        $book->turnPage();
        $this->assertSame(2, $book->getPage());
    }
}
