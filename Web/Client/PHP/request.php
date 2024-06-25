<?php

require_once('Arbre.php');
require_once('User.php');

// Récupérer la méthode de la requête (GET, POST, etc.)
$requestMethod = $_SERVER['REQUEST_METHOD'];

// Récupérer les paramètres action et id depuis la requête GET
$requestAction = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : NULL;

$result = null;

switch ($requestAction) {
    case 'hauteur':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getHauteurTronc($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'diametre':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getDiametre($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'coordonnees':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getCoordonnees($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    default:
        // Retourner une erreur si l'action n'est pas reconnue
        echo json_encode(['error' => 'Action non reconnue']);
        break;


}

?>