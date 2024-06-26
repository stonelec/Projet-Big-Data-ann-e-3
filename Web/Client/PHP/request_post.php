<?php

require_once('Arbre.php');
require_once('User.php');


$action = $_GET['action'];

// Vérifie si la variable 'action' est définie et n'est pas vide
if (isset($action) && !empty($action)) {
    // Utilise la valeur de 'action' comme nécessaire
    echo "La valeur de 'action' est : " . $action;
} else {
    // Gère le cas où 'action' n'est pas défini ou est vide
    echo "La variable 'action' n'est pas définie ou est vide.";
}

/*
// Récupérer la méthode de la requête (GET, POST, etc.)
$requestMethod = $_SERVER['REQUEST_METHOD'];

// ----- AVEC GET -----

$requestAction_get = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : NULL;

// ----- AVEC POST -----

$requestAction_post = isset($_POST['action']) ? $_POST['action'] : '';

echo json_encode([

    'Le requestAction_post : ' => $requestAction_post,

]);

$result = null;

// ----- On récupère des variables de POST -----

$id_user = 1; //On pourra le récupérer en changeant l'url
$val_longitude = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : NULL;
$val_latitude = isset($_POST['val_latitude']) ? $_POST['val_latitude'] : NULL;
$val_hauteur_totale = isset($_POST['val_hauteur_totale']) ? $_POST['val_hauteur_totale'] : NULL;
$val_hauteur_tronc = isset($_POST['val_hauteur_tronc']) ? $_POST['val_hauteur_tronc'] : NULL;
$val_diametre_tronc = isset($_POST['val_diametre_tronc']) ? $_POST['val_diametre_tronc'] : NULL;

$val_etat = isset($_POST['val_etat']) ? $_POST['val_etat'] : NULL; //IL FAUT SON ID
$val_stade = isset($_POST['val_stade']) ? $_POST['val_stade'] : NULL; //IL FAUT SON ID
$val_port = isset($_POST['val_port']) ? $_POST['val_port'] : NULL; //IL FAUT SON ID
$val_pied = isset($_POST['val_pied']) ? $_POST['val_pied'] : NULL; //IL FAUT SON ID

$val_espece = isset($_POST['val_espece']) ? $_POST['val_espece'] : NULL;
$val_remarquable = isset($_POST['$val_remarquable']) ? $_POST['$val_remarquable'] : NULL;

$val_feuillage = isset($_POST['val_feuillage']) ? $_POST['val_feuillage'] : NULL; //IL FAUT SON ID

$val_age_estime = isset($_POST['val_age_estime']) ? $_POST['val_age_estime'] : NULL;
$val_revetement = isset($_POST['val_revetement']) ? $_POST['val_revetement'] : NULL;

switch ($requestMethod) {

    case 'GET':

        switch ($requestAction_get) {

            # =========================================================
            # ===================== ajouter_arbre =====================
            # =========================================================

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
                echo json_encode(['error' => 'IL EST PAS RENTRER DANS LE GET']);
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
                    $result = Arbre::addNewArbre($id_user, $val_longitude, $val_latitude, $val_hauteur_totale, $val_hauteur_tronc, $val_diametre_tronc, $val_etat, $val_stade,
                                $val_port, $val_pied, $val_espece, $val_remarquable, $val_feuillage, $val_age_estime, $val_revetement);
                    echo json_encode($result);
                }
                break;

            default:
                // Retourner une erreur si l'action n'est pas reconnue
                echo json_encode(['error' => 'IL EST RENTRER DANS POST MAIS PAS DANS LE CASE']);
                break;

        }
        break;

    default:
        // Retourner une erreur si l'action n'est pas reconnue
        echo json_encode(['error' => 'IL EST PAS RENTRER DANS GET OU POST']);
        break;*/
