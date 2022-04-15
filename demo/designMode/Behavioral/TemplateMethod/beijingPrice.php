<?php


namespace DesignMode\Behavioral\TemplateMethod;


class beijingPrice extends footPrice
{
    protected function getHamburgPrice()
    {
        return 30;
    }
}