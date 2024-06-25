<?php

echo "test";

require_once('Client/PHP/Arbre.php');
require_once('Client/PHP/User.php');

$requestMethod = $_SERVER['REQUEST_METHOD'];
$action = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : '';
$result = null;

switch ($action) {
    case 'hauteur':
        if ($requestMethod === 'GET') {
            $result = Arbre::getHauteurTronc($id);
            echo json_encode($result);
        }
        break;

    default:
        // Gestion des cas où l'action demandée n'est pas gérée
        http_response_code(404); // Renvoie un code d'erreur HTTP 404
        echo json_encode(array('message' => 'Action non trouvée'));
        break;
}

?>