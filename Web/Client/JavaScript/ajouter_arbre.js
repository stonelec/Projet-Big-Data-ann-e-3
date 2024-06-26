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
        console.log(response)

        for(let i=0; i<response.length; i++) {

            options += '<option>' + response[i].etat_arb + '</option>';

        }

        $('#option_etat').html('<option selected disabled="disabled">Please select</option>' +
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
        console.log(response)

        for(let i=0; i<response.length; i++) {
            
            options += '<option>' + response[i].stade_dev + '</option>';

        }

        $('#option_stade').html('<option>Please select</option>' +
            options
        );

    });

});

// --------------------------
// ----- Noms des pieds -----
// --------------------------

$(document).ready(function (){

    let options;

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_pied', function(response) {

        console.log("Pieds : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            options += '<option>' + response[i].type_pied + '</option>';

        }

        $('#option_pied').html('<option>Please select</option>' +
            options
        );

    });

});