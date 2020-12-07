<?php


namespace DesignMode\Behavioral\Strategy;


class timeComparator implements comparator
{

    public function compare($p1, $p2)
    {
        return $p2 - $p1;
    }
}