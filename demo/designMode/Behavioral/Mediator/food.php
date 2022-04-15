<?php


namespace DesignMode\Behavioral\Mediator;


class food extends colleague
{
    public function food(){
        $food = $this->element->goshop();
        return 'goods '  . $food;
    }
}