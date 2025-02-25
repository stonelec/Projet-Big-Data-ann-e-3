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

        $request = 'SELECT espece 
                    FROM arbre 
                    WHERE id_arbre=:id_arbre;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        $arbre = $statement->fetchAll(PDO::FETCH_ASSOC);

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

    static function getPied_ID($id_arbre){
        /**
         * Fonction qui permet de récupérer le pied d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT id_pied 
                    FROM arbre 
                    WHERE id_arbre = :id_arbre;
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

        $request = 'SELECT tdp.type_port
                    FROM arbre a
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    WHERE a.id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getPort_ID($id_arbre){
        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT id_port
                    FROM arbre 
                    WHERE id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }


    static function getAll(){
    /**
     * Fonction qui permet de récupérer toutes les informations
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT a.id_arbre, a.espece, ea.etat_arb, sd.stade_dev, tp.type_pied, tdp.type_port, a.remarquable, a.latitude, a.longitude, a.hauteur_tot, a.hauteur_tronc, a.diametre_tronc, tf.feuillage, a.age_estim
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    static function getAll_byID($id_arbre){
        /**
         * Fonction qui permet de récupérer toutes les informations
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT a.id_arbre, a.espece, ea.etat_arb, sd.stade_dev, tp.type_pied, tdp.type_port, a.remarquable, a.latitude, a.longitude, a.hauteur_tot, a.hauteur_tronc, a.diametre_tronc, tf.feuillage, a.age_estim
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                    WHERE a.id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
    static function getAll_byRemar($remarquable){
        /**
         * Fonction qui permet de récupérer toutes les informations
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT a.id_arbre, a.espece, ea.etat_arb, sd.stade_dev, tp.type_pied, tdp.type_port, a.remarquable, a.latitude, a.longitude, a.hauteur_tot, a.hauteur_tronc, a.diametre_tronc, tf.feuillage, a.age_estim
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                    WHERE a.remarquable = :remarquable;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':remarquable', $remarquable);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    static function getAll_byPort($id_port){
        /**
         * Fonction qui permet de récupérer toutes les informations
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT a.id_arbre, a.espece, ea.etat_arb, sd.stade_dev, tp.type_pied, tdp.type_port, a.remarquable, a.latitude, a.longitude, a.hauteur_tot, a.hauteur_tronc, a.diametre_tronc, tf.feuillage, a.age_estim
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                    WHERE a.id_port = :id_port;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_port', $id_port);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    static function getAll_byPied($id_pied){
        /**
         * Fonction qui permet de récupérer toutes les informations
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT a.id_arbre, a.espece, ea.etat_arb, sd.stade_dev, tp.type_pied, tdp.type_port, a.remarquable, a.latitude, a.longitude, a.hauteur_tot, a.hauteur_tronc, a.diametre_tronc, tf.feuillage, a.age_estim
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                    WHERE a.id_pied = :id_pied;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_pied', $id_pied);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    static function getAll_byStade($id_stade){
        /**
         * Fonction qui permet de récupérer toutes les informations
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT a.id_arbre, a.espece, ea.etat_arb, sd.stade_dev, tp.type_pied, tdp.type_port, a.remarquable, a.latitude, a.longitude, a.hauteur_tot, a.hauteur_tronc, a.diametre_tronc, tf.feuillage, a.age_estim
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                    WHERE a.id_stade_dev = :id_stade;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_stade', $id_stade);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    static function getAll_byEtat($id_etat){
        /**
         * Fonction qui permet de récupérer toutes les informations
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT a.id_arbre, a.espece, ea.etat_arb, sd.stade_dev, tp.type_pied, tdp.type_port, a.remarquable, a.latitude, a.longitude, a.hauteur_tot, a.hauteur_tronc, a.diametre_tronc, tf.feuillage, a.age_estim
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    JOIN type_de_port tdp ON a.id_port = tdp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                    WHERE a.id_etat_arbre = :id_etat;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_etat', $id_etat);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    static function getVisuel_byID($id_arbre){
        /**
         * Fonction qui permet de récupérer le visuel d'un arbre : feuillage et port
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT tf.feuillage, tp.type_port
                    FROM arbre a 
                    JOIN type_de_port tp ON a.id_port = tp.id_port
                    JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                    WHERE id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC)[0];
    }

    static function getDimensions_byID($id_arbre){
        /**
         * Fonction qui permet de récupérer les dimensions d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT hauteur_tronc, diametre_tronc, hauteur_tot
                    FROM arbre 
                    WHERE id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC)[0];
    }

    static function getSol_byID($id_arbre) {
        /**
         * Fonction qui permet de récupérer le sol d'un arbre : Pied et Coordonnées
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT tp.type_pied, longitude, latitude
                    FROM arbre a 
                    JOIN type_de_pied tp ON a.id_pied = tp.id_pied
                    WHERE id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC)[0];
    }

    static function getInfos_byID($id_arbre){
        /**
         * Fonction qui permet de récupérer les informations d'un arbre : espece, remarquable, etat et stade de développement
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT espece, remarquable, ea.etat_arb, sd.stade_dev
                    FROM arbre a
                    JOIN etat_arbre ea ON a.id_etat_arbre = ea.id_etat_arbre
                    JOIN stade_de_dev sd ON a.id_stade_dev = sd.id_stade_dev
                    WHERE id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC)[0];
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

    static function getAgeEstim($id_arbre){
        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT age_estim
                    FROM arbre
                    WHERE id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getRevetement($id_arbre){
        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT revetement
                    FROM arbre
                    WHERE id_arbre = :id_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getFeuillage($id_arbre){
            /**
             * Fonction qui permet de récupérer le port d'un arbre
             * @param $id_arbre
             * @return mixed
             */
            $db = DB::connexion();

            $request = 'SELECT tf.feuillage
                        FROM arbre a
                        JOIN type_feuillage tf ON a.id_feuillage = tf.id_feuillage
                        WHERE a.id_arbre = :id_arbre;
            ';

            $statement = $db->prepare($request);
            $statement->bindParam(':id_arbre', $id_arbre);
            $statement->execute();

            return $statement->fetch()[0];
    }

    static function getFeuillage_ID($id_arbre){
        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT id_feuillage
                        FROM arbre 
                        WHERE id_arbre = :id_arbre;
            ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_arbre', $id_arbre);
        $statement->execute();

        return $statement->fetch()[0];
    }

    // --------------------------------------------------------------------------------------------------------
    // ------------------------------ On récupère les noms de chaque variables : ------------------------------
    // --------------------------------------------------------------------------------------------------------

    static function getAllEtat(){

        $db = DB::connexion();

        $request = 'SELECT etat_arb
                    FROM etat_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllStade(){

        $db = DB::connexion();

        $request = 'SELECT stade_dev
                    FROM stade_de_dev;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllPied(){

        $db = DB::connexion();

        $request = 'SELECT type_pied
                    FROM type_de_pied;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllPort(){

        $db = DB::connexion();

        $request = 'SELECT type_port
                    FROM type_de_port;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllFeuillage(){

        $db = DB::connexion();

        $request = 'SELECT feuillage
                    FROM type_feuillage;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllEspece(){

        $db = DB::connexion();

        $request = 'SELECT DISTINCT  espece
                    FROM arbre;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    // ----------------------------------------------------------------------------------
    // ------------------------------ On récupère les id : ------------------------------
    // ----------------------------------------------------------------------------------

    static function recupIdEtat($id_val_etat){

        $db = DB::connexion();

        $request = 'SELECT id_etat_arbre
                    FROM etat_arbre
                    WHERE etat_arb= :id_val_etat;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_val_etat', $id_val_etat);
        $statement->execute();

        return $statement->fetch()[0];

    }

    static function recupIdStade($id_val_stade){

        $db = DB::connexion();

        $request = 'SELECT id_stade_dev
                    FROM stade_de_dev
                    WHERE stade_dev= :id_val_stade;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_val_stade', $id_val_stade);
        $statement->execute();

        return $statement->fetch()[0];

    }

    static function recupIdPort($id_val_port){

        $db = DB::connexion();

        $request = 'SELECT id_port
                    FROM type_de_port
                    WHERE type_port= :id_val_port;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_val_port', $id_val_port);
        $statement->execute();

        return $statement->fetch()[0];

    }

    static function recupIdPied($id_val_pied){

        $db = DB::connexion();

        $request = 'SELECT id_pied
                    FROM type_de_pied
                    WHERE type_pied= :id_val_pied;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_val_pied', $id_val_pied);
        $statement->execute();

        return $statement->fetch()[0];

    }

    static function recupIdFeuillage($id_val_feuillage){

        $db = DB::connexion();

        $request = 'SELECT id_feuillage
                    FROM type_feuillage
                    WHERE feuillage= :id_val_feuillage;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_val_feuillage', $id_val_feuillage);
        $statement->execute();

        return $statement->fetch()[0];

    }

    static function getNbArbre(){
        $db = DB::connexion();

        $request = 'SELECT count(*)
                    FROM arbre;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetch()[0];
    }

    // ---------------------------------------------------------------------------------------------------------
    // ------------------------------ On créer un arbre avec toutes les valeurs : ------------------------------
    // ---------------------------------------------------------------------------------------------------------

    static function addNewArbre($id_user, $val_longitude, $val_latitude, $val_hauteur_totale, $val_hauteur_tronc, $val_diametre_tronc, $val_etat, $val_stade,
                                $val_port, $val_pied,$val_espece, $val_remarquable, $val_feuillage, $val_age_estime, $val_revetement){

        try {
            $db = DB::connexion();

            $request = '
                    INSERT INTO arbre(id_user, longitude, latitude, hauteur_tot, hauteur_tronc, 
                                      diametre_tronc, id_etat_arbre, id_stade_dev, id_port, id_pied, 
                                      espece, remarquable, id_feuillage, age_estim, revetement)
                    VALUES (:id_user, :val_longitude, :val_latitude, :val_hauteur_totale, :val_hauteur_tronc, 
                            :val_diametre_tronc, :val_etat, :val_stade, :val_port, :val_pied, :val_espece, 
                            :val_remarquable, :val_feuillage, :val_age_estime, :val_revetement);
             ';
            $statement = $db->prepare($request);
            $statement->bindParam(':id_user', $id_user);
            $statement->bindParam(':val_longitude', $val_longitude);
            $statement->bindParam(':val_latitude', $val_latitude);
            $statement->bindParam(':val_hauteur_totale', $val_hauteur_totale);
            $statement->bindParam(':val_hauteur_tronc', $val_hauteur_tronc);
            $statement->bindParam(':val_diametre_tronc', $val_diametre_tronc);
            $statement->bindParam(':val_etat', $val_etat);
            $statement->bindParam(':val_stade', $val_stade);
            $statement->bindParam(':val_port', $val_port);
            $statement->bindParam(':val_pied', $val_pied);
            $statement->bindParam(':val_espece', $val_espece);
            $statement->bindParam(':val_remarquable', $val_remarquable);
            $statement->bindParam(':val_feuillage', $val_feuillage);
            $statement->bindParam(':val_age_estime', $val_age_estime);
            $statement->bindParam(':val_revetement', $val_revetement);

            $statement->execute();
            return "ok";
        } catch (PDOException $e) {
            error_log('Request error: ' . $e->getMessage());
            return "error";
        }

    }

}
?>