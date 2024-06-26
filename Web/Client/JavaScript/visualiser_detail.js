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
    let id_arbre = 5;

    ajaxRequest('GET', 'PHP/request.php?action=infos&id='+id_arbre, afficherInfos);
    ajaxRequest('GET', 'PHP/request.php?action=visuel&id='+id_arbre, afficherVisuel);
    ajaxRequest('GET', 'PHP/request.php?action=dimensions&id='+id_arbre, afficherDimensions);
    ajaxRequest('GET', 'PHP/request.php?action=sol&id='+id_arbre, afficherSol);






});

