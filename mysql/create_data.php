<?php
$servername = "localhost";
$username = "root";
$password = "";
ini_set('max_execution_time', '0');

try {
    $pdo = new \PDO("mysql:host=$servername;dbname=zjhj_mall_v4", $username, $password);

    $sql = "insert into t_order(order_code,order_amount) values ";

    for ($i = 0; $i < 10000; $i++) {
        $sql .= "('000001044','901'),";
    }
    $sql = substr($sql, 0, strlen($sql) - 1);

    if ($pdo->exec($sql)) {
        echo "插入成功！";
        echo $pdo->lastinsertid();
    }
    echo "连接成功";
} catch (\PDOException $e) {
    echo $e->getMessage();
}
?>