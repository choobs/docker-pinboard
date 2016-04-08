<?php

$_SERVER['SERVER_NAME'] = 'localhost';

//http://silex.sensiolabs.org/doc/web_servers.html#php-5-4

$filename = $_SERVER["DOCUMENT_ROOT"] . preg_replace('#(\?.*)$#', '', $_SERVER['REQUEST_URI']);
if (php_sapi_name() === 'cli-server' && is_file($filename)) {
    return false;
}

require $_SERVER["DOCUMENT_ROOT"] . '/index.php';