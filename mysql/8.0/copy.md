change master to master_host=127.0.0.

    CHANGE MASTER TO master_host = '127.0.0.1',
    master_port = 3306,
    master_user = 'admin',
    master_password = '123456',
    master_log_file = 'mysql-bin.000001',
    master_log_pos = 0;