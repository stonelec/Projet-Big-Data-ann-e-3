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

});

$("#bouton_deracinement").click(function (){

    $('.prediction').html(

        '<h2>Page de prédiction : </h2>'+
        '<p>Déracinement</p>'

    )

});

function test_reponse(){

    let id_arbre = $('.data-container').data('id_arbre');
    console.log(id_arbre)
    console.log('CA MARCHE');

}

$(document).ready(function(){

    let id_arbre = $('.data-container').data('id_arbre');

    ajaxRequest('GET', 'PHP/request.php?action=hauteur&id=' + id_arbre, test_reponse());

});
