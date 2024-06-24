<?php

require_once "../../DB.php";
/**
 * Class User
 */
class User {

    static function getName($id_user){
    /**
     * Fonction qui permet de récupérer le nom d'un album
     * @param $id_album
     * @return mixed
     */
        $db = DB::connexion();

        $request = 'SELECT nom_user 
                    FROM user 
                    WHERE id_user=:id_user;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_user', $id_user);
        $statement->execute();

        return $statement->fetch()[0];
    }

}


?>