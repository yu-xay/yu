<?php


namespace DesignMode\Behavioral\TemplateMethod;


abstract class footPrice
{
    final public function getPrice(){
        $a = $this->getHamburgPrice();
        $b = $this->getWaterPrice();
        return $a + $b;
    }

    protected function getWaterPrice()
    {
        return 10;

    }

    abstract protected function getHamburgPrice();
}