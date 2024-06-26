function afficherInfos(data_infos) {
    const attributsInfos = [
        "espece", "remarquable", "etat_arb", "stade_dev"
    ];

    for (attribute of attributsInfos) {
        document.getElementById(attribute).textContent = data_infos[attribute];
    }


}

document.addEventListener('DOMContentLoaded', function() {

    //let id_arbre = $('#idArbre').val();
    //console.log("id de l'arbre : ", id_arbre);

    ajaxRequest('GET', 'PHP/request.php?action=infos&id='+id_arbre, afficherTableau);






});

