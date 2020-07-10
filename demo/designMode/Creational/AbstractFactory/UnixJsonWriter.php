<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Creational\AbstractFactory;


class UnixJsonWriter implements JsonWriter
{
    public function write(array $data, bool $formatted): string
    {
        return 'unix json write';
    }
}