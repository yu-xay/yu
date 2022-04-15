<?php
echo json_encode([
    'code' => 0,
    'msg' => '',
    'data' => [
        'list' => [
            [
                'is_open' => 1,
                'order' => [
                    'is_pay' => 1,
                    'shop_num' => 200,
                    'end_time' => '',
                    'is_forever' => 0,
                ],
                'name' => 'zjhj_bd',
            ]
        ],
    ]
])
?>