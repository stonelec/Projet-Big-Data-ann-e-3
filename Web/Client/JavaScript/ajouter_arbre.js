// -------------------------------------------------------------------------------------------------------------------------
// -------------------- Récupérer tous les noms de la base de données pour les mettres dans les options --------------------
//--------------------------------------------------------------------------------------------------------------------------

$(document).ready(function (){

    let option_etat;
    let option_stade;
    let option_pied;
    let option_port;
    let option_feuillage;
    let option_remarquable;

    // --------------------------
    // ----- Noms des etats -----
    // --------------------------

    ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_etat', function(response) {

        //console.log("Etats : ")
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

    ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_stade', function(response) {

        //console.log("Stades : ")
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


    ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_pied', function(response) {

        //console.log("Pieds : ")
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

    ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_port', function(response) {

        //console.log("Ports : ")
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

    ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_feuillage', function(response) {

        //console.log("Feuillages : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_feuillage += '<option>' + response[i].feuillage + '</option>';

        }

        $('#option_feuillage').html('<option selected disabled="disabled">Please select</option>' +
            option_feuillage
        );

    });

    // --------------------------------
    // ----- Noms des revetements -----
    // --------------------------------

});

// -------------------------------------------------------------------------------------------------------
// -------------------- Récupérer tous les élements pour les mettres dans les options --------------------
//--------------------------------------------------------------------------------------------------------

$(document).ready(function (){

    $('.form_ajouter_arbre').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        //console.log("ENVOYER")

        let tab_request = [];

        let val_espece = $('#espece').val();
        tab_request.push(val_espece);
        let val_latitude = $('#latitude').val();
        tab_request.push(val_latitude);
        let val_longitude = $('#longitude').val();
        tab_request.push(val_longitude);
        let val_hauteur_totale = $('#hauteur_total').val();
        tab_request.push(val_hauteur_totale);
        let val_hauteur_tronc = $('#hauteur_tronc').val();
        tab_request.push(val_hauteur_tronc);
        let val_diametre_tronc = $('#diametre_tronc').val();
        tab_request.push(val_diametre_tronc);
        let val_age_estime = $('#age_estime').val();
        tab_request.push(val_age_estime);

        let val_etat = $('#option_etat').val();
        tab_request.push(val_etat);
        let val_stade = $('#option_stade').val();
        tab_request.push(val_stade);
        let val_remarquable = $('#option_remarquable').val();
        tab_request.push(val_remarquable);
        let val_pied = $('#option_pied').val();
        tab_request.push(val_pied);
        let val_revetement = $('#option_revetement').val();
        tab_request.push(val_revetement);
        let val_port = $('#option_port').val();
        tab_request.push(val_port);
        let val_feuillage = $('#option_feuillage').val();
        tab_request.push(val_feuillage);

        //Pour afficher les différentes valeurs dans la console
        //console.log("Valeur espece : ", val_espece);
        //console.log("Valeur latitude : ", val_latitude);
        //console.log("Valeur longitude : ", val_longitude);
        //console.log("Valeur hauteur totale : ", val_hauteur_totale);
        //console.log("Valeur hauteur totale : ", val_hauteur_tronc);
        //console.log("Valeur hauteur totale : ", val_diametre_tronc);
        //console.log("Valeur age estimé : ", val_age_estime);

        //console.log("Valeur etat : ", val_etat);
        //console.log("Valeur stade : ", val_stade);
        //console.log("Valeur remarquable : ", val_remarquable);
        //console.log("Valeur pied : ", val_pied);
        //console.log("Valeur revetement : ", val_revetement);
        //console.log("Valeur port : ", val_port);
        //console.log("Valeur feuillage : ", val_feuillage);


        ajaxRequest('POST', 'PHP/request_post.php?action=ajouter_toutes_valeur',function(response)  {

            console.log(response);
            //console.log("Toutes les valeurs ont été ajouté");
            //console.log("Ca doit afficher la hauteur du tronc : ", response)

        }, tab_request);

    });

});

/*
*
* '&val_espece=' + val_espece + '&val_latitude=' + val_latitude +
            '&val_longitude=' + val_longitude + '&val_hauteur_totale=' + val_hauteur_totale +
            '&val_hauteur_tronc=' + val_hauteur_tronc + '&val_diametre_tronc=' + val_diametre_tronc +
            '&val_age_estime=' + val_age_estime + '&val_etat=' + val_etat + '&val_stade=' + val_stade +
            '&val_remarquable=' + val_remarquable + '&val_pied=' + val_pied + '&val_revetement=' + val_revetement +
            '&val_port=' + val_port + '&val_feuillage=' + val_feuillage, */
