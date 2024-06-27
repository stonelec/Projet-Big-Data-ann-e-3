------------------------------------------------------------
-- Insertion des données dans etat_arbre
------------------------------------------------------------

INSERT INTO public.etat_arbre (etat_arb)
VALUES
    ('Abattu'),         -- 1
    ('En place'),       -- 2
    ('Essouché'),       -- 3
    ('Non essouché'),   -- 4
    ('Remplacé'),       -- 5
    ('Supprimé');       -- 6

------------------------------------------------------------
-- Insertion des données dans stade_de_dev
------------------------------------------------------------

INSERT INTO public.stade_de_dev (stade_dev)
VALUES
    ('Jeune'),          -- 1
    ('Adulte'),         -- 2
    ('Vieux'),          -- 3
    ('Senescent');      -- 4


------------------------------------------------------------
-- Insertion des données dans type_de_pied
------------------------------------------------------------

INSERT INTO public.type_de_pied (type_pied)
VALUES
    ('Bac de plantation'),              -- 1
    ('Revêtement non perméable'),       -- 2
    ('Terre'),                          -- 3
    ('Fosse arbre'),                    -- 4
    ('Gazon');                          -- 5

------------------------------------------------------------
-- Insertion des données dans type_de_port
------------------------------------------------------------

INSERT INTO public.type_de_port (type_port)
VALUES
    ('Couronne'),                       -- 1
    ('Libre'),                          -- 2
    ('Semi-libre'),                     -- 3
    ('Architecturé'),                   -- 4
    ('Cépée'),                          -- 5
    ('Rideau'),                         -- 6
    ('Réduit'),                         -- 7
    ('Réduit relâché'),                 -- 8
    ('Têtard'),                         -- 9
    ('Têtard relâché'),                 -- 10
    ('Tête de chat'),                   -- 11
    ('Tête de chat relâchée'),          -- 12
    ('Etêté');                          -- 13

------------------------------------------------------------
-- Insertion des données dans type_de_user
------------------------------------------------------------

INSERT INTO public.type_feuillage (feuillage)
VALUES
    ('Feuillu'),
    ('Conifère');

INSERT INTO public.user (nom_user, prenom_user, email_user, date_naissance, password_user, telephone_user)
VALUES
    ('LE PAN', 'Ethan', 'ethan.le-pan@isen-ouest.yncrea.fr','2003-12-03','ethan','0652245323');

------------------------------------------------------------
-- Ajout des arbres depuis un fichier CSV
------------------------------------------------------------

CREATE TEMP TABLE temp_arbre (
                                 longitude FLOAT,
                                 latitude FLOAT,
                                 clc_quartier VARCHAR(100),
                                 clc_secteur VARCHAR(100),
                                 haut_tot FLOAT,
                                 haut_tronc FLOAT,
                                 tronc_diam FLOAT,
                                 fk_arb_etat VARCHAR(50),
                                 fk_stadedev VARCHAR(50),
                                 fk_port VARCHAR(50),
                                 fk_pied VARCHAR(50),
                                 fk_situation VARCHAR(50),
                                 fk_revetement VARCHAR(50),
                                 age_estim FLOAT,
                                 fk_prec_estim FLOAT,
                                 clc_nbr_diag FLOAT,
                                 fk_nomtech VARCHAR(50),
                                 villeca VARCHAR(50),
                                 feuillage VARCHAR(50),
                                 remarquable VARCHAR(10)
);

-- Importer les données depuis le fichier CSV
COPY temp_arbre
    FROM 'Data_Arbre.csv'
    DELIMITER ','
    CSV HEADER;

INSERT INTO arbre (longitude, latitude, hauteur_tot, hauteur_tronc, diametre_tronc, id_etat_arbre, id_stade_dev, id_port, id_pied, id_user, espece, remarquable, id_feuillage, age_estim, revetement)
SELECT
    longitude,
    latitude,
    haut_tot,
    haut_tronc,
    tronc_diam,
    ea.id_etat_arbre,
    sd.id_stade_dev,
    tp.id_port,
    tpied.id_pied,
    1, -- Assumons que l'utilisateur par défaut a l'ID 1
    fk_nomtech AS espece,
    CASE WHEN remarquable = 'Oui' THEN 1 ELSE 0 END AS remarquable,
    tf.id_feuillage,
    age_estim,
    CASE WHEN fk_revetement = 'Non' THEN 0 ELSE 1 END AS revetement
FROM temp_arbre ta
LEFT JOIN etat_arbre ea ON ea.etat_arb = ta.fk_arb_etat
LEFT JOIN stade_de_dev sd ON sd.stade_dev = ta.fk_stadedev
LEFT JOIN type_de_port tp ON tp.type_port = ta.fk_port
LEFT JOIN type_de_pied tpied ON tpied.type_pied = ta.fk_pied
LEFT JOIN type_feuillage tf ON tf.feuillage = ta.feuillage;









/*
INSERT INTO public.arbre (id_user,longitude, latitude, hauteur_tot, hauteur_tronc, diametre_tronc, id_etat_arbre, id_stade_dev, id_port, id_pied, espece, remarquable, id_feuillage, age_estim, revetement)
VALUES
    (1, '3.2932636093638927', '49.84050020512298', 6.0, 2.0, 37.0, 2, 1, 3, 5, 'QUERUB', 0,1,150,0),
    (1, '3.273379794709001', '49.861408713361236', 13.0, 2.0, 1.0, 2, 2, 3, 5, 'PINNIGnig', 0,2,150,0),
    (1, '3.289067824663547', '49.84451310660708', 12.0, 3.0, 116.0, 5, 2, 3, 5, 'ACEPSE', 0,1,30,0),
    (1, '3.30238687765097', '49.86177771714989', 16.0, 3.0, 150.0, 2, 2, 3, 5, 'ACEPLA', 0,1,2,0),
    (1, '3.3040472408930164', '49.85844620245707', 5.0, 2.0, 170.0, 3, 2, 7, 5, 'SALBAB', 0,1,40,0),
    (1, '3.3055374576904195', '49.86092815875158', 8.0, 3.0, 103.0, 2, 2, 8, 4, 'ACEPLA', 0,1,30,0),
    (1, '3.2712644773158095', '49.83789717103086', 6.0, 3.0, 100.0, 2, 2, 3, 5, 'TILCOR', 0,1,50,0),
    (1, '3.270542022798621', '49.83759002208269', 9.0, 4.0, 135.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2703639865278205', '49.837513824511056', 9.0, 4.0, 121.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2699987322142414', '49.837363346686566', 9.0, 2.0, 107.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2686778980916245', '49.836771490886164', 9.0, 2.0, 110.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2684891765030604', '49.836690672182', 9.0, 5.0, 115.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2683265978609035', '49.83661587104197', 9.0, 5.0, 103.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2644474579549296', '49.83485106460306', 10.0, 4.0, 160.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.264081476895156', '49.83469510633891', 10.0, 4.0, 140.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2639034150127553', '49.834610573696686', 10.0, 4.0, 160.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.263719806718418', '49.834519396616585', 10.0, 5.0, 163.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.263381048264875', '49.834364800893226', 10.0, 4.0, 139.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2614102693684934', '49.83348707488355', 11.0, 3.0, 142.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.259813743893175', '49.832747600002314', 11.0, 4.0, 160.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2596338762769332', '49.83266687055828', 10.0, 5.0, 110.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2594435957529773', '49.83257455610548', 10.0, 2.0, 125.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2593006728613987', '49.83250782823191', 9.0, 2.0, 138.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2589132043395206', '49.83233560309981', 10.0, 3.0, 125.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.258645777370354', '49.832210664331164', 10.0, 2.0, 115.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2585013674586003', '49.832140134836514', 10.0, 2.0, 150.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2555630812273786', '49.830950085625076', 9.0, 3.0, 130.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2553910291612764', '49.83088441255169', 10.0, 3.0, 150.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2540679279877156', '49.83039684016489', 9.0, 2.0, 105.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2539602015529114', '49.83035714069742', 9.0, 2.0, 120.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2538137740893767', '49.83030317854162', 9.0, 2.0, 140.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2536831939149216', '49.83025505820205', 9.0, 2.0, 140.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.252901387823905', '49.829966940855485', 9.0, 2.0, 130.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.2524220334375062', '49.82978522278478', 9.0, 2.0, 140.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.252117065240142', '49.82967930289011', 9.0, 2.0, 110.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0),
    (1, '3.252003672805389', '49.82963609667133', 9.0, 3.0, 115.0, 2, 2, 10, 5, 'TILCOR', 0,1,50,0);

*/