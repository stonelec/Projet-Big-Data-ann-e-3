------------------------------------------------------------
-- Insertion des données dans etat_arbre
------------------------------------------------------------

INSERT INTO public.etat_arbre (etat_arbre)
VALUES
    ('Abattu'),
    ('En place'),
    ('Essouché'),
    ('Non essouché'),
    ('Remplacé'),
    ('Supprimé');

------------------------------------------------------------
-- Insertion des données dans stade_de_dev
------------------------------------------------------------

INSERT INTO public.stade_de_dev (stade_dev)
VALUES
    ('Jeune'),
    ('Adulte'),
    ('Vieux'),
    ('Senescent');

------------------------------------------------------------
-- Insertion des données dans type_de_pied
------------------------------------------------------------

INSERT INTO public.type_de_pied (type_pied)
VALUES
    ('Bac de plantation'),
    ('Revêtement non perméable'),
    ('Terre'),
    ('Fosse arbre'),
    ('Gazon');

------------------------------------------------------------
-- Insertion des données dans type_de_port
------------------------------------------------------------

INSERT INTO public.type_de_port (type_port)
VALUES
    ('Couronne'),
    ('Libre'),
    ('Semi-libre'),
    ('Architecturé'),
    ('Cépée'),
    ('Rideau'),
    ('Réduit'),
    ('Réduit relâché'),
    ('Têtard'),
    ('Têtard relâché'),
    ('Tête de chat'),
    ('Tête de chat relâchée'),
    ('Etêté');

------------------------------------------------------------
-- Insertion des données dans type_de_user
------------------------------------------------------------

INSERT INTO public.type_de_user (type_user)
VALUES
    ('Adminstrateur'),
    ('Utilisateur');
