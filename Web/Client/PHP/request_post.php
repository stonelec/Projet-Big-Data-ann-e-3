<?php

require_once('Arbre.php');
require_once('User.php');

// Récupérer la méthode de la requête (GET, POST, etc.)

$requestMethod = $_SERVER['REQUEST_METHOD'];

//TOUT EST BON ICI :
echo json_encode($requestMethod);

$requestAction = isset($_GET['action']) ? $_GET['action'] : '';

//TOUT EST BON ICI :
//echo json_encode($requestAction);

$id = isset($_GET['id']) ? $_GET['id'] : NULL;

$result = null;

// ----- On récupère des variables de POST -----

//$requestAction_post=$_POST['ajouter_toutes_valeur'];





















/*
//-------------------------------------------------------
$id_user = 1; //On pourra le récupérer en changeant l'url
$val_longitude = $_POST['$val_longitude'];
$val_latitude = $_POST['val_latitude'];
$val_hauteur_totale = $_POST['$val_hauteur_totale'];
$val_hauteur_tronc = $_POST['val_hauteur_tronc'];
$val_diametre_tronc = $_POST['val_hauteur_tronc'];

$val_etat = $_POST['val_hauteur_tronc']; //IL FAUT SON ID
$val_stade = $_POST['val_hauteur_tronc']; //IL FAUT SON ID
$val_port = $_POST['val_hauteur_tronc']; //IL FAUT SON ID
$val_pied = $_POST['val_hauteur_tronc']; //IL FAUT SON ID

$val_espece = $_POST['val_hauteur_tronc'];
$val_remarquable = $_POST['val_hauteur_tronc'];

$val_feuillage = $_POST['val_hauteur_tronc']; //IL FAUT SON ID

$val_age_estime = $_POST['val_hauteur_tronc'];
$val_revetement = $_POST['val_hauteur_tronc'];
*/

//echo json_encode($val_latitude);
//echo json_encode($val_hauteur_totale);
//echo json_encode($val_hauteur_tronc);
//echo json_encode($val_diametre_tronc);
//echo json_encode($val_etat);
//echo json_encode($val_stade);
//echo json_encode($val_port);
//echo json_encode($val_pied);
//echo json_encode($val_espece);
//echo json_encode($val_remarquable);
//echo json_encode($val_feuillage);
//echo json_encode($val_age_estime);
//echo json_encode($val_revetement);

/*
switch ($requestMethod) {

    case 'GET':

        switch ($requestAction) {

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
       */
    /*
    case 'POST':

        switch ($requestAction_post){

            case 'ajouter_toutes_valeur':

                //$result = Arbre::addNewArbre($id_user, $val_longitude, $val_latitude, $val_hauteur_totale, $val_hauteur_tronc, $val_diametre_tronc, $val_etat, $val_stade,
                //    $val_port, $val_pied, $val_espece, $val_remarquable, $val_feuillage, $val_age_estime, $val_revetement);
                echo json_encode($val_longitude);
                break;


                if($id_user != NULL && $val_longitude != NULL && $val_latitude != NULL && $val_hauteur_totale != NULL && $val_hauteur_tronc != NULL &&
                    $val_diametre_tronc != NULL && $val_etat != NULL && $val_stade != NULL && $val_port != NULL && $val_pied != NULL &&
                    $val_espece != NULL && $val_remarquable != NULL && $val_feuillage != NULL && $val_age_estime != NULL &&
                    $val_revetement != NULL){
                    $result = Arbre::addNewArbre($id_user, $val_longitude, $val_latitude, $val_hauteur_totale, $val_hauteur_tronc, $val_diametre_tronc, $val_etat, $val_stade,
                                $val_port, $val_pied, $val_espece, $val_remarquable, $val_feuillage, $val_age_estime, $val_revetement);
                    echo json_encode($result);
                    break;
                }

                else{

                    $result = "Problème dans les variables";
                    echo json_encode($result);
                    break;

                }

                //$result = "C'est good tu peux pleurer";
                //echo json_encode($result);
                //break;

            default:
                // Retourner une erreur si l'action n'est pas reconnue
                echo json_encode(['error' => 'IL EST RENTRER DANS POST MAIS PAS DANS LE CASE']);
                break;

        }
        break;

    default:
        // Retourner une erreur si l'action n'est pas reconnue
        echo json_encode(['error' => 'IL EST PAS RENTRER DANS GET OU POST']);
        break;
    */
//}



