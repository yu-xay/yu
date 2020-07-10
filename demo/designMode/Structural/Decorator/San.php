<?php

declare(strict_types=1);

namespace DesignMode\Creational\Decorator;

class San extends Middle
{
    public function totalPrice(): float
    {
        return $this->model->totalPrice() + 80;
    }

    public function desc()
    {
        return sprintf('%s;san:jia san;', $this->model->desc());
    }
}
