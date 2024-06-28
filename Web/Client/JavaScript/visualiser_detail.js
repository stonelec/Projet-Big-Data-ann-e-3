url_string = window.location.href;
let url = new URL(url_string);
let id = url.searchParams.get("id");
console.log(id);

$(document).ready(function () {

    if (localStorage.getItem('id_user') != null) {

        console.log("ID USER", localStorage.getItem('id_user'));

        let data = []

        data = ['action=recup_user' + '&id=' + localStorage.getItem('id_user')];

        ajaxRequest('GET', 'PHP/request.php', function (response) {

            console.log("LA REPONSE", response);

            let nom_user = response;

            $('#connect').html(nom_user);

        }, data);

    }

    const bouton_connect = document.getElementById("connect");

    bouton_connect.addEventListener("click", () => {

        if (localStorage.getItem('id_user') != null) {

            localStorage.setItem('id_user', null);

            $('#connect').html('Connexion');

        }

    });

});

function afficherInfos(data_infos) {
    const attributsInfos = [
        "espece", "remarquable", "etat_arb", "stade_dev"
    ];

    for (attribute of attributsInfos) {
        document.getElementById(attribute).textContent = data_infos[attribute];
    }
}

function afficherVisuel(data_infos) {
    const attributsInfos = [
        "feuillage", "type_port"
    ];

    for (attribute of attributsInfos) {
        document.getElementById(attribute).textContent = data_infos[attribute];
    }
}

function afficherDimensions(data_infos) {
    const attributsInfos = [
        "hauteur_tronc", "diametre_tronc", "hauteur_tot"
    ];

    for (attribute of attributsInfos) {
        document.getElementById(attribute).textContent = data_infos[attribute];
    }
    afficherTronc(data_infos['hauteur_tot']);
}
function afficherTronc(taille){
    console.log("taille : ", taille);
    taille = taille*6.5;
    const place = document.getElementById('tronc-centre');
    place.style.height = taille + 'rem';
}
function afficherSol(data_infos) {
    const attributsInfos = [
        "type_pied", "longitude", "latitude"
    ];

    for (attribute of attributsInfos) {
        document.getElementById(attribute).textContent = data_infos[attribute];
    }
}

document.addEventListener('DOMContentLoaded', function() {

    //let id_arbre = $('#idArbre').val();
    //console.log("id de l'arbre : ", id_arbre);
// ===============================================================================
//                          A MODIFIER -- id_arbre
// ===============================================================================
    let id_arbre = id;

    ajaxRequest('GET', 'PHP/request.php?action=infos&id='+id_arbre, afficherInfos);
    ajaxRequest('GET', 'PHP/request.php?action=visuel&id='+id_arbre, afficherVisuel);
    ajaxRequest('GET', 'PHP/request.php?action=dimensions&id='+id_arbre, afficherDimensions);
    ajaxRequest('GET', 'PHP/request.php?action=sol&id='+id_arbre, afficherSol);

});

const form = document.getElementById('arbreForm');
// Ajoutez un écouteur d'événement pour l'événement de soumission
form.addEventListener('submit', function(event) {
    // Empêchez le comportement par défaut (rechargement de la page)
    event.preventDefault();
    // Récupérez la valeur du champ d'entrée par son ID
    const id_arbre = document.getElementById('idArbre').value;

    ajaxRequest('GET', 'PHP/request.php?action=infos&id='+id_arbre, afficherInfos);
    ajaxRequest('GET', 'PHP/request.php?action=visuel&id='+id_arbre, afficherVisuel);
    ajaxRequest('GET', 'PHP/request.php?action=dimensions&id='+id_arbre, afficherDimensions);
    ajaxRequest('GET', 'PHP/request.php?action=sol&id='+id_arbre, afficherSol);


});

