// -----------------------------------------------------------------------------
// ------------------------------ PAGE PREDICTION ------------------------------
//------------------------------------------------------------------------------

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


// -------------------------------
// ----- HAUTEUR TRONC ARBRE -----
// -------------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id_arbre, function(response) {

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

        ajaxRequest('GET', 'PHP/request.php?action=diametre&id=' + id_arbre, function(response) {

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

        ajaxRequest('GET', 'PHP/request.php?action=coordonnees&id=' + id_arbre, function(response) {

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

        ajaxRequest('GET', 'PHP/request.php?action=hauteurtotale&id=' + id_arbre, function(response) {

            console.log("hauteur totale de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.hauteur_totale_arbre').html(
                '<p> L\'hauteur totale est : ' +
                response+
                '</p>');

        });
    });
});

// ----------------------------
// ----- AGE ESTIME ARBRE -----
// ----------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request.php?action=age_estim&id=' + id_arbre, function(response) {

            console.log("Age estimé de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.age_estime_arbre').html(
                '<p> L\'age estimé est : ' +
                response +
                '</p>');

        });
    });
});

// ----------------------
// ----- PORT ARBRE -----
// ----------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request.php?action=port&id=' + id_arbre, function(response) {

            console.log("Port de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.port_arbre').html(
                '<p> Le port est : ' +
                response +
                '</p>');

        });
    });
});

// ----------------------------
// ----- REVETEMENT ARBRE -----
// ----------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request.php?action=revetement&id=' + id_arbre, function(response) {

            console.log("Revetement de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.revetement_arbre').html(
                '<p> Le revetement est : ' +
                response +
                '</p>');

        });
    });
});

// ---------------------------
// ----- FEUILLAGE ARBRE -----
// ---------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request.php?action=feuillage&id=' + id_arbre, function(response) {

            console.log("Feuillage de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.feuillage_arbre').html(
                '<p> Le feuillage est : ' +
                response +
                '</p>');

        });
    });
});

// --------------------------------------------------------------------------------
// ------------------------------ PAGE AJOUTER ARBRE ------------------------------
//---------------------------------------------------------------------------------

$(document).ready(function (){

    ajaxRequest('GET', 'PHP/request.php?action=etat', function(response) {

        console.log("Feuillage de l'arbre : ", response);
        for(let i=0; i<response.length; i++) {

            console.log(response[i])
            options += '<option>' + response[i].name + '</option>';

        }

        $('#option_etat').html(options);

    });

});
