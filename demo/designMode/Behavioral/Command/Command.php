<?php


namespace DesignMode\Behavioral\Command;


abstract class Command
{
    public Cook $cook;

    public function __construct(Cook $cook)
    {
        $this->cook = $cook;
    }

    public abstract function execute();
}