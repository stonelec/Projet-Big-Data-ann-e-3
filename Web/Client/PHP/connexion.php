<?php

session_start();

$name = $_POST['username'];
$pwd = $_POST['password'];

$username = 'user';
$password = 'pass';

// Vérifiez les informations d'identification de l'utilisateur
if ($name == $username && $pwd == $password) {
    $_SESSION['loggedin'] = true;
    $_SESSION['username'] = $name;
    header("Location: accueil.html");
    exit;
}

else {
    $_SESSION['loggedin'] = false;
    $error_message = "Nom d'utilisateur ou mot de passe incorrect.";
}
?>
