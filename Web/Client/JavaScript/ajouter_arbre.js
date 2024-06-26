// --------------------------------------------------------------------------------
// ------------------------------ PAGE AJOUTER ARBRE ------------------------------
//---------------------------------------------------------------------------------

// --------------------------
// ----- Noms des etats -----
// --------------------------

$(document).ready(function (){

    let options;

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_etat', function(response) {

        console.log("Etats : ")

        for(let i=0; i<response.length; i++) {

            console.log(response[i])
            options += '<option>' + response[i].etat_arb + '</option>';

        }

        $('#option_etat').html('<option>Please select</option>' +
        options
        );

    });

});

// --------------------------
// ----- Noms des stades -----
// --------------------------

$(document).ready(function (){

    let options;

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_stade', function(response) {

        console.log("Stades : ")

        for(let i=0; i<response.length; i++) {

            console.log(response[i])
            options += '<option>' + response[i].stade_dev + '</option>';

        }

        $('#option_etat').html('<option>Please select</option>' +
            options
        );

    });

});