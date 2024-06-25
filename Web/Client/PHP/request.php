<?php

require_once('Arbre.php');
require_once('User.php');

// Récupérer la méthode de la requête
$requestMethod = $_SERVER['REQUEST_METHOD'];

// Récupérer les paramètres action et id depuis la requête GET
$requestRessource = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : NULL;

$result = null;

echo(Arbre::getHauteurTot(2));

switch ($requestRessource) {
    case 'hauteur':
        echo "HAUTEUR";
        switch ($requestMethod) {
            case "GET":
                // Vérifier si l'ID est fourni
                if ($id !== NULL) {
                    $result = Arbre::getHauteurTot($id);
                    echo json_encode($result);
                } else {
                    // Retourner une erreur si l'ID n'est pas fourni
                    echo json_encode(['error' => 'ID de l\'arbre manquant']);
                }
                break;
        }
        break;
    default:
        // Retourner une erreur si l'action n'est pas reconnue
        echo json_encode(['error' => 'Action non reconnue']);
        break;
}

?>