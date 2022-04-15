### mysqlbinlog
###### 在Windows环境下，安装完成Mysql后，在安装目录bin下会存在mysqlbinlog.exe应用程序。
`mysqlbinlog -vv --base64-output=DECODE-ROWS mysql-bin.000018 | grep -A4 'INSERT' > extra02.sql`

###### [] 非必选
###### [a|b] 多选一
###### | 多选
### 存储过程
````
delimiter //
CREATE 
    [DEFINER = {user | CURRENT_USER}]  /* definer 'root' @'localhost */
PROCEDURE 参数 ([proc_parameter[,...]])
    [characteristic ...] routine_body
delimiter ;

proc_parameter:
    [IN | OUT | INOUT] 参数名 参数类形 /** inout para_name [int | float | double | varcahr]

characteristic:
  | COMMENT 'string'                     /* 注解 'string' */
  | LANGUAGE SQL                         /* 语言 sql */
  | [NOT] DETERMINISTIC                  /* [不]确定性输出 (没使用) */
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA } /* {不包含读或者写|不包含sql|子包含读不包含写|包含写} */
  | SQL SECURITY { DEFINER | INVOKER }  /* 指定存储过程谁来执行 {创建者的许可 | 执行者的许可} */

routine_body:
　　Valid SQL routine statement

[begin_label:] BEGIN
　　[statement_list]
　　　　……
END [end_label]

delimiter 


create 
    definer 'root' @'localhost' 
procedure params_naem ([in out inout para_name type])
characteristic
language sql
comment 'string'
contains sql no sql reads sql data modifies sql data
not deterministic
sql security definer invoker
begin
end 
delimiter
````
### 触发器
````
$xslt

```` 

### 视图 （虚拟表）
````
$xslt

````
### 分区
````
$xslt

````
    