<?php

/*
 * Database Connector file 
 * Define the database
 * access the database with username and password 
 */


DEFINE('DB_USER', 'root');
DEFINE('DB_PASSWORD', 'test123');

DEFINE('DB_HOST', 'localhost');

DEFINE('DB_NAME', 'total sales');

//Make connection
$dbc=@mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD,DB_NAME )OR die('Could not connecto MySQL'.mysqli_connect_error());




?>
