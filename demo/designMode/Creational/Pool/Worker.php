<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\Pool;


class Worker
{
    private $createdAt;

    public function __construct()
    {
        $this->createdAt = new \DateTime();
    }
}