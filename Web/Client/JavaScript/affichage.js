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

    let id_arbre = $('#data-container').data('id-arbre');

    ajaxRequest('GET', 'PHP/request.php?id=' + id_arbre, function(response) {
        console.log('Réponse du serveur : ', response);
    }, 'action=hauteur');

});
