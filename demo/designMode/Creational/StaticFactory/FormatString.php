<?php
namespace DesignMode\Creational\StaticFactory;

class FormatString implements FormatterInterface
{
    public function dial()
    {
        return 'tel 拨号';
    }
}