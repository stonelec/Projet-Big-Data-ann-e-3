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
    $val_latitude = isset($_POST['val_latitude']) ? $_POST['val_latitude'] : '';
    $val_hauteur_totale = isset($_POST['$al_hauteur_totale']) ? $_POST['val_hauteur_totale'] : '';
    $val_hauteur_tronc = isset($_POST['val_hauteur_tronc']) ? $_POST['val_hauteur_tronc'] : '';
    $val_diametre_tronc = isset($_POST['val_diametre_tronc']) ? $_POST['val_diametre_tronc'] : '';

    $val_etat = isset($_POST['val_etat']) ? $_POST['val_etat'] : ''; //IL FAUT SON ID
    $val_stade = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : ''; //IL FAUT SON ID
    $val_port = isset($_POST['val_port']) ? $_POST['val_port'] : ''; //IL FAUT SON ID
    $val_pied = isset($_POST['val_pied']) ? $_POST['val_pied'] : ''; //IL FAUT SON ID

    $val_espece = isset($_POST['val_espece']) ? $_POST['val_espece'] : '';
    $val_remarquable = isset($_POST['val_remarquable']) ? $_POST['val_remarquable'] : '';

    $val_feuillage = isset($_POST['val_feuillage']) ? $_POST['val_feuillage'] : ''; //IL FAUT SON ID

    $val_age_estime = isset($_POST['val_age_estime']) ? $_POST['val_age_estime'] : '';
    $val_revetement = isset($_POST['val_revetement']) ? $_POST['val_revetement'] : '';

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

                if($id_user != NULL && $val_longitude != NULL && $val_latitude != NULL && $val_hauteur_totale != NULL && $val_hauteur_tronc != NULL &&
                    $val_diametre_tronc != NULL && $val_etat != NULL && $val_stade != NULL && $val_port != NULL && $val_pied != NULL &&
                    $val_espece != NULL && $val_remarquable != NULL && $val_feuillage != NULL && $val_age_estime != NULL &&
                    $val_revetement != NULL){

                    echo json_encode("Rien n'est égal à 0");
                    break;
                }

                else{

                    $result = "Problème dans les variables";
                    echo json_encode($result);
                    break;

                }

                //break;

            default:
                echo json_encode("Error => Rentrer dans le POST mais pas dans le case");
                break;

        }
        break;

    default:

        echo json_encode("Error => Pas rentrer dans le GET ou le POST");
        break;

}



