console.log("prediction.js loaded")

url_string = window.location.href;
let url = new URL(url_string);
let pred = url.searchParams.get("pred");
let id_arbre = url.searchParams.get("id");
console.log(id_arbre);
console.log(pred);

if(id_arbre == 0) {
    console.log("id non renseigné");
    if(pred === "age"){
        console.log("age");
        addSub("age");
    }else if(pred === "taille"){
        console.log("taille");
        addSub("taille");
    }else if(pred === "deraciner") {
        console.log("deraciner");
        addSub("deraciner");
    }
}else {
    console.log("id renseigné");
    if(pred === "age"){
        console.log("age");
        addSub("age");
        addResult();
    }else if(pred === "taille"){
        console.log("taille");
        addSub("taille");
        addResult();
    }else if(pred === "deraciner") {
        console.log("deraciner");
        addSub("deraciner");
        addResult();
    }
}

function cleanPage(){

    let sousTitre = document.getElementsByClassName("sous-titre-page")[0];
    while (sousTitre.nextSibling) {
        sousTitre.nextSibling.remove();
    }

    document.getElementById("sous-titre-page").insertAdjacentHTML(
        "afterend",
        `<div id="predition-page">
<div id="affichage-top" class="affichage-top">
</div>
</div>`
    )
}

function addSub(value){
    console.log("addSub")
    let ba = document.getElementById("btn-age");
    let bt = document.getElementById("btn-taille");
    let bd = document.getElementById("btn-deraciner");
    if(value === "age"){
        console.log("age");
        pred = "age";
        url.searchParams.set('pred', "age");
        ba.style.backgroundColor = "#6F8F72";
        bt.style.backgroundColor = "#504136";
        bd.style.backgroundColor = "#504136";


    }else if(value === "taille"){
        console.log("taille");
        pred = "taille";
        url.searchParams.set('pred', "taille");
        ba.style.backgroundColor = "#504136";
        bt.style.backgroundColor = "#6F8F72";
        bd.style.backgroundColor = "#504136";
        
    }else if(value === "deraciner"){
        console.log("deraciner");
        pred = "deraciner";
        url.searchParams.set('pred', "deraciner");
        ba.style.backgroundColor = "#504136";
        bt.style.backgroundColor = "#504136";
        bd.style.backgroundColor = "#6F8F72";

    }
    cleanPage();
    document.getElementById("affichage-top").insertAdjacentHTML(
        "afterbegin",
        `<div class="form-individual" style="margin-bottom: 20rem">
                <div class="custom-card form-individual-size">
                    <p>ID</p>
                    <div class="d-flex flex-row mb-3">
                        <input class="form-control" id="idArbre" required aria-describedby="id arbre" placeholder="ID de l'arbre">
                        <button class="btn  btn-brown shadow-none" type="submit" id="sub-age" onclick="submit()">Prédire</button>
                    </div>
            </div>`
    );
}

function submit(){
    console.log("Submit");
    id_sub =   document.getElementById("idArbre").value;
    if(id_sub == ""){
        console.log("Erreur : id non renseigné");
        document.getElementById("idArbre").style.backgroundColor = "rgb(255,0,0)";
    }else{
        id = id_sub;
        console.log(id);
        url.searchParams.set('id', id);
        cleanPage();
        addSub();
        addResult();
    }

}

function addResult(){
    console.log("addResult");
    pred = url.searchParams.get("pred");
    document.getElementsByClassName("form-individual")[0].style.marginBottom = "0";
    if(pred == "age"){
        console.log("result : age");
        data_age(id);
        document.getElementById("affichage-top").insertAdjacentHTML(
            "beforeend",
            `            <div class="card-blanche">
                <div class="card-header-blanche">Infos</div>
                <div class="card-content card-blanche-content">
                    <div class="item">
                        <div class="label">Feuillage</div>
                        <div class="value_feuillage">1800</div>
                    </div>
                    <div class="item">
                        <div class="label">Hauteur tronc</div>
                        <div class="value">NON</div>
                    </div>
                    <div class="item">
                        <div class="label">Diamètre tronc</div>
                        <div class="value">EN PLACE</div>
                    </div>
                    <div class="item">
                        <div class="label">Hauteur total</div>
                        <div class="value">adulte</div>
                    </div>
                    <div class="item">
                        <div class="label">Revetement</div>
                        <div class="value">adulte</div>
                    </div>
                </div>
            </div>`
        );
        document.getElementById("predition-page").insertAdjacentHTML(
            "afterend"
            ,`        <div class="card-resulte">
            <div class="card-header-resulte">
                <div>Prédiction : </div>
            </div>
            <div class="card-data-resulte">
                <div>Age</div>
                <div style="color: #6F8F72; font-weight: bold;">1800</div>
            </div>
        </div>`
        );

        ajaxRequest('GET', 'PHP/request.php?action=feuillage&id=' + id_arbre, function (response) {
            console.log("Feuillage de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_feuillage').html(
                '<p> Le feuillage est : ' +
                response +
                '</p>');

        });


    }else if(pred == "taille"){
        console.log("result : taille");
        document.getElementById("affichage-top").insertAdjacentHTML(
            "beforeend",
            `            <div class="card-blanche">
                <div class="card-header-blanche">Infos</div>
                <div class="card-content card-blanche-content">
                    <div class="item">
                        <div class="label">Age</div>
                        <div class="value">1800</div>
                    </div>
                    <div class="item">
                        <div class="label">Diamètre tronc</div>
                        <div class="value">EN PLACE</div>
                    </div>
                    <div class="item">
                        <div class="label">Latitude</div>
                        <div class="value">adulte</div>
                    </div>
                    <div class="item">
                        <div class="label">Longitude</div>
                        <div class="value">adulte</div>
                    </div>
                </div>
            </div>`
        );
        document.getElementById("predition-page").insertAdjacentHTML(
            "afterend"
            ,`        <div class="card-resulte">
            <div class="card-header-resulte">
                <div>Prédiction : </div>
            </div>
            <div class="card-data-resulte">
                <div>Taille</div>
                <div style="color: #6F8F72; font-weight: bold;">1800</div>
            </div>
        </div>`
        );

    }else if(pred == "deraciner"){
        console.log("result : deraciner");
        document.getElementById("affichage-top").insertAdjacentHTML(
            "beforeend",
            `            <div class="card-blanche">
                <div class="card-header-blanche">Infos</div>
                <div class="card-content card-blanche-content">
                    <div class="item">
                        <div class="label">Feuillage</div>
                        <div class="value">1800</div>
                    </div>
                    <div class="item">
                        <div class="label">Hauteur tronc</div>
                        <div class="value">NON</div>
                    </div>
                    <div class="item">
                        <div class="label">Diamètre tronc</div>
                        <div class="value">EN PLACE</div>
                    </div>
                    <div class="item">
                        <div class="label">Hauteur total</div>
                        <div class="value">adulte</div>
                    </div>
                    <div class="item">
                        <div class="label">Revetement</div>
                        <div class="value">adulte</div>
                    </div>
                    <div class="item">
                        <div class="label">Port</div>
                        <div class="value">adulte</div>
                    </div>
                    <div class="item">
                        <div class="label">Latitude</div>
                        <div class="value">adulte</div>
                    </div>
                    <div class="item">
                        <div class="label">Longitude</div>
                        <div class="value">adulte</div>
                    </div>
                </div>
            </div>`
        );
        document.getElementById("predition-page").insertAdjacentHTML(
            "afterend"
            ,`        <div class="card-resulte">
            <div class="card-header-resulte">
                <div>Prédiction : </div>
            </div>
            <div class="card-data-resulte">
                <div>Déraciné</div>
                <div style="color: #6F8F72; font-weight: bold;">1800</div>
            </div>
        </div>`
        );

    }else {
        console.log("Erreur : paramètre de prédiction non reconnu");
    }
}
window.addEventListener("DOMContentLoaded", () => {
    let btnAge = document.getElementById("btn-age");
    let btnTaille = document.getElementById("btn-taille");
    let btnRemarquable = document.getElementById("btn-deraciner");
    btnAge.addEventListener("click", () => {addSub("age")});
    btnTaille.addEventListener("click", () => {addSub("taille")});
    btnRemarquable.addEventListener("click", () => {addSub("deraciner")});

    let btnSubmit = document.getElementById("sub-age");
    btnSubmit.addEventListener("click", submit);
});

/*-------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------------------------------------*/

document.addEventListener('DOMContentLoaded', function() {

    // Sélectionner tous les boutons du groupe
    const buttons = document.querySelectorAll('.btn-tab-map .btn');

    // Ajouter un gestionnaire d'événements à chaque bouton
    buttons.forEach(button => {
        button.addEventListener('click', function () {
            // Réinitialiser toutes les classes pour tous les boutons
            buttons.forEach(btn => {
                btn.classList.remove('btn-selected');
                btn.classList.add('btn-unselected');
            });

            // Ajouter la classe btn-selected au bouton cliqué
            button.classList.add('btn-selected');
            button.classList.remove('btn-unselected');

        });
    });


});
function data_age(id_arbre){

    ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id_arbre, function (response) {
        console.log("Infos de l'arbre : ", response);
        // Afficher le résultat dans votre page HTML
    });
}
$(document).ready(function(){

    $('#arbreForm').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

// ---------------------------------------------------------------------------
// ----------------------- HAUTEUR TRONC ARBRE -------------------------------
// ---------------------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id_arbre, function (response) {
            console.log("Hauteur du tronc : ", response);
            // Afficher le résultat dans votre page HTML
            $('.hauteur_tronc_arbre').html(
                '<p>Hauteur du tronc est : ' +
                response +
                '</p>');

        });

// ----------------------------------------------------------------------------
// ----------------------- DIAMETRE TRONC ARBRE -------------------------------
// ----------------------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=diametre&id=' + id_arbre, function (response) {
            console.log("Diametre de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.diametre_arbre').html(
                '<p>Diametre totale est : ' +
                response +
                '</p>');

        });

// -------------------------------------------------------------------------
// ----------------------- COORDONNEES ARBRE -------------------------------
// -------------------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=coordonnees&id=' + id_arbre, function (response) {
            console.log("Coordonnées de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.coordonnees_arbre').html(
                '<p>Latitude totale est : ' +
                response[0] +
                '</p>' +
                '<p>' +
                'Longitude totale est : ' +
                response[1] +
                '</p>');

        });

// ----------------------------------------------------------------------
// ----------------------- HAUTEUR TOTALE -------------------------------
// ----------------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteurtotale&id=' + id_arbre, function (response) {
            console.log("hauteur totale de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.hauteur_totale_arbre').html(
                '<p> L\'hauteur totale est : ' +
                response +
                '</p>');

        });

// -----------------------------------------------------------------
// ----------------------- AGE ESTIM -------------------------------
// -----------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=age_estim&id=' + id_arbre, function (response) {
            console.log("Age estimé de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.age_estime_arbre').html(
                '<p> L\'age estimé est : ' +
                response +
                '</p>');

        });
// -----------------------------------------------------------------
// ----------------------- TYPE PORT -------------------------------
// -----------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=port&id=' + id_arbre, function (response) {
            console.log("Port de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.port_arbre').html(
                '<p> Le port est : ' +
                response +
                '</p>');

        });

// ------------------------------------------------------------------
// ----------------------- REVETEMENT -------------------------------
// ------------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=revetement&id=' + id_arbre, function (response) {
            console.log("Revetement de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.revetement_arbre').html(
                '<p> Le revetement est : ' +
                response +
                '</p>');

        });

// -----------------------------------------------------------------
// ----------------------- FEUILLAGE -------------------------------
// -----------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=feuillage&id=' + id_arbre, function (response) {
            console.log("Feuillage de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.feuillage_arbre').html(
                '<p> Le feuillage est : ' +
                response +
                '</p>');

        });

// ==============================================================================
// ================================ PREDICTIONS =================================
// ==============================================================================

        ajaxRequest('GET', 'PHP/request.php?action=prediction_taille&id=' + id_arbre, function (response) {
            console.log("Prediction de la taille de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.prediction1').html(
                '<p> La prediction de la taille est : ' +
                response +
                '</p>');
        });

        ajaxRequest('GET', 'PHP/request.php?action=prediction_age&id=' + id_arbre, function (response) {
            console.log("Prediction de l'âge de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.prediction2').html(
                '<p> La prediction de l\'âge est : ' +
                response +
                '</p>');
        });

        ajaxRequest('GET', 'PHP/request.php?action=prediction_deracinement&id=' + id_arbre, function (response) {
            console.log("Prediction du déracinement de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.prediction3').html(
                '<p> La prediction du déracinement est : ' +
                response +
                '</p>');
        });


    });
});