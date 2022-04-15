<?php

/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Structural\Proxy\dynamic;

class AfterPorxy
{
    public $realModel;

    public function __construct($realModel)
    {
        $this->realModel = $realModel;
    }

    public function invoke($method, $params)
    {
        return call_user_func_array(array($this->realModel, $method), $params);
    }
}
