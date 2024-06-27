<?php

require_once('Arbre.php');
require_once('User.php');

// Récupérer la méthode de la requête (GET, POST, etc.)

$requestMethod = $_SERVER['REQUEST_METHOD'];

//TOUT EST BON ICI :
//echo json_encode($requestMethod);

$result = null;

// ---------- On récupère des variables de GET et de POST ----------

$requestAction_get = isset($_GET['action']) ? $_GET['action'] : '';
$requestAction_post = isset($_POST['action']) ? $_POST['action'] : '';

if($requestMethod == 'GET'){

    $id = isset($_GET['id']) ? $_GET['id'] : NULL;

}
else if($requestMethod == 'POST'){

    $id_user = 1; //On pourra le récupérer en changeant l'url
    $val_longitude = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';
    $val_latitude = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';
    $val_hauteur_totale = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';
    $val_hauteur_tronc = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';
    $val_diametre_tronc = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';

    $val_etat = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : ''; //IL FAUT SON ID
    $val_stade = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : ''; //IL FAUT SON ID
    $val_port = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : ''; //IL FAUT SON ID
    $val_pied = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : ''; //IL FAUT SON ID

    $val_espece = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';
    $val_remarquable = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';

    $val_feuillage = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : ''; //IL FAUT SON ID

    $val_age_estime = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';
    $val_revetement = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';

}

// -------------------------------------------------------

switch ($requestMethod) {

    case 'GET':

        switch ($requestAction_get) {

            case 'ajouter_arbre_etat':
                $result = Arbre::getAllEtat();
                echo json_encode($result);
                break;

            case 'ajouter_arbre_stade':
                $result = Arbre::getAllStade();
                echo json_encode($result);
                break;

            case 'ajouter_arbre_pied':
                $result = Arbre::getAllPied();
                echo json_encode($result);
                break;

            case 'ajouter_arbre_port':
                $result = Arbre::getAllPort();
                echo json_encode($result);
                break;

            case 'ajouter_arbre_feuillage':
                $result = Arbre::getAllFeuillage();
                echo json_encode($result);
                break;

            default:
                // Retourner une erreur si l'action n'est pas reconnue
                echo json_encode("Error => Rentrer dans le GET mais pas dans le case");
                break;

        }
        break;


    case 'POST':

        switch ($requestAction_post){

            case 'ajouter_toutes_valeur':
                echo json_encode($val_longitude);
                break;

            default:
                echo json_encode("Error => Rentrer dans le POST mais pas dans le case");
                break;

        }
        break;

    default:

        echo json_encode("Error => Pas rentrer dans le GET ou le POST");
        break;

}



