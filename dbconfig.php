<?php

//Connection Settings
$host = "localhost";
$user = "root";
$password = "";
$dbname = "grocery_fr";

//Data Source Name
$dsn = "mysql:host={$host};dbname={$dbname}";

//create connection
$pdo = new PDO($dsn, $user, $password, [
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
]);
$pdo->exec("SET time_zone = '+8:00';");

?>
