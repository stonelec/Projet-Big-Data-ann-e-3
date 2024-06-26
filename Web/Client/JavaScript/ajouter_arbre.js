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

        let val_ajout = []

        let val_espece = $('#espece').val();
        val_ajout.append(val_espece);

        let val_latitude = $('#latitude').val();
        val_ajout.append(val_latitude);

        let val_longitude = $('#longitude').val();
        val_ajout.append(val_longitude);

        let val_hauteur_totale = $('#hauteur_total').val();
        val_ajout.append(val_hauteur_totale);

        let val_hauteur_tronc = $('#hauteur_tronc').val();
        val_ajout.append(val_hauteur_tronc);

        let val_diametre_tronc = $('#diametre_tronc').val();
        val_ajout.append(val_diametre_tronc);

        //console.log("Valeur espece : ", val_espece);
        //console.log("Valeur latitude : ", val_latitude);
        //console.log("Valeur longitude : ", val_longitude);
        //console.log("Valeur hauteur totale : ", val_hauteur_totale);
        //console.log("Valeur hauteur totale : ", val_hauteur_tronc);
        //console.log("Valeur hauteur totale : ", val_diametre_tronc);
        console.log(val_ajout);

    });

});