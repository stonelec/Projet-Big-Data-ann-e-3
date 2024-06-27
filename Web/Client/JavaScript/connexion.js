
//1er on récupère le mail et le mot de passe :
//2ème on vérifie avec la base de donnée si ça correspond
//3ème, on trouve un moyen de récupérer l'id du user

$(document).ready(function (){

    $('.form_connexion').submit(function(event) {
        event.preventDefault(); // Empêcher la soumission du formulaire

        console.log("ENVOYER")

        let val_email = $('mail').val();
        let mot_de_passe = $('password').val();

        console.log(val_email);
        console.log(mot_de_passe);



        /*

        let data_mail = []
        let data_mot_de_passe = []
        ajaxRequest('GET', 'PHP/request.php?action=recuperermail',function(response_mail)  {

            console.log(response_mail);

            let n = response_mail.length;

            for(let i=0; i<n; i++){

                data_mail[i] = response_mail[i];

            }

            ajaxRequest('GET', 'PHP/request.php?action=recuperermdp',function(response_mdp)  {

                console.log(response_mdp);

                //Récupère tout les
                for(let i=0; i<n; i++){

                    data_mot_de_passe[i] = response_mdp[i];

                }

                for(let i=0; i<n; i++){

                    console.log(data_mail[i].email_user);
                    console.log(data_mot_de_passe[i].password_user);

                }

            });

        });*/



    });

});