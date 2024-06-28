// -------------------------------------------------------------------------------------------------------------------------
// -------------------- Récupérer tous les noms de la base de données pour les mettres dans les options --------------------
//--------------------------------------------------------------------------------------------------------------------------

$(document).ready(function (){

    if(localStorage.getItem('id_user') != null){

        console.log("ID USER", localStorage.getItem('id_user'));

        let data = []

        data = ['action=recup_user' + '&id=' + localStorage.getItem('id_user')];

        ajaxRequest('GET', 'PHP/request.php', function(response){

            console.log("LA REPONSE", response);

            let nom_user = response;

            $('#connect').html(nom_user);

        },data);

    }


    let option_etat;
    let option_stade;
    let option_pied;
    let option_port;
    let option_feuillage;
    let option_especes;

    // --------------------------
    // ----- Noms des etats -----
    // --------------------------

    ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_etat', function(response) {

        //console.log("Etats : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_etat += '<option>' + response[i].etat_arb + '</option>';

        }

        $('#option_etat').html('<option selected disabled="disabled">Sélectionner</option>' +
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

        $('#option_stade').html('<option selected disabled="disabled">Sélectionner</option>' +
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

        $('#option_pied').html('<option selected disabled="disabled">Sélectionner</option>' +
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

        $('#option_port').html('<option selected disabled="disabled">Sélectionner</option>' +
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

        $('#option_feuillage').html('<option selected disabled="disabled">Sélectionner</option>' +
            option_feuillage
        );

    });

    // -------------------------------
    // ----- Noms des especes -----
    // -------------------------------

    //C'est ici qu'on va stocker les options :
    let options = []

    ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_espece', function(response) {

        console.log("Especes : ")
        console.log(response)

        for(let i=0; i<response.length; i++) {

            option_especes += '<option value="'+ response[i].espece +'"></option>';
            options[i] = response[i].espece;

        }

        tableau_list_options(options);

    });

    // Fonction pour mettre à jour le datalist
    function tableau_list_options(option_selctionne) {

        const datalist = document.getElementById('espece_list');
        datalist.innerHTML = '<option selected disabled="disabled">Sélectionner</option>';

        option_selctionne.forEach(option => {
            const element_option = document.createElement('option');
            element_option.value = option;
            datalist.appendChild(element_option);
        });

    }

    document.getElementById('espece').addEventListener('input', function() {
        const value = this.value;

        const new_option = options.filter(option => option.startsWith(value));
        tableau_list_options(new_option);

    });

});

// -------------------------------------------------------------------------------------------------------
// -------------------- Récupérer tous les élements pour les mettres dans les options --------------------
//--------------------------------------------------------------------------------------------------------

$(document).ready(function (){

    $('.form_ajouter_arbre').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        console.log("ENVOYER")

        if(localStorage.getItem('id_user') != null){


            let val_espece = $('#espece').val();
            let val_latitude = $('#latitude').val();
            let val_longitude = $('#longitude').val();
            let val_hauteur_totale = $('#hauteur_total').val();
            let val_hauteur_tronc = $('#hauteur_tronc').val();
            let val_diametre_tronc = $('#diametre_tronc').val();
            let val_age_estime = $('#age_estime').val();

            let val_etat = $('#option_etat').val();
            let val_stade = $('#option_stade').val();
            let val_remarquable = $('#option_remarquable').val();
            let val_pied = $('#option_pied').val();
            let val_revetement = $('#option_revetement').val();
            let val_port = $('#option_port').val();
            let val_feuillage = $('#option_feuillage').val();

            let data = {
                val_espece: val_espece,
                val_latitude: val_latitude,
                val_longitude: val_longitude,
                val_hauteur_totale: val_hauteur_totale,
                val_hauteur_tronc: val_hauteur_tronc,
                val_diametre_tronc: val_diametre_tronc,
                val_age_estime: val_age_estime,
                val_etat: val_etat,
                val_stade: val_stade,
                val_remarquable: val_remarquable,
                val_pied: val_pied,
                val_revetement: val_revetement,
                val_port: val_port,
                val_feuillage: val_feuillage
            };

            data = 'action=ajouter_toutes_valeur' + '&val_espece=' + val_espece + '&val_latitude=' + val_latitude +
                '&val_longitude=' + val_longitude + '&val_hauteur_totale=' + val_hauteur_totale +
                '&val_hauteur_tronc=' + val_hauteur_tronc + '&val_diametre_tronc=' + val_diametre_tronc +
                '&val_age_estime=' + val_age_estime + '&val_etat=' + val_etat + '&val_stade=' + val_stade +
                '&val_remarquable=' + val_remarquable + '&val_pied=' + val_pied + '&val_revetement=' + val_revetement +
                '&val_port=' + val_port + '&val_feuillage=' + val_feuillage + '&id_user =' + localStorage.getItem('id_user');

            ajaxRequest('POST', 'PHP/request_post.php',function(response)  {

                console.log(response);
                if (response === "error") {
                    alert("Veuillez remplir tous les champs");
                }else {
                    alert("Arbre ajouté avec succès");
                }

            }, data);

        }


    });

});