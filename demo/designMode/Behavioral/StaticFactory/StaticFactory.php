<?php
namespace designMode\Bahavioral\StaticFactory;
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

class StaticFactory
{
    public static function factory(string $type): FormatterInterface
    {
        if ($type == 'iphone') {
            return new Iphone();
        }
        if ($type == 'tel') {
            return new Tel();
        }
    }
}