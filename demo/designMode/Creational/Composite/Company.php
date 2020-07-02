<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Composite;

/**
 * 复合节点必须扩展组件协定。这对于构建
 * 组件树是必需的
 */
class Company implements Limited
{
    public string $name;

    public array $elements;

    public function __construct($name)
    {
        $this->name = $name;
    }

    public function add(Limited $elements)
    {
        $this->elements[] = $elements;
    }

    public function delete(Limited $elements)
    {
        $key = array_search($elements, $this->elements);
        if ($key === false) {
            return false;
        }
        unset($this->elements[$key]);
        $this->elements = array_values($this->elements);
    }

    public function render(int $depth = 1)
    {
        $str = str_repeat('-', $depth) . $this->name . PHP_EOL;
        foreach ($this->elements as $model) {
            if ($model instanceof Department) {
                $str .= str_repeat('-', $depth + 1) . $model->render($depth + 1) . PHP_EOL;
            } else {
                $str .= $model->render($depth + 1);
            }
        }
        return $str;
        //$data = [
        //    $this->name => array_map(function ($item) use ($depth) {
        //        return $item->render($depth + 1);
        //    }, $this->elements)
        //];
    }
}
