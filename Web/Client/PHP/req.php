<?php

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

$requestMethod = $_SERVER['REQUEST_METHOD'];
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
function get($db, $requestRessource) {
// ===================== Données des arbres =====================
    if($requestRessource == 'all_data') {

        echo("Hello");
        $id_arbre = $_GET["id_arbre"];
        $data = Arbre::getAll($id_arbre);
    }

    // Envoi de la réponse au client.
    header('Content-Type: application/json; charset=utf-8');
    //header('Cache-control: no-store, no-cache, must-revalidate');
    //header('Pragma: no-cache');
    //header('HTTP/1.1 200 OK');
    echo json_encode($data);
    exit();
}














