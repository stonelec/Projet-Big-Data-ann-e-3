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

});

const bouton_connect = document.getElementById("connect")

bouton_connect.addEventListener("click", () => {

    if (localStorage.getItem('id_user') != null) {

        localStorage.setItem('id_user', null);

        $('#connect').html('Connexion');

    }

});

console.log("acceuil.js");

window.addEventListener("DOMContentLoaded", () => {
    document.getElementById("racine-ajouter").addEventListener("click", function() {
        window.location.href = "ajouter.html";
    });
    document.getElementById("racine-equipe").addEventListener("click", function() {
        window.location.href = "https://www.isen.fr";
    });
    document.getElementById("racine-visualiser").addEventListener("click", function() {
        window.location.href = "visualiser.html";
    });
    document.getElementById("racine-prédir").addEventListener("click", function() {
        window.location.href = "prediction.html?pred=age&id=0";
    });

});
