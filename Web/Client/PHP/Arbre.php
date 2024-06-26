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

    static function getAllEtat(){

        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT etat_arb
                    FROM etat_arbre;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllStade(){

        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT stade_dev
                    FROM stade_de_dev;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllPied(){

        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT type_pied
                    FROM type_de_pied;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllPort(){

        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT type_port
                    FROM type_de_port;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllFeuillage(){

        /**
         * Fonction qui permet de récupérer le port d'un arbre
         * @param $id_arbre
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT feuillage
                    FROM type_feuillage;
        ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

}
?>