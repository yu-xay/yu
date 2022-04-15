<?php

namespace DesignMode\Creational\SimpleFactory;

/**
 * 因为非静态，所以你可以拥有多个不同参数的工厂
 */
class SimpleFactory
{
    public function createBicycle(): Bicycle
    {
        return new Bicycle();
    }
}