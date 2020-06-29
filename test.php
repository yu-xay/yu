<?php
$b = 'rund';
$a = <<<EOF
select * from zjhj_bd_app;{$b}
EOF;
echo $a;
