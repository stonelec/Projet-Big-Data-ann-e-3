// --------------------------------------------------------------------------------
// ------------------------------ PAGE AJOUTER ARBRE ------------------------------
//---------------------------------------------------------------------------------

$(document).ready(function (){

    let options;

    ajaxRequest('GET', 'PHP/request.php?action=etat', function(response) {

        console.log("Feuillage de l'arbre : ", response);
        console.log("Affichage de la 1ère reponse : ", response[0])
        for(let i=0; i<response.length; i++) {

            console.log(response[i])
            options += '<option>' + response[i].etat_arb + '</option>';

        }

        $('#option_etat').html(options);

    });

});