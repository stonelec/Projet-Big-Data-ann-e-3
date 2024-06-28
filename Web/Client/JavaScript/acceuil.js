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
