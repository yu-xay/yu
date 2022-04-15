<?php


namespace DesignMode\Behavioral\Visitor;


abstract class workVisitor
{
    abstract public function oneHouse(oneFloor $oneFloor);

    abstract public function twoHose(twoFloor $twoFloor);
}