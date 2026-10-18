<?php
require_once "dbconfig.php";
echo "Connected! Items in table: ";
echo $pdo->query("SELECT COUNT(*) FROM grocery_items")->fetchColumn();