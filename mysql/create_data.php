<?php
$servername = "localhost";
$username = "root";
$password = "";
$port = 3306;
ini_set('max_execution_time', '0');

try {
    $pdo = new \PDO("mysql:host=$servername;dbname=zjhj_mall_v4;post=$port", $username, $password);

    $table = <<<SQL
CREATE TABLE `zjhj_mall_v4`.`t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` int(11) NOT NULL,
  `order_amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
SQL;

    try {
        $pdo->exec($table);
    } catch (Exception $exception) {
        throw $exception;
    }


    $sql = "insert into t_order(order_code,order_amount) values ";

    for ($i = 0; $i < 10000; $i++) {
        $sql .= "($i,'901'),";
    }
    $sql = substr($sql, 0, strlen($sql) - 1);

    if ($pdo->exec($sql)) {
        echo "插入成功！";
    } else {
        echo $pdo->lastinsertid();
    }
    echo "连接成功";
} catch (\PDOException $e) {
    echo $e->getMessage();
}
?>