<?php


namespace DesignMode\Behavioral\Command;


class Cook
{
    public $text = '';

    public function createDrink()
    {
        $this->text = 'Coke drinks';
        return $this->text;
    }
}