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

# ----------------------- Prédire les infos -----------------------
    case 'prediction_taille':
        // Vérifier si l'ID est fourni
        if ($id !== NULL) {
            $scriptPath = '../../python/scripts/fonc1.py';

            $hauteurTronc = Arbre::getHauteurTronc($id);
            $ageEstim = Arbre::getAgeEstim($id);
            $troncDiam = Arbre::getDiametre($id);

            $command = escapeshellcmd('python3 ' . $scriptPath . ' ' . $hauteurTronc . ' ' . $ageEstim . ' ' . $troncDiam.' kmeans');
            // $command = " python3 ../../python/scripts/fonc1.py 50 10 20 kmeans "
            $result = exec($command);

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

    case 'ajouter_toutes_valeur':
        $result = Arbre::getAllFeuillage();
        echo json_encode($result);
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

    default:
        // Retourner une erreur si l'action n'est pas reconnue
        echo json_encode(['error' => 'Action non reconnue']);
        break;

}
