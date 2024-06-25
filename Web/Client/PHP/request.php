<?php

require_once('./Arbre.php');
require_once('./User.php');

$requestMethod = $_SERVER['REQUEST_METHOD'];
$requestRessource = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : NULL;
$result = null;

echo "test";

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