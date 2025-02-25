------------------------------------------------------------
--        Script Postgre
------------------------------------------------------------

-- Suppression des tables si elles existent
DROP TABLE IF EXISTS public.arbre;
DROP TABLE IF EXISTS public.user;
DROP TABLE IF EXISTS public.type_feuillage;
DROP TABLE IF EXISTS public.type_de_port;
DROP TABLE IF EXISTS public.type_de_pied;
DROP TABLE IF EXISTS public.stade_de_dev;
DROP TABLE IF EXISTS public.etat_arbre;


------------------------------------------------------------
-- Table: user
------------------------------------------------------------
CREATE TABLE public.user(
                            id_user          SERIAL NOT NULL ,
                            nom_user         VARCHAR (50) NOT NULL ,
                            prenom_user      VARCHAR (50) NOT NULL ,
                            email_user       VARCHAR (100) NOT NULL ,
                            date_naissance   DATE  NOT NULL ,
                            password_user    VARCHAR (100) NOT NULL ,
                            telephone_user   VARCHAR (10) NOT NULL  ,
                            CONSTRAINT user_PK PRIMARY KEY (id_user)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: etat_arbre
------------------------------------------------------------
CREATE TABLE public.etat_arbre(
                                  id_etat_arbre   SERIAL NOT NULL ,
                                  etat_arb        VARCHAR (50) NOT NULL  ,
                                  CONSTRAINT etat_arbre_PK PRIMARY KEY (id_etat_arbre)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: stade_de_dev
------------------------------------------------------------
CREATE TABLE public.stade_de_dev(
                                    id_stade_dev   SERIAL NOT NULL ,
                                    stade_dev      VARCHAR (50) NOT NULL  ,
                                    CONSTRAINT stade_de_dev_PK PRIMARY KEY (id_stade_dev)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_de_pied
------------------------------------------------------------
CREATE TABLE public.type_de_pied(
                                    id_pied     SERIAL NOT NULL ,
                                    type_pied   VARCHAR (50) NOT NULL  ,
                                    CONSTRAINT type_de_pied_PK PRIMARY KEY (id_pied)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_de_port
------------------------------------------------------------
CREATE TABLE public.type_de_port(
                                    id_port     SERIAL NOT NULL ,
                                    type_port   VARCHAR (50) NOT NULL  ,
                                    CONSTRAINT type_de_port_PK PRIMARY KEY (id_port)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_feuillage
------------------------------------------------------------
CREATE TABLE public.type_feuillage(
                                      id_feuillage   SERIAL NOT NULL ,
                                      feuillage      VARCHAR (50) NOT NULL  ,
                                      CONSTRAINT type_feuillage_PK PRIMARY KEY (id_feuillage)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: arbre
------------------------------------------------------------
CREATE TABLE public.arbre(
                             id_arbre         SERIAL NOT NULL ,
                             espece           VARCHAR (50) NOT NULL ,
                             hauteur_tot      FLOAT  NOT NULL ,
                             hauteur_tronc    FLOAT  NOT NULL ,
                             diametre_tronc   FLOAT  NOT NULL ,
                             remarquable      INT  NOT NULL ,
                             latitude         FLOAT  NOT NULL ,
                             longitude        FLOAT  NOT NULL ,
                             age_estim        INT ,
                             revetement       INT  NOT NULL ,
                             id_user          INT  NOT NULL ,
                             id_etat_arbre    INT  NOT NULL ,
                             id_stade_dev     INT  NOT NULL ,
                             id_pied          INT  NOT NULL ,
                             id_port          INT  NOT NULL ,
                             id_feuillage     INT  NOT NULL  ,
                             CONSTRAINT arbre_PK PRIMARY KEY (id_arbre)

    ,CONSTRAINT arbre_user_FK FOREIGN KEY (id_user) REFERENCES public.user(id_user)
    ,CONSTRAINT arbre_etat_arbre0_FK FOREIGN KEY (id_etat_arbre) REFERENCES public.etat_arbre(id_etat_arbre)
    ,CONSTRAINT arbre_stade_de_dev1_FK FOREIGN KEY (id_stade_dev) REFERENCES public.stade_de_dev(id_stade_dev)
    ,CONSTRAINT arbre_type_de_pied2_FK FOREIGN KEY (id_pied) REFERENCES public.type_de_pied(id_pied)
    ,CONSTRAINT arbre_type_de_port3_FK FOREIGN KEY (id_port) REFERENCES public.type_de_port(id_port)
    ,CONSTRAINT arbre_type_feuillage4_FK FOREIGN KEY (id_feuillage) REFERENCES public.type_feuillage(id_feuillage)
)WITHOUT OIDS;

