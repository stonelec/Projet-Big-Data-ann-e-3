/* Permet d'afficher les 3 pages différentes avec les boutons prédictions */
/*
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

*/

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire
        //document.getElementsByClassName("modif").innerHTML = id_arbre;

        let id_arbre = $('#idArbre').val();

        ajaxRequest('GET', 'PHP/request.php?action=hauteur&id=' + id_arbre, function(response) {

            console.log("id de l'arbre : ", id_arbre);
            console.log("Hauteur de l'arbre : ", response);

            // Afficher le résultat dans votre page HTML
            $('.resultats').html(
                '<p>Hauteur totale de l\'arbre est : ' +
                response +
                '</p>');

        });
    });
});
