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
+ [导出格式](https://dev.mysql.com/doc/refman/8.0/en/explain-output.html)

### 基准查询和服务器

mysqlslap -uroot -p -P3310 --create-schema=employees --query="select e.emp_no,salary from salaries s join employees e on s.emp_no=e.emp_no where (first_name = 'Adam');" -c 1000 i 100

### 添加索引
+ Innodb是通过主键来存储行，即是聚簇索引
+ 其他所有键存储主键的值（不直接引用行），即是辅助索引/二级适应/非聚簇索引

- Primary KEY
- 应该是UNIQUE 和 NOT NULL 和 一个单调递增的值 和一个主键
- 选择最小的键，因为所有的二级使用都要存储主键
- 如果不选择，innoDB会在内部生成一个6字节行ID的隐藏聚簇索引

- mysql> ALTER TABLE departments ADD INDEX        index_last_name(dept_name);       #普通索引
- mysql> ALTER TABLE departments ADD UNIQUE INDEX index_last_name(dept_name);       #唯一索引
- mysql> ALTER TABLE departments ADD INDEX        index_last_name(dept_name(10));   #索引基于前10个
- mysql> ALTER TABLE departments DROP INDEX       index_last_name;                  #删除索引

* 函数会无法使用索引 可添加虚拟列 YEAR('name')
* mysql> ALTER TABLE departments ALTER INDEX index_last_name INVISIBLE;   /*!80000 INVISIBLE */
*


























