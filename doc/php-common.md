####其他
`````
self只能引用当前类中的方法，而static关键字允许函数能够在运行时动态绑定类中的方法。;
 php -ini | grep short_open_tag

error_log(json_encode($data,JSON_UNESCAPED_UNICODE). "\n", 3, "./my-errors.log");
魔术常量


    public function getExcel($file)
    {
        $PHPExcel = \PHPExcel_IOFactory::load($file);
        $sheet = $PHPExcel->getSheet(0); // 读取第一個工作表
        $highestRow = $sheet->getHighestRow(); // 取得总行数
        $highestColumm = $sheet->getHighestColumn(); // 取得总列数

        // 把Excel数据保存数组中
        $data = array();
        for ($rowIndex = 1; $rowIndex <= $highestRow; $rowIndex++) {
            for ($colIndex = 'A'; $colIndex <= $highestColumm; $colIndex++) {
                $addr = $colIndex . $rowIndex;
                $cell = $sheet->getCell($addr)->getFormattedValue();
                if ($cell instanceof PHPExcel_RichText) {
                    $cell = $cell->__toString();
                }
                $data[$rowIndex][] = trim($cell);
            }
        }
        array_shift($data);
        return $data;
    }


    protected function getCSV($file)
    {
        $arrCSV = array();
        if (($handle = fopen($file, "r")) !== false) {
            $key = 0;
            while (($data = fgetcsv($handle, 0, ",")) !== false) {
                $c = count($data);
                for (
                    $x = 0; $x < $c;
                    $x++
                ) {
                    $arrCSV[$key][$x] = trim($data[$x]);
                }
                $key++;
            }
            fclose($handle);
        }
        array_shift($arrCSV);
        return $arrCSV;
    }
`````