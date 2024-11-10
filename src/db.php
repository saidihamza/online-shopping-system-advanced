<?php
$host = 'localhost';  // ou l'adresse IP de votre base de données
$username = 'root';
$password = '';
$database = 'onlineshop';

$conn = mysqli_connect($host, $username, $password, $database);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

echo "Connected successfully";
?>
