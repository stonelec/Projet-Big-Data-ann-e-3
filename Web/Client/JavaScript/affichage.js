
// ----------------------------------------------------------------------------------
// ------------------------------ Page de prédiction : ------------------------------
// ----------------------------------------------------------------------------------

$("#bouton_taille").click(function (){

    $('.prediction').html(

        '<p>Taille</p>'

    )

});

$("#bouton_age").click(function (){

    $('.prediction').html(

        '<p>Age</p>'

    )

});

$("#bouton_deracinement").click(function (){

    $('.prediction').html(

        '<p>Déracinement</p>'

    )

});

// ----------------------------
// ----- AGE ESTIME ARBRE -----
// ----------------------------

// -------------------------------
// ----- HAUTEUR TRONC ARBRE -----
// -------------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request_e.php?action=hauteur_tronc&id=' + id_arbre, function(response) {

            console.log("Hauteur du tronc : ", response);

            // Afficher le résultat dans votre page HTML
            $('.hauteur_tronc_arbre').html(
                '<p>Hauteur du tronc est : ' +
                response +
                '</p>');

        });
    });
});

// --------------------------
// ----- DIAMETRE ARBRE -----
// --------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request_e.php?action=diametre&id=' + id_arbre, function(response) {

            console.log("Diametre de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.diametre_arbre').html(
                '<p>Diametre totale est : ' +
                response +
                '</p>');

        });
    });
});

// -----------------------------
// ----- COORDONNEES ARBRE -----
// -----------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request_e.php?action=coordonnees&id=' + id_arbre, function(response) {

            console.log("Coordonnées de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.coordonnees_arbre').html(
                '<p>Latitude totale est : ' +
                response[0] +
                '</p>' +
                '<p>' +
                'Longitude totale est : ' +
                response[1] +
                '</p>');

        });
    });
});

// --------------------------------
// ----- HAUTEUR TOTALE ARBRE -----
// --------------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request_e.php?action=hauteurtotale&id=' + id_arbre, function(response) {

            console.log("hauteur totale de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.hauteur_totale_arbre').html(
                '<p> L\'hauteur totale est : ' +
                response+
                '</p>');

        });
    });
});

// ----------------------
// ----- PORT ARBRE -----
// ----------------------

