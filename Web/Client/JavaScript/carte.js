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
            ajaxRequest('GET', 'PHP/request.php?action=prediction_toutes_taille', function(response) {
                /*console.log("Prediction de la taille de l'arbre pour ID", id, ":", response);*/
                console.log("response");
                console.log(response);
            });
        }

        var data = [
            {
                type: "scattermapbox",
                text: combineText(rows),
                lon: unpack(rows, "longitude"),
                lat: unpack(rows, "latitude"),
                marker: {
                    color: rows.map(row => {
                        if (mode === "cluster") {
                            switch (row.cluster) {
                                case "0": return "blue";
                                case "1": return "green";
                                case "2": return "red";
                                case undefined: return "yellow";
                            }
                        } else {
                            return "green";
                        }
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
);
}