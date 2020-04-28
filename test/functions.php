<?php

if (!function_exists('dd')) {
    /**
     * Dump the passed variable and end the script.
     *
     * @param mixed $arg
     * @param bool $dumpAndDie
     * @return void
     */
    function dd($arg, $dumpAndDie = true)
    {
        echo "<pre>";

        print_r($arg);
        echo "</pre>";
        if ($dumpAndDie) {
            error_log(json_encode($arg, JSON_UNESCAPED_UNICODE) . "\n", 3, "./my-errors.log");
        }
    }
}
