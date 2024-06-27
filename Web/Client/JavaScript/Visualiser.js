
window.addEventListener("DOMContentLoaded", () => {
    let btnTable = document.getElementById("btn-table");
    let btnCarte = document.getElementById("btn-carte");
    btnTable.addEventListener("click", () => {addTable()});
    btnCarte.addEventListener("click", () => {addCarte("general")});
});
addTable();
function addTable() {
    //console.log("addTable");
    let bt = document.getElementById("btn-table");
    let bc = document.getElementById("btn-carte");
    bt.style.backgroundColor = "#6F8F72";
    bc.style.backgroundColor = "#504136";
    cleanPage();

    document.getElementById("contenu").insertAdjacentHTML(
        "beforebegin",
        `<div class="tri-stock">
                <div class="tri">
                    <div>
                        Sélectionner le tri :
                    </div>
                    <div id="choix-colonne-div"> <!--dibv set juste pour l'espacement-->
                        <select class="form-select" aria-label="Default select example" id="choix-colonne">
                            <option selected disabled="disabled">Colonne</option>
                            <option value="Etat">Etat</option>
                            <option value="Stade">Stade</option>
                            <option value="Pied">Pied</option>
                            <option value="Port">Port</option>
                            <option value="Remarquable">Remarquable</option>
                        </select>
                    </div>
                    <div id="choix-option">

                    </div>
                     <button type="button" class="btn btn-brown shadow-none btn-sm supr" hidden></button>
                </div>
            </div>`
    );
    ajaxRequest('GET', 'PHP/request_m.php/all_data', afficherTableau);
    let colonnne = document.getElementById("choix-colonne");
    colonnne.addEventListener("click", () => {printOption()});



}
function printOption() {
    //console.log("printOption");
    let colonne = document.getElementById("choix-colonne").value;
    //console.log(colonne);
    //console.log("Remarquable");
    document.getElementById("choix-option").remove();
    document.getElementById("choix-colonne-div").insertAdjacentHTML(
        "afterend",
        `<div id="choix-option">

                    </div>`
    );
    let option = document.getElementById("choix-option");
    option.addEventListener("click", () => {printTrier()});

    if (colonne === "Remarquable") {
        document.getElementById("choix-option").insertAdjacentHTML(
            "afterbegin",
            `<select class="form-select" aria-label="Default select example">
                     <option selected disabled="disabled">Sélection du caractère remarquable</option>
                     <option value="1">oui</option>
                     <option value="0">non</option>
                  </select>`
        );
    }
    if (colonne === "Port") {
        ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_port', function(response) {
            const choix_option = document.getElementById('choix-option');
            const form_select = document.createElement('select');
            form_select.classList.add('form-select');
            form_select.setAttribute('aria-label', 'Default select example');

            const option_title = document.createElement('option');
            option_title.selected = true;
            option_title.disabled = true;
            option_title.textContent = "Sélection du type de port";
            form_select.appendChild(option_title);

            for (let i = 0; i < response.length; i++) {
                const option_port = document.createElement('option');
                option_port.value = i;
                option_port.textContent = response[i].type_port;
                form_select.appendChild(option_port);
            }
            choix_option.appendChild(form_select);
        });
    }
    if (colonne === "Pied") {
        ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_pied', function(response) {
            const choix_option = document.getElementById('choix-option');
            const form_select = document.createElement('select');
            form_select.classList.add('form-select');
            form_select.setAttribute('aria-label', 'Default select example');

            const option_title = document.createElement('option');
            option_title.selected = true;
            option_title.disabled = true;
            option_title.textContent = "Sélection du type de pied";
            form_select.appendChild(option_title);

            for (let i = 0; i < response.length; i++) {
                const option_pied = document.createElement('option');
                option_pied.value = i;
                option_pied.textContent = response[i].type_pied;
                form_select.appendChild(option_pied);
            }
            choix_option.appendChild(form_select);
        });
    }
    if (colonne === "Stade") {
        ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_stade', function(response) {
            const choix_option = document.getElementById('choix-option');
            const form_select = document.createElement('select');
            form_select.classList.add('form-select');
            form_select.setAttribute('aria-label', 'Default select example');

            const option_title = document.createElement('option');
            option_title.selected = true;
            option_title.disabled = true;
            option_title.textContent = "Sélection du stade";
            form_select.appendChild(option_title);

            for (let i = 0; i < response.length; i++) {
                const option_stade = document.createElement('option');
                option_stade.value = i;
                option_stade.textContent = response[i].stade_dev;
                form_select.appendChild(option_stade);
            }
            choix_option.appendChild(form_select);
        });
    }
    if (colonne === "Etat") {
        ajaxRequest('GET', 'PHP/request_post.php?action=ajouter_arbre_etat', function(response) {
            const choix_option = document.getElementById('choix-option');
            const form_select = document.createElement('select');
            form_select.classList.add('form-select');
            form_select.setAttribute('aria-label', 'Default select example');

            const option_title = document.createElement('option');
            option_title.selected = true;
            option_title.disabled = true;
            option_title.textContent = "Sélection de l'état";
            form_select.appendChild(option_title);

            for (let i = 0; i < response.length; i++) {
                const option_etat = document.createElement('option');
                option_etat.value = i;
                option_etat.textContent = response[i].etat_arb;
                form_select.appendChild(option_etat);
            }
            choix_option.appendChild(form_select);
        });
    }
}

function printTrier() {
    //console.log("printTrier");
    document.getElementsByClassName("supr")[0].remove();
    document.getElementById("choix-option").insertAdjacentHTML(
        "afterend",
        `<button type="button" class="btn btn-brown shadow-none btn-sm supr">Trier</button>`
    );
}

document.addEventListener('click', function(event) {
    if (event.target.matches('.supr')) {

        let colonne = document.getElementById("choix-colonne").value;
        let option = document.getElementsByClassName("form-select")[1].value;
        option = parseInt(option);
        option = option + 1;

        console.log(colonne);
        console.log(option);

        cleanPage();

        document.getElementById("contenu").insertAdjacentHTML(
            "beforebegin",
            `<div class="tri-stock">
                <div class="tri">
                    <div>
                        Sélectionner le tri :
                    </div>
                    <div id="choix-colonne-div"> <!--dibv set juste pour l'espacement-->
                        <select class="form-select" aria-label="Default select example" id="choix-colonne">
                            <option selected disabled="disabled">Colonne</option>
                            <option value="Etat">Etat</option>
                            <option value="Stade">Stade</option>
                            <option value="Pied">Pied</option>
                            <option value="Port">Port</option>
                            <option value="Remarquable">Remarquable</option>
                        </select>
                    </div>
                    <div id="choix-option">

                    </div>
                     <button type="button" class="btn btn-brown shadow-none btn-sm supr" hidden></button>
                </div>
            </div>`
        );


        let url = "";
        if (colonne === "Remarquable") {
            url = "PHP/request.php/all_data_remarquable?id=" + option;
        }
        if (colonne === "Port") {
            url = "PHP/request.php/all_data_port?id=" + option;
        }
        if (colonne === "Pied") {
            url = "PHP/request.php/all_data_pied?id=" + option;
        }
        if (colonne === "Stade") {
            url = "PHP/request.php/all_data_stade?id=" + option;
        }
        if (colonne === "Etat") {
            url = "PHP/request.php/all_data_etat?id=" + option;
        }
        ajaxRequest('GET', url, afficherTableau);

        let colonnne = document.getElementById("choix-colonne");
        colonnne.addEventListener("click", () => {printOption()});
    }
});

function afficherTableau(data_arbres) {
    const container = document.getElementById('contenu');
    container.innerHTML = ''; // On supprime le contenu existant
    // On créé le tableau
    const table = document.createElement('table');
    table.classList.add('table', 'table-bordered', 'table-striped', 'table-hover', 'table-light', 'bottom-space');
    const HeaderElement = [
        "ID", "Espèce", "Etat", "Stade", "Pied", "Port", "Remarquable", "Latitude", "Longitude", "Prédire"
    ];
    // On créé le header du tableau
    const thead = document.createElement('thead');
    thead.style.position = 'sticky';
    thead.style.top = '0';
    const headRow = document.createElement('tr');
    for (let j = 0; j < 10; j++) {
        const th = document.createElement('th');
        th.textContent = HeaderElement[j];
        headRow.appendChild(th);
    }
    thead.appendChild(headRow);
    table.appendChild(thead);
    // Create 5 rows
    const tbody = document.createElement('tbody');
    let nb_arb = data_arbres.length;
    const AttributeElement = [
        "id_arbre", "espece", "etat_arb", "stade_dev", "type_pied", "type_port", "remarquable", "latitude", "longitude","predire"
    ];
    console.log("nb_arb :")
    console.log(nb_arb)
    // ================= Pour chaque arbre de la database =================
    for (let id_arbre = 0; id_arbre < nb_arb; id_arbre++) {

        let identifiant = data_arbres[id_arbre]["id_arbre"];
        const row = document.createElement('tr');
        // ================= Pour chaque attribut de l'arbre =================
        for (attribute of AttributeElement) {
            const cell = document.createElement('td');
            if(attribute === "predire") {
                // ajouter le bouton <div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div>
                const dropdown = document.createElement('div');
                dropdown.classList.add('dropdown');
                const button = document.createElement('button');
                button.classList.add('dropbtn');
                const icon = document.createElement('i');
                icon.classList.add('bi', 'bi-three-dots', 'h6');
                button.appendChild(icon);
                dropdown.appendChild(button);
                const dropdownContent = document.createElement('div');
                dropdownContent.classList.add('dropdown-content');
                const age = document.createElement('a');
                age.href = "prediction.html?pred=age&id="+identifiant;                 // A MODIFIER
                age.textContent = "Age";
                const taille = document.createElement('a');
                taille.href = "prediction.html?pred=taille&id="+identifiant;              // A MODIFIER
                taille.textContent = "Taille";
                const deracinement = document.createElement('a');
                deracinement.href = "prediction.html?pred=deraciner&id="+identifiant;        // A MODIFIER
                deracinement.textContent = "Déracinement";
                dropdownContent.appendChild(age);
                dropdownContent.appendChild(taille);
                dropdownContent.appendChild(deracinement);
                dropdown.appendChild(dropdownContent);
                cell.appendChild(dropdown);

            }
            else if (attribute === "remarquable") {
                if (data_arbres[id_arbre][attribute] === "1") {
                    cell.textContent = "Oui";
                } else {
                    cell.textContent = "Non";
                }
            }
            else if (attribute === "id_arbre") {
                cell.textContent = `${data_arbres[id_arbre][attribute]}`;
                cell.href = "visualiser_detail.html";
            }
            else {
                cell.textContent = `${data_arbres[id_arbre][attribute]}`;
            }
            row.appendChild(cell);
        }
        tbody.appendChild(row);
    }
    table.appendChild(tbody);
    container.appendChild(table);
}
function addCarte(mode) {
    //console.log("addCarte");
    //console.log(mode)
    let bt = document.getElementById("btn-table");
    let bc = document.getElementById("btn-carte");
    bt.style.backgroundColor = "#504136";
    bc.style.backgroundColor = "#6F8F72";
    cleanPage();
    document.getElementById("contenu").insertAdjacentHTML(
        "afterbegin",
        `<div id="mode-div">
            <div class="title">
                <p >Mode : </p>
            </div>
            <div class="btn-group" role="group" aria-label="Basic example" id="mode">
                <button type="button" class="btn btn-green shadow-none btn-sm" id="btn-generale">Générale</button>
                <button type="button" class="btn btn-brown shadow-none btn-sm" id="btn-cluster">Cluster</button>
            </div>
        </div>   
        <div class="map-container bottom-space">
            <div id='myDiv' class="myDiv"><!-- Plotly chart will be drawn inside this DIV --></div>
        </div>`
    );
    let btnGenerale = document.getElementById("btn-generale");
    let btnCluster = document.getElementById("btn-cluster");
    btnGenerale.addEventListener("click", () => {addCarte("general")});
    btnCluster.addEventListener("click", () => {addCarte("cluster")});
    if (mode == "general"){
        btnGenerale.style.backgroundColor = "#BFD3C1FF";
        btnCluster.style.backgroundColor = "#6F8F72";
    }else{
        btnGenerale.style.backgroundColor = "#6F8F72";
        btnCluster.style.backgroundColor = "#BFD3C1FF";
    }
    showMap(mode);


}
function cleanPage(){
    //console.log("cleanPage");
    let sousTitre = document.getElementsByClassName("btn-group")[0];
    while (sousTitre.nextSibling) {
        sousTitre.nextSibling.remove();
    }
    document.getElementById("menu").insertAdjacentHTML(
        "afterend",
        `<div id="contenu" style="width: 100%; display: flex; flex-direction: column; align-items: center"></div>`
    )
}


window.addEventListener("DOMContentLoaded", () => {
    let btnTable = document.getElementById("btn-table");
    let btnCarte = document.getElementById("btn-carte");
    btnTable.addEventListener("click", () => {addTable()});
    btnCarte.addEventListener("click", () => {addCarte("general")});
});
/*
document.addEventListener('DOMContentLoaded', function() {
    // Sélectionner tous les boutons du groupe
    const buttons = document.querySelectorAll('.btn-tab-map .btn');
    // Ajouter un gestionnaire d'événements à chaque bouton
    buttons.forEach(button => {
        button.addEventListener('click', function() {
            // Réinitialiser toutes les classes pour tous les boutons
            buttons.forEach(btn => {
                btn.classList.remove('btn-selected');
                btn.classList.add('btn-unselected');
            });
            // Ajouter la classe btn-selected au bouton cliqué
            button.classList.add('btn-selected');
            button.classList.remove('btn-unselected');
            // Afficher ou masquer les contenus en fonction du bouton cliqué
            if (button.querySelector('input').id === 'VisualiserTableau') {
                ajaxRequest('GET', 'PHP/request_m.php/all_data', afficherTableau);
                document.getElementById('VisualisationTableau').style.display = 'block';
                document.getElementById('VisualisationCarte').style.display = 'none';
            } else if (button.querySelector('input').id === 'VisualiserCarte') {
                document.getElementById('VisualisationTableau').style.display = 'none';
                document.getElementById('VisualisationCarte').style.display = 'block';
            }
        });
    });
    // On initialise les styles des boutons
    buttons.forEach(button => {
        button.classList.add('btn-unselected');
    });
    // Fonction pour afficher le tableau avec Bootstrap

});*/