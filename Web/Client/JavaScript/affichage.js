/* Permet d'afficher les 3 pages différentes avec les boutons prédictions */

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

// ----------------------------------------------------------------------------------
// ------------------------------ HAUTEUR TOTALE ARBRE ------------------------------
// ----------------------------------------------------------------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request.php?action=hauteur&id=' + id_arbre, function(response) {

            console.log("Hauteur de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.hauteur_arbre').html(
                '<p>Hauteur totale est : ' +
                response +
                '</p>');

        });
    });
});

// ----------------------------------------------------------------------------
// ------------------------------ DIAMETRE ARBRE ------------------------------
// ----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------
// ------------------------------ LONGITUDE ARBRE ------------------------------
// -----------------------------------------------------------------------------

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

        ajaxRequest('GET', 'PHP/request.php?action=coordonnees&id=' + id_arbre, function(response) {

            console.log("Longitude de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.coordonnees_arbre').html(
                '<p>Latitude totale est : ' +
                response[0] +
                '</p>' +
                '<p>' +
                'Longitude totale est :' +
                response[1] +
                '</p>');

        });
    });
});