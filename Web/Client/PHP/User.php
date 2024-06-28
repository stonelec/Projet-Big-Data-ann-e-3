<?php

require_once "db.php";
/**
 * Class User
 */
class User {

    static function getNom($id_user){
    /**
     * Fonction qui permet de récupérer le nom d'un utilisateur
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

    static function getPrenom($id_user){
        /**
         * Fonction qui permet de récupérer le prénom d'un utilisateur
         * @param $id_album
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT prenom_user 
                    FROM user 
                    WHERE id_user=:id_user;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_user', $id_user);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getMail($id_user){
        /**
         * Fonction qui permet de récupérer le mail d'un utilisateur
         * @param $id_album
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT email_user 
                    FROM user 
                    WHERE id_user=:id_user;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_user', $id_user);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getDateNaissance($id_user){
        /**
         * Fonction qui permet de récupérer la date de naissance d'un utilisateur
         * @param $id_album
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT date_naissance 
                    FROM user 
                    WHERE id_user=:id_user;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_user', $id_user);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getTelephone($id_user){
        /**
         * Fonction qui permet de récupérer le téléphone d'un utilisateur
         * @param $id_album
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT telephone_user 
                    FROM user 
                    WHERE id_user=:id_user;';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_user', $id_user);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getTypeUser($id_user){
        /**
         * Fonction qui permet de récupérer le type d'un utilisateur
         * @param $id_album
         * @return mixed
         */
        $db = DB::connexion();

        $request = 'SELECT type_user 
                    FROM user u
                    JOIN type_user tu ON u.id_type_user = tu.id_type_user   
                    WHERE u.id_user = :id_user;
        ';

        $statement = $db->prepare($request);
        $statement->bindParam(':id_user', $id_user);
        $statement->execute();

        return $statement->fetch()[0];
    }

    static function getAll($id_user){
        $db = DB::connexion();

        $request = 'SELECT id_user, nom_user, prenom_user, email_user, date_naissance, password_user, telephone_user, type_user 
                    FROM user 
                    JOIN type_user USING (id_type_user)  
                    WHERE id_user = :id_user;';

        $statement = $db->prepare($request);

        $statement->bindParam(':id_user', $id_user);

        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC)[0];
    }

    static function addUser($id_user, $nom_user, $prenom_user, $email_user, $date_naissance, $password_user, $telephone_user, $id_type_user)
    {
        /**
         * Fonction qui permet d'ajouter un utilisateur
         *  /!\ ATTENTION : Les FK sont des id et non les valeurs /!\
         * @param $id_user
         * @param $nom_user
         * @param $prenom_user
         * @param $email_user
         * @param $date_naissance
         * @param $password_user
         * @param $telephone_user
         * @param $id_type_user
         * @return string
         */
        if (!empty($id_user) && !empty($nom_user) && !empty($prenom_user) && !empty($email_user) && !empty($date_naissance) && !empty($password_user) && !empty($telephone_user) && !empty($id_type_user)) {
            try {
                $db = DB::connexion();

                $request = 'INSERT INTO user (id_user, nom_user, prenom_user, email_user, date_naissance, password_user, telephone_user, id_type_user) 
                            VALUES (:id_user, :nom_user, :prenom_user, :email_user, :date_naissance, :password_user, :telephone_user, :id_type_user);
                        ';

                $statement = $db->prepare($request);

                $statement->bindParam(':id_user', $id_user);
                $statement->bindParam(':nom_user', $nom_user);
                $statement->bindParam(':prenom_user', $prenom_user);
                $statement->bindParam(':email_user', $email_user);
                $statement->bindParam(':date_naissance', $date_naissance);
                $statement->bindParam(':password_user', $password_user);
                $statement->bindParam(':telephone_user', $telephone_user);
                $statement->bindParam(':id_type_user', $id_type_user);

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

    static function getAllMail(){

        $db = DB::connexion();

        $request = 'SELECT email_user 
                    FROM public.user;
                    ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function getAllMotDePasse(){

        $db = DB::connexion();

        $request = 'SELECT password_user
                    FROM public.user;
                    ';

        $statement = $db->prepare($request);
        $statement->execute();

        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }

    static function connexion(){

        //Chemin depuis la racine vers le fichier utilisé
        $path = explode('/', $_SERVER['PHP_SELF']);
        $file = array_pop($path);   //Fichier où se trouve l'utilisateur

        //Si l'utilisateur est déja connecté, on le renvoie sur la page d'accueil :

        if (isset($_SESSION['user'])){

            if ($file == 'Login.php'){

                header('Location: ../index.html');

            }
            return $_SESSION['user'];
        }

        //Si l'utilisateur se déconnecte, il le renvoie sur la page d'accueil :
        if (!isset($_SESSION['id_utilisateur']) && $file != 'Login.php') {    //Utilisateur qui se déconnecte
            header('Location: ../index.html');
        }

        //Il rentre un mail et mot de passe :
        if (!empty($_POST['mail']) && !empty($_POST['password'])) { //S'il a rentré les deux champs
            try {

                $db = DB::connexion();

                //On regarde l'id du user et son mot de passe en fonction du mail :
                $statement = $db->prepare('SELECT id_user, password_user FROM public.user WHERE email_user=:mail');

                $statement->bindParam(':mail', $_POST['mail']);
                $statement->execute();
                $result = $statement->fetch(PDO::FETCH_ASSOC);

            } catch (PDOException $exception) {

                error_log('Connection error: ' . $exception->getMessage());
                return false;

            }

            //On regarde si les 2 mots de passe sont les mêmes :
            if (password_verify($_POST['password'], $result['mot_de_passe']) && !empty($result)) {
                $_SESSION['user'] = $result['id_user'];
                header('Location: ../index.html');
            }

            else {
                return "E-Mail ou Mot de passe invalide !";
            }

            //on retourne sa session pour les prochains fichiers
            return $_SESSION['user'];
        }
        return false;

    }

}
?>