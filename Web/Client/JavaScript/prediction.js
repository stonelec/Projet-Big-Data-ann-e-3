let prediction = ""

const updatePrediction = (newPred) => {
    prediction = newPred;
    console.log('Prédiction actuelle :', prediction);
};

const radioButtons = document.querySelectorAll('.btn-group-toggle input[type="radio"]');
console.log(radioButtons);
radioButtons.forEach(button => {
    button.addEventListener('click', () => {
        // Définir l'état en fonction de l'ID du bouton cliqué
        switch (button.id) {
            case 'PredireTaille':
                updatePrediction('PredictionTaille');
                break;
            case 'PredireAge':
                updatePrediction('PredictionAge');
                break;
            case 'PredireDeracinement':
                updatePrediction('PredictionDeracinement');
                break;
        }
    });
});


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

$(document).ready(function(){

    $('#arbreForm').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        let id_arbre = $('#idArbre').val();
        console.log("id de l'arbre : ", id_arbre);

// ---------------------------------------------------------------------------
// ----------------------- HAUTEUR TRONC ARBRE -------------------------------
// ---------------------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=hauteur_tronc&id=' + id_arbre, function(response) {
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
        ajaxRequest('GET', 'PHP/request.php?action=diametre&id=' + id_arbre, function(response) {
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
        ajaxRequest('GET', 'PHP/request.php?action=coordonnees&id=' + id_arbre, function(response) {
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
        ajaxRequest('GET', 'PHP/request.php?action=hauteurtotale&id=' + id_arbre, function(response) {
            console.log("hauteur totale de l'arbre : ", response);
            // Afficher le résultat dans votre page HTML
            $('.hauteur_totale_arbre').html(
                '<p> L\'hauteur totale est : ' +
                response+
                '</p>');

        });

// -----------------------------------------------------------------
// ----------------------- AGE ESTIM -------------------------------
// -----------------------------------------------------------------
        ajaxRequest('GET', 'PHP/request.php?action=age_estim&id=' + id_arbre, function(response) {
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
        ajaxRequest('GET', 'PHP/request.php?action=port&id=' + id_arbre, function(response) {
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
        ajaxRequest('GET', 'PHP/request.php?action=revetement&id=' + id_arbre, function(response) {
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
        ajaxRequest('GET', 'PHP/request.php?action=feuillage&id=' + id_arbre, function(response) {
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


    });
});