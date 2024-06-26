// -------------------------------------------------------------------------------------------------------------------------
// -------------------- Récupérer tous les noms de la base de données pour les mettres dans les options --------------------
//--------------------------------------------------------------------------------------------------------------------------

$(document).ready(function (){

    let option_etat;
    let option_stade;
    let option_pied;
    let option_port;
    let option_feuillage;

    // --------------------------
    // ----- Noms des etats -----
    // --------------------------

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_etat', function(response) {

        console.log("Etats : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_etat += '<option>' + response[i].etat_arb + '</option>';

        }

        $('#option_etat').html('<option selected disabled="disabled">Please select</option>' +
            option_etat
        );

    });

    // ---------------------------
    // ----- Noms des stades -----
    // ---------------------------

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_stade', function(response) {

        console.log("Stades : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_stade += '<option>' + response[i].stade_dev + '</option>';

        }

        $('#option_stade').html('<option selected disabled="disabled">Please select</option>' +
            option_stade
        );

    });

    // --------------------------
    // ----- Noms des pieds -----
    // --------------------------


    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_pied', function(response) {

        console.log("Pieds : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_pied += '<option>' + response[i].type_pied + '</option>';

        }

        $('#option_pied').html('<option selected disabled="disabled">Please select</option>' +
            option_pied
        );

    });

    // --------------------------
    // ----- Noms des ports -----
    // --------------------------

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_port', function(response) {

        console.log("Ports : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_port += '<option>' + response[i].type_port + '</option>';

        }

        $('#option_port').html('<option selected disabled="disabled">Please select</option>' +
            option_port
        );

    });

    // -------------------------------
    // ----- Noms des feuillages -----
    // -------------------------------

    ajaxRequest('GET', 'PHP/request.php?action=ajouter_arbre_feuillage', function(response) {

        console.log("Feuillages : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_feuillage += '<option>' + response[i].feuillage + '</option>';

        }

        $('#option_feuillage').html('<option selected disabled="disabled">Please select</option>' +
            option_feuillage
        );

    });

});

// -------------------------------------------------------------------------------------------------------
// -------------------- Récupérer tous les élements pour les mettres dans les options --------------------
//--------------------------------------------------------------------------------------------------------

$(document).ready(function (){

    $('.form_ajouter_arbre').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        console.log("ENVOYER")

        let val_espece = $('#espece').val();
        let val_latitude = $('#latitude').val();
        let val_longitude = $('#longitude').val();
        let val_hauteur_totale = $('#hauteur_total').val();
        let val_hauteur_tronc = $('#hauteur_tronc').val();
        let val_diametre_tronc = $('#diametre_tronc').val();

        $('#option_etat').change(function (){

            let val_etat = $(this).val();

        });

        $('#option_stade').change(function (){

            let val_stade = $(this).val();

        });

        $('#option_pied').change(function (){

            let val_pied = $(this).val();

        });

        $('#option_port').change(function (){

            let val_port = $(this).val();

        });

        $('#option_feuillage').change(function (){

            let val_feuillage = $(this).val();

        });


        //Pour afficher les différentes valeurs dans la console
        //console.log("Valeur espece : ", val_espece);
        //console.log("Valeur latitude : ", val_latitude);
        //console.log("Valeur longitude : ", val_longitude);
        //console.log("Valeur hauteur totale : ", val_hauteur_totale);
        //console.log("Valeur hauteur totale : ", val_hauteur_tronc);
        //console.log("Valeur hauteur totale : ", val_diametre_tronc);
        console.log("Valeur etat : ", val_etat);
        console.log("Valeur stade : ", val_stade);
        console.log("Valeur pied : ", val_pied);
        console.log("Valeur port : ", val_port);
        console.log("Valeur feuillage : ", val_feuillage);

        /*
        ajaxRequest('POST', 'PHP/request.php?action=ajouter_toutes_valeur', function(response) {

            console.log("Toutes les valeurs ont été ajouté");

        });*/


    });

});