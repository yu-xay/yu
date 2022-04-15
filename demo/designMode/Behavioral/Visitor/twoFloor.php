<?php


namespace DesignMode\Behavioral\Visitor;


class twoFloor extends house
{
    function visitor(workVisitor $visitor)
    {
        return $visitor->twoHose($this);
    }
}