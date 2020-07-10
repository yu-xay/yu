<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Adapter;

/**
 * 这是这里的适配器。注意它实现了Book，
 * 因此您不必更改使用Book的客户端代码*
 */
class Adapter implements Book
{
    protected EBook $eBook;

    public function __construct(EBook $eBook)
    {
        $this->eBook = $eBook;
    }

    public function open()
    {
        $this->eBook->unlock();
    }

    /**
     * 此类从一个接口正确转换为另一个接口。
     */
    public function turnPage()
    {
        $this->eBook->pressNext();
    }

    public function getPage(): int
    {
        return $this->eBook->getPage()[0];
    }
}