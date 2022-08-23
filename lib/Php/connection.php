<?php
$host="localhost";
$dbname="id19428943_onprogramme";
$user="id19428943_tutos";
$pass="S5k!w?91s~]FE=Or";
try {
    $db = new PDO("mysql:host=$host; dbname=$dbname",$user,$pass);
    echo "Connected";
} catch (\Throwable $th) {
    echo "Error :" .$th->getMessage();
}
?>