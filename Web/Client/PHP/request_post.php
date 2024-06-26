<?php

require_once('Arbre.php');
require_once('User.php');

// Récupérer la méthode de la requête (GET, POST, etc.)
$requestMethod = $_SERVER['REQUEST_METHOD'];

// Récupérer les paramètres action et id depuis la requête GET
$requestAction_get = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : NULL;

$result = null;

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


}

// Récupérer les paramètres action et id depuis la requête GET
$requestAction_post = isset($_POST['action']) ? $_POST['action'] : '';

$val_espece = isset($_POST['val_espece']) ? $_POST['val_espece'] : NULL;
$val_latitude = isset($_POST['val_latitude']) ? $_POST['val_latitude'] : NULL;
$val_longitude = isset($_POST['val_longitude']) ? $_POST['val_longitude'] : NULL;
$val_hauteur_tronc = isset($_POST['val_hauteur_tronc']) ? $_POST['val_hauteur_tronc'] : NULL;
$val_diametre_tronc = isset($_POST['val_diametre_tronc']) ? $_POST['val_diametre_tronc'] : NULL;
$val_etat = isset($_POST['val_etat']) ? $_POST['val_etat'] : NULL;
$val_stade = isset($_POST['val_stade']) ? $_POST['val_stade'] : NULL;
$val_pied = isset($_POST['val_pied']) ? $_POST['val_pied'] : NULL;
$val_port = isset($_POST['val_port']) ? $_POST['val_port'] : NULL;
$val_feuillage = isset($_POST['val_feuillage']) ? $_POST['val_feuillage'] : NULL;

switch ($requestAction_post){

    case 'ajouter_toutes_valeur':
        if($val_espece != NULL && $val_latitude != NULL && $val_longitude != NULL && $val_hauteur_tronc != NULL && $val_diametre_tronc != NULL &&
            $val_etat != NULL && $val_stade != NULL && $val_pied != NULL && $val_port != NULL && $val_feuillage != NULL){
            $result = Arbre::addArbre();
            echo json_encode($result);
        }
        break;

    default:
        // Retourner une erreur si l'action n'est pas reconnue
        echo json_encode(['error' => 'Action non reconnue']);
        break;

}

