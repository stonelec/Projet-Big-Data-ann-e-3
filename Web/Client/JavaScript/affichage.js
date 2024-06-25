/* Permet d'afficher les 3 pages différentes avec les boutons prédictions */

$("#bouton_taille").click(function (){

    $('.prediction').html(

        '<h2>Page de prédiction : </h2>'+
        '<p>Taille</p>'

    )

});

$("#bouton_age").click(function (){

    $('.prediction').html(

        '<h2>Page de prédiction : </h2>'+
        '<p>Age</p>'

    )

});$("#bouton_deracinement").click(function (){

    $('.prediction').html(

        '<h2>Page de prédiction : </h2>'+
        '<p>Déracinement</p>'

    )

});

$(document).ready(function(){

    ajaxRequest('GET', 'request.php', function(response) {
        console.log('Réponse du serveur : ', response);
    }, 'action=hauteur');

});
