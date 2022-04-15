<?php

namespace DesignMode\Behavioral\Command;


class Waiter
{
    public array $arr = [];

    public function add(Command $command)
    {
        array_push($this->arr, $command);
    }

    public function undo()
    {
        //do undo
    }

    public function setLog()
    {

    }

    public function run()
    {
        for ($i = 0; $i < count($this->arr); $i++) {
            ($this->arr[$i])->execute();
        }
    }
}