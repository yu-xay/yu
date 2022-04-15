<?php


namespace DesignMode\Behavioral\Visitor;


abstract class house
{
    abstract function visitor(workVisitor $visitor);
}