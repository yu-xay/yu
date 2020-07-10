<?php

declare(strict_types=1);

namespace DesignMode\Structural\Decorator;

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
