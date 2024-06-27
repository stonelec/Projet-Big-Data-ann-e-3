console.log("prediction.js loaded")

url_string = window.location.href;
let url = new URL(url_string);
let pred = url.searchParams.get("pred");
let id = url.searchParams.get("id");
console.log(id);
console.log(pred);

if(id == 0) {
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
                        <div class="value_feuillage_age"></div>
                    </div>
                    <div class="item">
                        <div class="label">Hauteur tronc</div>
                        <div class="value_hauteur_tronc_age"></div>
                    </div>
                    <div class="item">
                        <div class="label">Diamètre tronc</div>
                        <div class="value_diametre_tronc_age"></div>
                    </div>
                    <div class="item">
                        <div class="label">Hauteur totale</div>
                        <div class="value_hauteur_totale_age"></div>
                    </div>
                    <div class="item">
                        <div class="label">Revêtement</div>
                        <div class="value_revetement_age"></div>
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
                <div class="prediction1" style="color: #6F8F72; font-weight: bold;"></div>
            </div>
        </div>`
        );
// =============================== Modification des infos ======== Requêtes AJAX ===============================
// -------------------------------------------------- Feuillage ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=feuillage&id=' + id, function (response) {
            console.log("Feuillage de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_feuillage_age').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Hauteur tronc ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id, function (response) {
            console.log("Hauteur du tronc : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_hauteur_tronc_age').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Diamètre tronc ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=diametre&id=' + id, function (response) {
            console.log("Diametre de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_diametre_tronc_age').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Hauteur totale ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteurtotale&id=' + id, function (response) {
            console.log("hauteur totale de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_hauteur_totale_age').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Revêtement ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=revetement&id=' + id, function (response) {
            console.log("Revetement de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            if(response == "0"){
                $('.value_revetement_age').html(
                    '<p> Non </p>');
            }
            else if (response == "1"){
                $('.value_revetement_age').html(
                    '<p> Oui </p>');
            }
            else {
                $('.value_revetement_age').html(
                    '<p>' + response + '</p>');
            }
        });
// -------------------------------------------------- Prédiction Age ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=prediction_taille&id=' + id, function (response) {
            console.log("Prediction de la taille de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            if(response == "0"){
                $('.prediction1').html('entre 0 et 10 ans');
            }
            else if (response == "1"){
                $('.prediction1').html('entre 10 et 50 ans');
            }
            else if (response == "2"){
                $('.prediction1').html('entre 50 et 100 ans');
            }
            else if (response == "3"){
                $('.prediction1').html('entre 100 et 200 ans');
            }

        });
    }

    else if(pred == "taille"){
        console.log("result : taille");
        document.getElementById("affichage-top").insertAdjacentHTML(
            "beforeend",
            `            <div class="card-blanche">
                <div class="card-header-blanche">Infos</div>
                <div class="card-content card-blanche-content">
                    <div class="item">
                        <div class="label">Hauteur tronc</div>
                        <div class="value_hauteur_taille"></div>
                    </div>
                    <div class="item">
                        <div class="label">Diamètre tronc</div>
                        <div class="value_diametre_taille"></div>
                    </div>
                    <div class="item">
                        <div class="label">Age</div>
                        <div class="value_age_taille"></div>
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
                <div class="prediction2" style="color: #6F8F72; font-weight: bold;"></div>
            </div>
        </div>`
        );
// =============================== Modification des infos ======== Requêtes AJAX ===============================
// -------------------------------------------------- Hauteur tronc ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id, function (response) {
            console.log("Hauteur du tronc : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_hauteur_taille').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Diamètre tronc ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=diametre&id=' + id, function (response) {
            console.log("Diametre de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_diametre_taille').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Age estimé ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=age_estim&id=' + id, function (response) {
            console.log("Age estimé de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_age_taille').html(
                '<p>' + response + '</p>');
        });

// -------------------------------------------------- Prédiction Age ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=prediction_taille&id=' + id, function (response) {
            console.log("Prediction de la taille de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            if(response == "0"){
                $('.prediction2').html('Moyen');
            }
            else if(response == "1"){
                $('.prediction2').html('Petit');
            }
            else if(response == "2"){
                $('.prediction2').html('Grand');
            }
        });
    }

    else if(pred == "deraciner"){
        console.log("result : deraciner");
        document.getElementById("affichage-top").insertAdjacentHTML(
            "beforeend",
            `            <div class="card-blanche">
                <div class="card-header-blanche">Infos</div>
                <div class="card-content card-blanche-content">
                    <div class="item">
                        <div class="label">Hauteur totale</div>
                        <div class="value_hauteur_totale_deracinement"></div>
                    </div>
                    <div class="item">
                        <div class="label">Hauteur tronc</div>
                        <div class="value_hauteur_tronc_deracinement"></div>
                    </div>
                    <div class="item">
                        <div class="label">Diamètre tronc</div>
                        <div class="value_diametre_deracinement"></div>
                    </div>
                    <div class="item">
                        <div class="label">Type de port</div>
                        <div class="value_port_deracinement"></div>
                    </div>
                    <div class="item">
                        <div class="label">Feuillage</div>
                        <div class="value_feuillage_deracinement"></div>
                    </div>
                    <div class="item">
                        <div class="label">Type de pied</div>
                        <div class="value_pied_deracinement"></div>
                    </div>
                    <div class="item">
                        <div class="label">Revêtement</div>
                        <div class="value_revet_deracinement"></div>
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
                <div>Déracinement ?</div>
                <div class="prediction3" style="color: #6F8F72; font-weight: bold;">1800</div>
            </div>
        </div>`
        );
// =============================== Modification des infos ======== Requêtes AJAX ===============================
// -------------------------------------------------- Hauteur totale ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteurtotale&id=' + id, function (response) {
            console.log("hauteur totale de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_hauteur_totale_deracinement').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Hauteur tronc ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id, function (response) {
            console.log("Hauteur du tronc : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_hauteur_tronc_deracinement').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Diamètre tronc ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=diametre&id=' + id, function (response) {
            console.log("Diametre de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_diametre_deracinement').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Port ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=port&id=' + id, function (response) {
            console.log("Port de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_port_deracinement').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Feuillage ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=feuillage&id=' + id, function (response) {
            console.log("Feuillage de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_feuillage_deracinement').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Pied ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=pied&id=' + id, function (response) {
            console.log("Port de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.value_pied_deracinement').html(
                '<p>' + response + '</p>');
        });
// -------------------------------------------------- Revêtement ------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=revetement&id=' + id, function (response) {
            console.log("Revetement de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            if(response == "0"){
                $('.value_revetement_deracinement').html(
                    '<p> Non </p>');
            }
            else if (response == "1"){
                $('.value_revetement_deracinement').html(
                    '<p> Oui </p>');
            }
            else {
                $('.value_revetement_deracinement').html(
                    '<p>' + response + '</p>');
            }
        });
// --------------------------------------------- Prédiction Deracinement -------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=prediction_deracinement&id=' + id, function (response) {
            console.log("Prediction du déracinement de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            if(response == "0"){
                $('.prediction3').html('Non déraciné');
            }
            else if (response == "1"){
                $('.prediction3').html('Déraciné');
            }
            else {
                $('.prediction3').html(response);
            }
        });
    }

    else {
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

function data_age(id_arbre){

    ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id_arbre, function (response) {
        console.log("Infos de l'arbre : ", response);
        // Afficher le résultat dans votre page HTML
    });
}
