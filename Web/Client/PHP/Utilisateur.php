<?php

session_start();
require_once('db.php');

class Utilisateur{

    static function connexion_utilisateur($mail, $password){

        //Fichier où se trouve l'utilisateur
        $path = explode('/', $_SERVER['PHP_SELF']);
        $file = array_pop($path);

        //Si l'utilisateur est déja connecté et qu'il est sur la page de connexion, il retourne directement à l'accueil
        if (isset($_SESSION['user'])){

            if ($file == 'connexion.php'){

                header('Location: accueil.html');
                exit();

            }
            return $_SESSION['user'];
        }

        //S'il a rentré les deux champs
        if (!empty($mail) && !empty($password)) {
            try {

                $db = DB::connexion();
                $statement = $db->prepare('SELECT id_user, password_user FROM public.user WHERE mail_user=:mail');

                //on récupère le mot de passe associé au mail
                $statement->bindParam(':mail', $mail);
                $statement->execute();
                $result = $statement->fetch(PDO::FETCH_ASSOC);

            } catch (PDOException $exception) {

                error_log('Connection error: ' . $exception->getMessage());
                return false;

            }

            //On regarde si les 2 mots de passe sont les mêmes :
            if (password_verify($password, $result['password_user']) && !empty($result)){
                $_SESSION['user'] = $result['id_user'];
                header('Location: accueil.html');
                exit();
            } else {    //sinon
                return "E-Mail ou Mot de passe invalide !";
            }
            //on retourne sa session pour les prochains fichiers
            return $_SESSION['user'];
        }
        return false;
    }


}