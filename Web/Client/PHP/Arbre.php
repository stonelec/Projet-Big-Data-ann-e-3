<?php

require_once "db.php";
/**
 * Class Arbre
 */
class Arbre {
    static function getEspece($id_arbre){
    /**
     * Fonction qui permet de récupérer l'espèce d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();
        if (!$db) {
            error_log('Failed to connect to the database.');
            return ['error' => 'Failed to connect to the database.'];
        }

        $request = 'SELECT espece 
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        $arbre = $statement->fetch()[0];

        // retourner la réponse JSON
        header('Content-Type: application/json');
        echo json_encode($arbre);
    }


    static function getHauteurTot($id_arbre){
    /**
     * Fonction qui permet de récupérer la hauteur totale d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT hauteur_tot
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];

    }


    static function getHauteurTronc($id_arbre){
    /**
     * Fonction qui permet de récupérer la hauteur du tronc d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT hauteur_tronc
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }


    static function getDiametre($id_arbre){
    /**
     * Fonction qui permet de récupérer le diamètre d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT diametre_tronc
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }


    static function getDimensionsArbre($id_arbre){
    /**
     * Fonction qui permet de récupérer les dimensions d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT hauteur_tot, hauteur_tronc, diametre_tronc
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch();
    }


    static function getRemarquable($id_arbre){
    /**
     * Fonction qui permet de récupérer si un arbre est remarquable
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT remarquable
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC)[0];
    }


    static function getCoordonnees($id_arbre){
    /**
     * Fonction qui permet de récupérer les coordonnées d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT latitude, longitude
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch();

    }

    static function getEtat($id_arbre){
    /**
     * Fonction qui permet de récupérer l'état d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT etat_arb 
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arb = ea.id_etat_arb   
                    WHERE a.id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }


    static function getStadeDev($id_arbre){
    /**
     * Fonction qui permet de récupérer le stade de développement d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT stade_dev 
                    FROM arbre a
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev   
                    WHERE a.id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }


    static function getPied($id_arbre){
    /**
     * Fonction qui permet de récupérer le pied d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT type_pied 
                    FROM arbre a
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied   
                    WHERE a.id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }


    static function getPort($id_arbre){
    /**
     * Fonction qui permet de récupérer le port d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT type_port 
                    FROM arbre a
                    JOIN type_de_port tp ON a.id_type_port = tp.id_type_port   
                    WHERE a.id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }


    static function getAll($id_arbre){
    /**
     * Fonction qui permet de récupérer toutes les informations d'un arbre
     * @param $id_arbre
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT id_arbre, espece, etat_arb, stade_dev, type_pied, type_port, remarquable, latitude, longitude, hauteur_tot, hauteur_tronc, diametre_tronc,  
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arb = ea.id_etat_arb
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_type_port = tdp.id_type_port
                    WHERE a.id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch();
    }


    static function addArbre($espece, $hauteur_tot, $hauteur_tronc, $diametre_tronc, $remarquable, $latitude, $longitude, $id_etat_arb, $id_stade_dev, $id_type_pied, $id_type_port){
    /**
     * Fonction qui permet d'ajouter un arbre
     * /!\ ATTENTION : Les FK sont des id et non les valeurs /!\
     * @param $espece
     * @param $hauteur_tot
     * @param $hauteur_tronc
     * @param $diametre_tronc
     * @param $remarquable
     * @param $latitude
     * @param $longitude
     * @param $id_etat_arb
     * @param $id_stade_dev
     * @param $id_type_pied
     * @param $id_type_port
     */
        if (!empty($espece) && !empty($hauteur_tot) && !empty($hauteur_tronc) && !empty($diametre_tronc) && !empty($remarquable) && !empty($latitude) && !empty($longitude) && !empty($id_etat_arb) && !empty($id_stade_dev) && !empty($id_type_pied) && !empty($id_type_port)) {
            try {
                $db = DB::connexion();

                $request = 'INSERT INTO arbre(espece, hauteur_tot, hauteur_tronc, diametre_tronc, remarquable, latitude, longitude, id_etat_arb, id_stade_dev, id_pied, id_type_port)
                    VALUES (:espece, :hauteur_tot, :hauteur_tronc, :diametre_tronc, :remarquable, :latitude, :longitude, :id_etat_arb, :id_stade_dev, :id_type_pied, :id_type_port);
                ';

                $statement = $db->prepare($request);
                $statement->bindParam(':espece', $espece);
                $statement->bindParam(':hauteur_tot', $hauteur_tot);
                $statement->bindParam(':hauteur_tronc', $hauteur_tronc);
                $statement->bindParam(':diametre_tronc', $diametre_tronc);
                $statement->bindParam(':remarquable', $remarquable);
                $statement->bindParam(':latitude', $latitude);
                $statement->bindParam(':longitude', $longitude);
                $statement->bindParam(':id_etat_arb', $id_etat_arb);
                $statement->bindParam(':id_stade_dev', $id_stade_dev);
                $statement->bindParam(':id_type_pied', $id_type_pied);
                $statement->bindParam(':id_type_port', $id_type_port);

                $statement->execute();
                return "ok";
            } catch (PDOException $e) {
                error_log('Request error: ' . $e->getMessage());
                return "error";
            }
        }
        else {
            return "error";
        }
    }




}
?>