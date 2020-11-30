<?php


namespace DesignMode\Behavioral\Command;


class Cook
{
    public function run(array $menus)
    {
        return join(",", $menus);
    }
}