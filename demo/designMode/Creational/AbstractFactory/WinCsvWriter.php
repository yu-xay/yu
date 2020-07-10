<?php
/**
 * link: http://www.zjhejiang.com/
 * copyright: Copyright (c) 2020 浙江禾匠信息科技有限公司
 * author: xay
 */

namespace DesignMode\Behavioral\AbstractFactory;


class WinCsvWriter implements CsvWriter
{
    public function write(array $line): string
    {
        return 'windows csv writer';
    }
}