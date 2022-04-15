<?php


namespace DesignMode\Behavioral\Mediator;


abstract class colleague
{
    public element $element;//饿了么

    public function setMediator(element $element)
    {
        $this->element = $element;
    }
}