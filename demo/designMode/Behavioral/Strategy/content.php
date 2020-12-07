<?php


namespace DesignMode\Behavioral\Strategy;


class content
{
    private $comparator;

    public function __construct(comparator $comparator)
    {
        $this->comparator = $comparator;
    }

    public function compare(...$params)
    {
        $this->comparator->compare(...$params);
    }
}