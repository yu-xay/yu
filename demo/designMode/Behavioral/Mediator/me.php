<?php


namespace DesignMode\Behavioral\Mediator;


class me extends colleague
{
    public function order(){
      return $this->element->gofood();
    }
}