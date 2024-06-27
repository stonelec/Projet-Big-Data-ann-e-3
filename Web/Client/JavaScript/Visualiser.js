/*
window.addEventListener("DOMContentLoaded", () => {
    let btnTable = document.getElementById("btn-table");
    let btnCarte = document.getElementById("btn-carte");
    btnTable.addEventListener("click", () => {addTable()});
    btnCarte.addEventListener("click", () => {addCarte()});
});
addTable();
function addTable() {
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
            </div>
            <table class=" table table-light table-hover table-striped bottom-space" >
                <thead style="position: sticky;top: 0">
                <tr>
                    <th class="header" scope="col">ID</th>
                    <th class="header" scope="col">Espèce</th>
                    <th class="header" scope="col">Etat</th>
                    <th class="header" scope="col">Stade</th>
                    <th class="header" scope="col">Pied</th>
                    <th class="header" scope="col">Port</th>
                    <th class="header" scope="col">Remarquable</th>
                    <th class="header" scope="col">Latitude</th>
                    <th class="header" scope="col">Longitude</th>
                    <th class="header" scope="col" style="width: 5rem">Prédire</th>

                </tr>

                </thead>
                    <tbody class="table-group-divider">
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>
                        <tr><td>1</td><td>Mark</td><td>Otto</td><td>@mdo</td><td>Mark</td><td>@mdo</td><td>Mark</td><td>Otto</td><td>@mdo</td><td><div class="dropdown"><button class="dropbtn"><i class="bi bi-three-dots h6 "></i></button><div class="dropdown-content"><a href="#">Age</a><a href="#">Taille</a><a href="#">Déracinement</a></div></div></td></tr>

                    </tbody>
                </table>
            </div>`
    );

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
    function afficherTableau(data_arbres) {
        const container = document.getElementById('VisualisationTableau');
        container.innerHTML = ''; // On supprime le contenu existant
        // On créé le tableau
        const table = document.createElement('table');
        table.classList.add('table', 'table-bordered', 'table-striped');
        const HeaderElement = [
            "ID", "Espèce", "Etat", "Stade", "Pied", "Port", "Remarquable", "Latitude", "Longitude", "Prédire"
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
            "id_arbre", "espece", "etat_arb", "stade_dev", "type_pied", "type_port", "remarquable", "latitude", "longitude","predire"
        ];

        console.log(data_arbres[0]["id_arbre"])

        // ================= Pour chaque arbre de la database =================
        for (let id_arbre = 0; id_arbre < nb_arb; id_arbre++) {               // 37 --> car 36 arbres
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
                    age.href = "#";                 // A MODIFIER
                    age.textContent = "Age";
                    const taille = document.createElement('a');
                    taille.href = "#";              // A MODIFIER
                    taille.textContent = "Taille";
                    const deracinement = document.createElement('a');
                    deracinement.href = "#";        // A MODIFIER
                    deracinement.textContent = "Déracinement";
                    dropdownContent.appendChild(age);
                    dropdownContent.appendChild(taille);
                    dropdownContent.appendChild(deracinement);
                    dropdown.appendChild(dropdownContent);
                    cell.appendChild(dropdown);

                } else {
                    cell.textContent = `${data_arbres[id_arbre][attribute]}`;
                }
                row.appendChild(cell);
            }
            tbody.appendChild(row);
        }
        table.appendChild(tbody);
        container.appendChild(table);
    }
});