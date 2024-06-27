<?php

session_start();
include('User.php');

if($_SERVER['REQUEST_METHOD'] == $_POST){

    $email = $_POST['email'];
    $password = $_POST['password'];

    $query = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";

}

?>
