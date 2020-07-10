<?php
namespace DesignMode\Behavioral\StaticFactory;

class FormatString implements FormatterInterface
{
    public function dial()
    {
        return 'tel 拨号';
    }
}