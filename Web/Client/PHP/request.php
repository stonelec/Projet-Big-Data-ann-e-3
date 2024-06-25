<?php

require_once('./Arbre.php');
require_once('./User.php');

$requestMethod = $_SERVER['REQUEST_METHOD'];
$request = substr($_SERVER['PATH_INFO'], 1);
$request = explode('/', $request);
$requestRessource = array_shift($request);

$id = array_shift($request);
if ($id == '')
    $id = NULL;
$result = null;

switch ($requestRessource) {
    case 'hauteur':
        switch ($requestMethod) {
            case "GET":
                $result =  Arbre::getHauteurTot($id);
                echo json_encode($result);
                break;
        }
        break;

}

?>