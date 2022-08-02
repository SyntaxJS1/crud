<?php
//create database connection
$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "crud";
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

//test database connection
if($conn->connect_errno){
    die("Database Connection Failed". $conn->connect_error . "(" . mysqli_connect_errno() . ")");
}
?>