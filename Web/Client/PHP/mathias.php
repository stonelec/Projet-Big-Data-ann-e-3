<?php
// Activer l'affichage des erreurs
ini_set('display_errors', 1);
error_reporting(E_ALL);

// Vérifier si le fichier Arbre.php existe et inclure
if (file_exists('Arbre.php')) {
    require_once('Arbre.php');
} else {
    die('Le fichier Arbre.php est introuvable.');
}

// Vérifier si la classe Arbre est définie
if (class_exists('Arbre')) {
    // Appeler la méthode getAll et vérifier le résultat
    try {
        $infos_arbre = Arbre::getAll(2);
        echo '<pre>';
        print_r($infos_arbre);
        echo '</pre>';
    } catch (Exception $e) {
        echo 'Erreur : ' . $e->getMessage();
    }
} else {
    die('La classe Arbre n\'est pas définie.');
}
?>
