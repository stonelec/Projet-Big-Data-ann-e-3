<?php

require_once('Arbre.php');
require_once('User.php');

// Récupérer la méthode de la requête (GET, POST, etc.)

$requestMethod = $_SERVER['REQUEST_METHOD'];
//echo "RequestMethod : ";
echo json_encode($requestMethod);

$requestAction = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : NULL;

$result = null;

// ----- On récupère des variables de POST -----

if($requestMethod == $_POST){

    $id_user = 1; //On pourra le récupérer en changeant l'url
    $val_longitude = isset($_GET['$val_longitude']) ? $_GET['$val_longitude'] : NULL;
    $val_latitude = isset($_GET['val_latitude']) ? $_GET['val_latitude'] : NULL;
    $val_hauteur_totale = isset($_GET['val_hauteur_totale']) ? $_GET['val_hauteur_totale'] : NULL;
    $val_hauteur_tronc = isset($_GET['val_hauteur_tronc']) ? $_GET['val_hauteur_tronc'] : NULL;
    $val_diametre_tronc = isset($_GET['val_diametre_tronc']) ? $_GET['val_diametre_tronc'] : NULL;

    $val_etat = isset($_GET['val_etat']) ? $_GET['val_etat'] : NULL; //IL FAUT SON ID
    $val_stade = isset($_GET['val_stade']) ? $_GET['val_stade'] : NULL; //IL FAUT SON ID
    $val_port = isset($_GET['val_port']) ? $_GET['val_port'] : NULL; //IL FAUT SON ID
    $val_pied = isset($_GET['val_pied']) ? $_GET['val_pied'] : NULL; //IL FAUT SON ID

    $val_espece = isset($_GET['val_espece']) ? $_GET['val_espece'] : NULL;
    $val_remarquable = isset($_GET['$val_remarquable']) ? $_GET['$val_remarquable'] : NULL;

    $val_feuillage = isset($_GET['val_feuillage']) ? $_GET['val_feuillage'] : NULL; //IL FAUT SON ID

    $val_age_estime = isset($_GET['val_age_estime']) ? $_GET['val_age_estime'] : NULL;
    $val_revetement = isset($_GET['val_revetement']) ? $_GET['val_revetement'] : NULL;


    echo json_encode($val_latitude);
    echo json_encode($val_hauteur_totale);
    echo json_encode($val_hauteur_tronc);
    echo json_encode($val_diametre_tronc);
    echo json_encode($val_etat);
    echo json_encode($val_stade);
    echo json_encode($val_port);
    echo json_encode($val_pied);
    echo json_encode($val_espece);
    echo json_encode($val_remarquable);
    echo json_encode($val_feuillage);
    echo json_encode($val_age_estime);
    echo json_encode($val_revetement);

}

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


    case 'POST':

        switch ($requestAction){

            case 'ajouter_toutes_valeur':

                $result = Arbre::addNewArbre($id_user, $val_longitude, $val_latitude, $val_hauteur_totale, $val_hauteur_tronc, $val_diametre_tronc, $val_etat, $val_stade,
                    $val_port, $val_pied, $val_espece, $val_remarquable, $val_feuillage, $val_age_estime, $val_revetement);
                echo json_encode($result);
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

}
*/


