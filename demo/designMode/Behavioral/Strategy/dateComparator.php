<?php


namespace DesignMode\Behavioral\Strategy;


class dateComparator implements comparator
{

    public function compare($p1,$p2): int
    {
        return $p1 <=> $p2;
    }
}