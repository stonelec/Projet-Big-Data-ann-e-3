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

    $id = isset($_POST['id']) ? $_POST['id'] : NULL;
    $id_user = intval($id);

    $val_longitude_base = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : '';
    $val_longitude = floatval($val_longitude_base);

    $val_latitude_base = isset($_POST['val_latitude']) ? $_POST['val_latitude'] : '';
    $val_latitude = floatval($val_latitude_base);

    $val_hauteur_totale_base = isset($_POST['val_hauteur_totale']) ? $_POST['val_hauteur_totale'] : '';
    $val_hauteur_totale = floatval($val_hauteur_totale_base);

    $val_hauteur_tronc_base = isset($_POST['val_hauteur_tronc']) ? $_POST['val_hauteur_tronc'] : '';
    $val_hauteur_tronc = floatval($val_hauteur_tronc_base);

    $val_diametre_tronc_base = isset($_POST['val_diametre_tronc']) ? $_POST['val_diametre_tronc'] : '';
    $val_diametre_tronc = floatval($val_diametre_tronc_base);

    $val_age_estime_base = isset($_POST['val_age_estime']) ? $_POST['val_age_estime'] : '';
    $val_age_estime = intval($val_age_estime_base);

    //Il faut que quand on commence à rentrer des lettres il y a des propositions
    $val_espece = isset($_POST['val_espece']) ? $_POST['val_espece'] : '';

    $id_val_etat = isset($_POST['val_etat']) ? $_POST['val_etat'] : '';
    $val_etat = Arbre::recupIdEtat($id_val_etat);

    $id_val_stade = isset($_POST['val_stade']) ? $_POST['val_stade'] : '';
    $val_stade = Arbre::recupIdStade($id_val_stade);

    $id_val_port = isset($_POST['val_port']) ? $_POST['val_port'] : '';
    $val_port = Arbre::recupIdPort($id_val_port);

    $id_val_pied = isset($_POST['val_pied']) ? $_POST['val_pied'] : '';
    $val_pied = Arbre::recupIdPied($id_val_pied);

    $id_val_feuillage = isset($_POST['val_feuillage']) ? $_POST['val_feuillage'] : ''; //IL FAUT SON ID
    $val_feuillage = Arbre::recupIdFeuillage($id_val_feuillage);

    $val_remarquable = isset($_POST['val_remarquable']) ? $_POST['val_remarquable'] : '';
    $id_user = isset($_POST['id_user']) ? $_POST['id_user'] : '';

    if($val_remarquable == 'Oui'){

        $val_remarquable = 0;

    }
    else{

        $val_remarquable = 1;

    }

    $val_revetement = isset($_POST['val_revetement']) ? $_POST['val_revetement'] : '';

    if($val_revetement == 'Oui'){

        $val_revetement = 0;

    }
    else{

        $val_revetement = 1;

    }


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

            case 'ajouter_arbre_espece':
                $result = Arbre::getAllEspece();
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

                $result = Arbre::addNewArbre(1, $val_longitude, $val_latitude, $val_hauteur_totale, $val_hauteur_tronc, $val_diametre_tronc, $val_etat, $val_stade,
                        $val_port, $val_pied, $val_espece, $val_remarquable, $val_feuillage, $val_age_estime, $val_revetement);
                echo json_encode($result);

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



