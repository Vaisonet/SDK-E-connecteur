<?php
require('web.php');

$url = 'ci3.vaiso.net';

$test = web::check_dns_hack($url);

var_dump($test);