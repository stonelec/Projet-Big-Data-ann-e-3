/*window.addEventListener("DOMContentLoaded", () => {
    let btnTable = document.getElementById("btn-table");
    let btnCarte = document.getElementById("btn-carte");
    btnTable.addEventListener("click", () => {ajaxRequest('GET', 'PHP/request_m.php/all_data', addTable);});
    btnCarte.addEventListener("click", () => {addCarte()});
});

addTable();
function addTable(data_arbres) {
    console.log("addTable");
    let bt = document.getElementById("btn-table");
    let bc = document.getElementById("btn-carte");
    bt.style.backgroundColor = "#6F8F72";
    bc.style.backgroundColor = "#504136";
    cleanPage();
    document.getElementById("contenu").insertAdjacentHTML(
        "afterbegin",
        `<div class="tri-stock">
                <div class="tri">
                    <div>
                        Trier par :
                    </div>
                    <select class="form-select" aria-label="Default select example">
                        <option selected disabled="disabled">Colonne</option>
                        <option value="ID">ID</option>
                        <option value="Espèce">Espèce</option>
                        <option value="Etat">Etat</option>
                        <option value="Stade">Stade</option>
                        <option value="Pied">Pied</option>
                        <option value="Port">Port</option>
                        <option value="Remarquable">Remarquable</option>
                        <option value="Latitude">Latitude</option>
                        <option value="Longitude">Longitude</option>

                    </select>
                    <select class="form-select" aria-label="Default select example">
                        <option selected disabled="disabled">Ordre</option>
                        <option value="1">Croissant</option>
                        <option value="2">Décroissant</option>
                    </select>
                    <a type="button" class="btn btn-brown shadow-none btn-sm" href="#">Connexion</a>
                </div>
            </div>`
    );

    const container = document.getElementById('VisualisationTableau');
    // On créé le tableau
    const table = document.createElement('table');
    table.classList.add('table', 'table-bordered', 'table-striped');

    const HeaderElement = [
        "ID", "Espèce", "Etat", "Stade de dev.", "Pied", "Port", "Remarquable", "Latitude", "Longitude", "Prédire"
    ];

    // On créé le header du tableau
    const thead = document.createElement('thead');
    const headRow = document.createElement('tr');
    for (let j = 0; j < 10; j++) {
        const th = document.createElement('th');
        th.textContent = HeaderElement[j];
        headRow.appendChild(th);
    }
    thead.appendChild(headRow);
    table.appendChild(thead);

    const tbody = document.createElement('tbody');

    let nb_arb = data_arbres.length;
    const AttributeElement = [
        "id_arbre", "espece", "etat_arb", "stade_dev", "type_pied", "type_port", "remarquable", "latitude", "longitude","id_arbre"
    ];

    // ================= Pour chaque arbre de la database =================
    for (let id_arbre = 0; id_arbre < nb_arb; id_arbre++) {               // 37 --> car 36 arbres
        const row = document.createElement('tr');
        // ================= Pour chaque attribut de l'arbre =================
        for (attribute of AttributeElement) {
            const cell = document.createElement('td');
            cell.textContent = `${data_arbres[id_arbre][attribute]}`;
            row.appendChild(cell);

            // ================= Pour le dernier attribut =================
            // TO DO: Mettre un bouton pour prédire --> aucune idée de comment faire
        }
        tbody.appendChild(row);

    }
    table.appendChild(tbody);

    container.appendChild(table);





}

function addCarte() {
    console.log("addCarte");
    let bt = document.getElementById("btn-table");
    let bc = document.getElementById("btn-carte");
    bt.style.backgroundColor = "#504136";
    bc.style.backgroundColor = "#6F8F72";
    cleanPage();
    document.getElementById("contenu").insertAdjacentHTML(
        "afterbegin",
        `     
        <div class="map-container bottom-space">
            <div id='myDiv' class="myDiv"><!-- Plotly chart will be drawn inside this DIV --></div>
        </div>`
    );
    showMap();


}
function cleanPage(){
    console.log("cleanPage");
    let sousTitre = document.getElementsByClassName("btn-group")[0];
    while (sousTitre.nextSibling) {
        sousTitre.nextSibling.remove();
    }

    document.getElementById("menu").insertAdjacentHTML(
        "afterend",
        `<div id="contenu" style="width: 100%; display: flex; flex-direction: column; align-items: center"></div>`
    )
}








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

                //afficherTableau();

                document.getElementById('VisualisationTableau').style.display = 'block';
                // Si vous avez un autre contenu pour la carte, vous pouvez le masquer ici
                // document.getElementById('VisualisationCarte').style.display = 'none';
            } else if (button.querySelector('input').id === 'VisualiserCarte') {
                document.getElementById('VisualisationTableau').style.display = 'none';
                // document.getElementById('VisualisationCarte').style.display = 'block';
            }
        });
    });

    // On initialise les styles des boutons
    buttons.forEach(button => {
        button.classList.add('btn-unselected');
    });

    // Fonction pour afficher le tableau avec Bootstrap
    function afficherTableau(data_arbres) {
        const container = document.getElementById('VisualisationTableau');
        container.innerHTML = ''; // On supprime le contenu existant

        // On créé le tableau
        const table = document.createElement('table');
        table.classList.add('table', 'table-bordered', 'table-striped');

        const HeaderElement = [
            "ID", "Espèce", "Etat", "Stade de dev.", "Pied", "Port", "Remarquable", "Latitude", "Longitude", "Prédire"
        ];

        // On créé le header du tableau
        const thead = document.createElement('thead');
        const headRow = document.createElement('tr');
        for (let j = 0; j < 10; j++) {
            const th = document.createElement('th');
            th.textContent = HeaderElement[j];
            headRow.appendChild(th);
        }
        thead.appendChild(headRow);
        table.appendChild(thead);


        const tbody = document.createElement('tbody');

        let nb_arb = data_arbres.length;
        const AttributeElement = [
            "id_arbre", "espece", "etat_arb", "stade_dev", "type_pied", "type_port", "remarquable", "latitude", "longitude","id_arbre"
        ];

        // ================= Pour chaque arbre de la database =================
        for (let id_arbre = 0; id_arbre < nb_arb; id_arbre++) {               // 37 --> car 36 arbres
            const row = document.createElement('tr');
            // ================= Pour chaque attribut de l'arbre =================
            for (attribute of AttributeElement) {
                const cell = document.createElement('td');
                cell.textContent = `${data_arbres[id_arbre][attribute]}`;
                row.appendChild(cell);

                // ================= Pour le dernier attribut =================
                // TO DO: Mettre un bouton pour prédire --> aucune idée de comment faire
            }
            tbody.appendChild(row);

        }
        table.appendChild(tbody);

        container.appendChild(table);
    }
});

*/
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
                //afficherTableau();
                document.getElementById('VisualisationTableau').style.display = 'block';
                // Si vous avez un autre contenu pour la carte, vous pouvez le masquer ici
                // document.getElementById('VisualisationCarte').style.display = 'none';
            } else if (button.querySelector('input').id === 'VisualiserCarte') {
                document.getElementById('VisualisationTableau').style.display = 'none';
                // document.getElementById('VisualisationCarte').style.display = 'block';
            }
        });
    });
    // On initialise les styles des boutons
    buttons.forEach(button => {
        button.classList.add('btn-unselected');
    });
    // Fonction pour afficher le tableau avec Bootstrap
    function afficherTableau(data_arbres) {
        const container = document.getElementById('VisualisationTableau');
        container.innerHTML = ''; // On supprime le contenu existant
        // On créé le tableau
        const table = document.createElement('table');
        table.classList.add('table', 'table-bordered', 'table-striped');
        const HeaderElement = [
            "ID", "Espèce", "Etat", "Stade de dev.", "Pied", "Port", "Remarquable", "Latitude", "Longitude", "Prédire"
        ];
        // On créé le header du tableau
        const thead = document.createElement('thead');
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
            "id_arbre", "espece", "etat_arb", "stade_dev", "type_pied", "type_port", "remarquable", "latitude", "longitude","id_arbre"
        ];

        console.log(data_arbres[0]["id_arbre"])

        // ================= Pour chaque arbre de la database =================
        for (let id_arbre = 0; id_arbre < nb_arb; id_arbre++) {               // 37 --> car 36 arbres
            const row = document.createElement('tr');
            // ================= Pour chaque attribut de l'arbre =================
            for (attribute of AttributeElement) {
                const cell = document.createElement('td');
                cell.textContent = `${data_arbres[id_arbre][attribute]}`;
                row.appendChild(cell);
                // ================= Pour le dernier attribut =================
                // TO DO: Mettre un bouton pour prédire --> aucune idée de comment faire
            }
            tbody.appendChild(row);
        }
        table.appendChild(tbody);
        container.appendChild(table);
    }
});