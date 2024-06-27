<?php

require_once('Arbre.php');
require_once('User.php');

// Récupérer la méthode de la requête (GET, POST, etc.)
$requestMethod = $_SERVER['REQUEST_METHOD'];

// Récupérer les paramètres action et id depuis la requête GET
$requestAction = isset($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) ? $_GET['id'] : NULL;

$result = null;

switch ($requestAction) {

# =============================================================
# ===================== prediction arbre ======================
# =============================================================

# ----------------------- Récupérer les infos -----------------------
    case 'hauteur_tronc':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getHauteurTronc($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'diametre':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getDiametre($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'coordonnees':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getCoordonnees($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'hauteurtotale':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getHauteurTot($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'port':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getPort($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'pied':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getPied($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'age_estim':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getAgeEstim($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'revetement':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getRevetement($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'feuillage':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getFeuillage($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'data_id':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getDataPredAge($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    //----- CONNEXION -----

    case 'recuperermail' :
        $result = User::getAllMail();
        echo json_encode($result);
        break;

    case 'recuperermdp' :
        $result = User::getAllMotDePasse();
        echo json_encode($result);
        break;

# ----------------------- Prédire les infos -----------------------
    case 'prediction_taille':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {

            $hauteurTronc = Arbre::getHauteurTronc($id);
            $ageEstim = Arbre::getAgeEstim($id);
            $troncDiam = Arbre::getDiametre($id);

            $command = 'cd ../../python/scripts && python3 fonc1.py '.$hauteurTronc.' '.$ageEstim.' '.$troncDiam.' kmeans';
            // $command = " python3 fonc1.py 50 10 20 kmeans "
            exec($command,$output, $result);

            $result = file_get_contents('../../python/scripts/fonc1.json');

            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'prediction_age':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {

            $troncDiam = Arbre::getDiametre($id);
            $hauteurTot = Arbre::getHauteurTot($id);
            $hauteurTronc = Arbre::getHauteurTronc($id);

            $command = 'cd ../../python/scripts && python3 fonc2.py '.$troncDiam.' '.$hauteurTot.' '.$hauteurTronc.' rf';

            exec($command,$output, $result);

            $result = file_get_contents('../../python/scripts/fonc2.json');

            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'prediction_deracinement':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {

            $hauteurTot = Arbre::getHauteurTot($id);
            $hauteurTronc = Arbre::getHauteurTronc($id);
            $troncDiam = Arbre::getDiametre($id);
            $fkPort = Arbre::getPort_ID($id);
            $feuillage = Arbre::getFeuillage_ID($id);
            $fkPied = Arbre::getPied_ID($id);
            $fkRevet = Arbre::getRevetement($id);

            // ['haut_tot', 'haut_tronc', 'tronc_diam', 'fk_port', 'feuillage', 'X', 'Y']
            $command = 'cd ../../python/scripts && python3 fonc3.py '.$hauteurTot.' '.$hauteurTronc.' '.$troncDiam.' '.$fkPort.' '.$feuillage.' '.$fkPied.' '.$fkRevet.' rf';

            exec($command,$output, $result);

            $result = file_get_contents('../../python/scripts/fonc3.json');

            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

# =============================================================
# ===================== ajouter_arbre =====================
# =============================================================

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

# ======================================================
# ===================== visualiser =====================
# ======================================================

    case 'all_data':
        $result = Arbre::getAll();
        echo json_encode($result);
        break;

    case 'all_data_remarquable':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getAll_byRemar($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'Valeur de remarquable manquante']);
        }
        break;

    case 'all_data_port':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getAll_byPort($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID du port manquant']);
        }
        break;

    case 'all_data_pied':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getAll_byPied($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID du pied manquant']);
        }
        break;

    case 'all_data_stade':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getAll_byStade($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID du stade manquant']);
        }
        break;

    case 'all_data_etat':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getAll_byEtat($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'etat manquant']);
        }
        break;


# =============================================================
# ===================== visualiser_detail =====================
# =============================================================

    case 'infos':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getInfos_byID($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'visuel':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getVisuel_byID($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'dimensions':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getDimensions_byID($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

    case 'sol':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $result = Arbre::getSol_byID($id);
            echo json_encode($result);
        } else {
            // Retourner une erreur si l'ID n'est pas fourni
            echo json_encode(['error' => 'ID de l\'arbre manquant']);
        }
        break;

# =============================================================
# ===================== visualiser_detail =====================
# =============================================================
    case 'prediction_toutes_taille':
        // Vérifier si l'ID est fourni
        $n_arbres = Arbre::getNbArbre();
        $result = array();
        $id_hey = 0;
        for ($id_hey = 1; $id_hey <= 20; $id_hey++) {

            $hauteurTronc = Arbre::getHauteurTronc($id_hey);
            $ageEstim = Arbre::getAgeEstim($id_hey);
            $troncDiam = Arbre::getDiametre($id_hey);

            $command = 'cd ../../python/scripts && python3 fonc1.py '.$hauteurTronc.' '.$ageEstim.' '.$troncDiam.' kmeans';
            // $command = " python3 fonc1.py 50 10 20 kmeans "
            exec($command, $output, $resultCommand);

            $resultNumber = (int)file_get_contents('../../python/scripts/fonc1.json');
            $result[$id_hey-1] = $resultNumber;
        }
        echo json_encode($result);
        break;


    default:
        // Retourner une erreur si l'action n'est pas reconnue
        echo json_encode(['error' => 'Action non reconnue']);
        break;

}

?>

