<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">

    <title>Datarbuste</title>

    <!-- Inclure Bootstrap CSS, ICONS & JS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Inclure le CSS -->
    <link href="CSS/style.css" rel="stylesheet">
    <link href="CSS/connexion.css" rel="stylesheet">

    <!-- Inclure le JS -->
    <script src="JavaScript/connexion.js"></script>
    <script src="JavaScript/ajax.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>

<body>

<?php
    require_once ('Utilisateur.php');
    $result=Utilisateur::connexion_utilisateur();
?>

<!-- =================================== NAVBAR ================================== -->
<nav class="navbar navbar-expand-lg navbar-custom">
    <a class="navbar-brand" href="accueil.html">
        <img src="Images/logo_green_resize.png" alt="Home" class="d-inline-block align-top" style="height: 40px;">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a style="color: white;">Connexion</a>
            </li>


        </ul>
    </div>

    <ul class="navbar-nav">
        <li class="nav-item">
            <a>

            </a>
            <a type="button" class="btn btn-brown shadow-none" href="accueil.html">Retour</a>
        </li>
    </ul>
</nav>
<!-- =================================== PAGE ================================== -->
<div class="conteneur page">
    <div class="box"></div>
    <div class="box centre">
        <div class="connexion">
            <div class="connexion-image">
                <img src="Images/logo_white.png" alt="Home" class="d-inline-block align-top connexion-image">
            </div>
            <p class="connexion-titre">Connectez - vous<br> à votre compte</p>
            <p class="connexion-sous-titre">Bon retour ! <br> Merci de renseigner les informations.</p>
            <div class="connexion-form bottom-space">
                <form class="form_connexion" method="post" id="LoginForm">
                    <div class="mb-3">
                        <label for="inputEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="inputEmail" placeholder="name@example.com" name="mail">
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword5" class="form-label">Mot de passe</label>
                        <input type="password" id="inputPassword5" class="form-control mot_de_passe" aria-describedby="passwordHelpBlock" name="password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-brown">Se connecter</button>
                    <!-- <div class="register">
                        <p>Vous n'avez pas de compte</p>
                        <a href="connexion.css">S'enregistrer</a>
                    </div>-->

                    <?php
                        if ($result == "E-Mail ou Mot de passe invalide !") {
                            echo '<p id="erreur">' . $result . '</p>';
                    }
                    ?>
                </form>
            </div>
        </div>

    </div>
    <div class="box"></div>
</div>
<!-- =================================== FOOTER ================================== -->
<footer class="footer text-center">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <img src="Images/logo_green_resize.png" alt="Logo" class="footer-logo mb-2">
            </div>
            <div class="col-12">
                <p style="font-size: 1.2rem">Ethan LE PAN - Mathias PAITIER - Vincent ROCHER</p>
                <a href="https://isen-nantes.fr" style="font-style: italic; font-size: 1rem; color: white">https://isen-nantes.fr</a>
            </div>
        </div>
    </div>
</footer>
</body>
</html>






