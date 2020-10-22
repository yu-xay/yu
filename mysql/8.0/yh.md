###EXPLAIN
#### EXPLAIN format=json 可查询详细信息
    ```text
    {
        "query_block": {
            "select_id": 1,
            "cost_info": {
                "query_cost": "6.09"  # 整个查询的执行成本预计为3197.16
            },
            "nested_loop": [{   # 几个表之间采用嵌套循环连接算法执行
                    "table": {
                        "table_name": "c1",    #驱动表
                        "access_type": "ALL",  # 访问方法为ALL，意味着使用全表扫描访问
                        "rows_examined_per_scan": 2,  # 查询一次s1表大致需要扫描2条记录
                        "rows_produced_per_join": 2,  # 驱动表s1的扇出是2
                        "filtered": "100.00",        # condition filtering代表的百分比
                        "cost_info": {
                            "read_cost": "1.00",
                            "eval_cost": "0.40",
                            "prefix_cost": "1.40",    # 单次查询s1表总共的成本
                            "data_read_per_join": "8K"
                        },
                        "used_columns": [           # 执行查询中涉及到的列
                            "id",
                            "mall_id",
                            "mch_id",
                            "parent_id",
                        ]
                    }
                },
                {
                    "table": {
                        "table_name": "c2",   #被驱动表
                        "access_type": "index",
                        "key": "mall_id",     # 实际使用的索引
                        "used_key_parts": [   # 使用到的索引列
                            "mall_id"
                        ],
                        "key_length": "4",
                        "rows_examined_per_scan": 2,
                        "rows_produced_per_join": 4,
                        "filtered": "100.00",
                        "using_index": true,
                        "using_join_buffer": "Block Nested Loop",
                        "cost_info": {
                            "read_cost": "1.10",
                            "eval_cost": "0.80",
                            "prefix_cost": "3.30",
                            "data_read_per_join": "17K"
                        }
                    }
                },
            ]
        }
    }
    ```

#### EXPLAIN CONNECTION [NUM] 
docker run -itd --name mysql-test -p 3306:3311 -e MYSQL_ROOT_PASSWORD=123456 mysql
+ [导出格式](https://dev.mysql.com/doc/refman/8.0/en/explain-output.html)

### 基准查询和服务器