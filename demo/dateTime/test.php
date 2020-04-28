<?php

namespace yu\wrappers;

require_once '../../vendor/autoload.php';

use PHPUnit\Framework\TestCase;

class deteTime extends TestCase
{
    public function testCreate()
    {
        //时区  https://www.php.net/manual/zh/timezones.php
        //select 1: $datetime = new \DateTime(); 返回当前日期时间的实例
        //select 2: $datetime = new \DateTime('2020-12-21 15:15:15');
        //select 3: $datetime = \DateTime::createFromFormat('M j, Y i:H:s', 'Jan 2,2020 21:02:52')

        $datetime = new \DateTime('2090-10-21 15:15:15');


        //创建长度2周的间隔
        //Y M D W H M S => 结构P<number><logo>T<number><logo> =>字符串P开头 有时间则日期时间加上T
        //$dateInterval = new \DateInterval('P2WT5H');


        //表示一个时间周期。
        $dateInterval = \DateInterval::createFromDateString('-2day');

        $datePeriod = new \DatePeriod($datetime, $dateInterval, 50);
        foreach ($datePeriod as $date) {
            echo $date->format('Y-m-d') . PHP_EOL;
        }
//        $datetime->add($interval);
//        echo $datetime->format('Y-m-d H:i:s');

    }
}