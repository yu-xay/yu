<?php


namespace DesignMode\Behavioral\Visitor;


class oneFloor extends house
{
    function visitor(workVisitor $visitor)
    {
        return $visitor->oneHouse($this);
    }
}