
//1er on récupère le mail et le mot de passe :
//2ème on vérifie avec la base de donnée si ça correspond
//3ème, on trouve un moyen de récupérer l'id du user

$(document).ready(function (){

    $('.form_connexion').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        console.log("ENVOYER")

        let val_email = $('.email').val();
        let mot_de_passe = $('.mot_de_passe').val();

        let data_mail = []
        let data_mot_de_passe = []

        ajaxRequest('GET', 'PHP/request.php?action=recuperermail',function(response)  {

            console.log(response);

            for(let i=0; i<response.length; i++){

                data_mail[i] = response[i];

            }

        });

        ajaxRequest('GET', 'PHP/request.php?action=recuperermdp',function(response)  {

            console.log(response);

            for(let i=0; i<response.length; i++){

                data_mot_de_passe[i] = response[i];

            }

        });

        let n = data_mail.length;

        console.log("TEST");
        console.log(n);

        for(let i=0; i<n ;i++){

            if(val_email === data_mail[i].email_user && mot_de_passe === data_mot_de_passe[i].password_user){

                console.log("VALID");

            }

            else {

                console.log("ERREUR");

            }

        }


    });

});