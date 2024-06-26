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
    case 'hauteur_tronc':
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

    case 'hauteurtotale':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getHauteurTot($id);
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

// ---------------------------------------------------------------------------------------------

require_once ('db.php');
require_once ('User.php');
require_once ('Arbre.php');
// Connection à la database
$db = DB::connexion();
if (!$db)
{
    header('HTTP/1.1 503 Service Unavailable');
    exit;
}
//$requestMethod = $_SERVER['REQUEST_METHOD'];
$request = substr($_SERVER['PATH_INFO'], 1);
$request = explode('/', $request);
$requestRessource = array_shift($request);
switch ($requestMethod){
    case "GET":
        get($db, $requestRessource);
    case "POST":
        post($db, $requestRessource);
    case "PUT":
        put($db, $requestRessource);
    case "DELETE":
        delete($db, $requestRessource, $request);
}
// <<--------------------------// GET \\-------------------------->>

$myDB = DB::connexion();
function get($db, $requestRessource) {
// ===================== Données des arbres =====================
    if($requestRessource == 'all_data') {
        $data = Arbre::getAll();
    }
    // Envoi de la réponse au client.
    header('Content-Type: application/json; charset=utf-8');
    //header('Cache-control: no-store, no-cache, must-revalidate');
    //header('Pragma: no-cache');
    //header('HTTP/1.1 200 OK');
    echo json_encode($data);
    exit();
}

?>


