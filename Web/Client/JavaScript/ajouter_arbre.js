// --------------------------------------------------------------------------------
// ------------------------------ PAGE AJOUTER ARBRE ------------------------------
//---------------------------------------------------------------------------------

$(document).ready(function (){

    let options;

    // --------------------------
    // ----- Noms des etats -----
    // --------------------------

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

    // ---------------------------
    // ----- Noms des stades -----
    // ---------------------------

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_stade', function(response) {

        console.log("Stades : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            options += '<option>' + response[i].stade_dev + '</option>';

        }

        $('#option_stade').html('<option selected disabled="disabled">Please select</option>' +
            options
        );

    });

    // --------------------------
    // ----- Noms des pieds -----
    // --------------------------


    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_pied', function(response) {

        console.log("Pieds : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            options += '<option>' + response[i].type_pied + '</option>';

        }

        $('#option_pied').html('<option selected disabled="disabled">Please select</option>' +
            options
        );

    });

    // --------------------------
    // ----- Noms des ports -----
    // --------------------------

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_port', function(response) {

        console.log("Ports : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            options += '<option>' + response[i].type_port + '</option>';

        }

        $('#option_port').html('<option selected disabled="disabled">Please select</option>' +
            options
        );

    });

    // -------------------------------
    // ----- Noms des feuillages -----
    // -------------------------------

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_feuillage', function(response) {

        console.log("Feuillages : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            options += '<option>' + response[i].feuillage + '</option>';

        }

        $('#option_feuillage').html('<option selected disabled="disabled">Please select</option>' +
            options
        );

    });

});