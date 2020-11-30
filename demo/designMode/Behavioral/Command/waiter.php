<?php


namespace DesignMode\Behavioral\Command;


class waiter
{
    public cook $cook;
    public array $text = [];

    public function __construct(cook $cook)
    {
        $this->cook = $cook;
    }

    public function add($value)
    {
        array_push($this->text, $value);
    }

    public function run()
    {
        return $this->cook->run($this->text);
    }
}