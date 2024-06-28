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


function showMap(mode) {
d3.csv(
    "../SQL/Data_Arbre.csv",
    function(err, rows) {
        function unpack(rows, key) {
            return rows.map(function(row) {
                return row[key];
            });
        }
        function combineText(rows) {
            return rows.map(function(row) {
                return `fk_arb_etat: ${row.fk_arb_etat}<br>
                        Latitude: ${row.latitude}<br>
                        Longitude: ${row.longitude}<br>
                        Secteur: ${row.clc_secteur}<br>
                        Hauteur_totale: ${row.haut_tot}<br>
                        Hauteur_tronc: ${row.haut_tronc}<br>
                        Tronc_diamètre: ${row.tronc_diam}<br>
                        Etat: ${row.fk_arb_etat}<br>
                        Stade: ${row.fk_stadedev}<br>
                        Port: ${row.fk_port}<br>  
            `;
            });
        }


        if (mode === "cluster") {
            console.log("Clustering...");
                // Faire la requête AJAX pour obtenir la prédiction du cluster
                ajaxRequest('GET', 'PHP/request.php?action=prediction_toutes_taille', function(response) {
                    // Supposons que votre réponse soit un objet JSON avec une propriété 'cluster'

                    // Vous pouvez également mettre à jour votre page HTML ici si nécessaire
                    console.log("Prediction du cluster ", response);
                    for (var i = 0; i < response.length; i++){
                        rows[i].cluster = response[i];
                    }
                    console.log(rows);
                    /*remove arbre sans cluster*/
                    console.log("Remove arbre sans cluster");
                    rows = rows.filter(row => row.cluster !== undefined);
                    console.log(rows);
                    var data = [
                        {
                            type: "scattermapbox",
                            text: combineText(rows),
                            lon: unpack(rows, "longitude"),
                            lat: unpack(rows, "latitude"),
                            marker: {
                                color: rows.map(row => {
                                    switch (row.cluster) {
                                        case 0 : return "#6F8F72";
                                        case 1 : return "#504136";
                                        case 2 : return "#BFB48F";
                                    }
                                }),
                                size: 5
                            }
                        }
                    ];

                    var layout = {
                        dragmode: "zoom",
                        mapbox: { style: "open-street-map", center: { lat: 49.847754, lon: 3.29704 }, zoom: 11.5 },
                        margin: { r: 0, t: 0, b: 0, l: 0 }
                    };

                    Plotly.newPlot("myDiv", data, layout);

                });
        }else {
            var data = [
                {
                    type: "scattermapbox",
                    text: combineText(rows),
                    lon: unpack(rows, "longitude"),
                    lat: unpack(rows, "latitude"),
                    marker: {
                        color: rows.map(row => {
                                return "#504136";
                        }),
                        size: 4
                    }
                }
            ];

            var layout = {
                dragmode: "zoom",
                mapbox: { style: "open-street-map", center: { lat: 49.847754, lon: 3.29704 }, zoom: 11.5 },
                margin: { r: 0, t: 0, b: 0, l: 0 }
            };

            Plotly.newPlot("myDiv", data, layout);
        }


    }
);
}