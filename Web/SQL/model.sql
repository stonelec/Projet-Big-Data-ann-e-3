------------------------------------------------------------
--        Script Postgre
------------------------------------------------------------



------------------------------------------------------------
-- Table: User
------------------------------------------------------------
CREATE TABLE public.User(
                            id_user          SERIAL NOT NULL ,
                            nom_user         VARCHAR (20) NOT NULL ,
                            prenom_user      VARCHAR (20) NOT NULL ,
                            mail             VARCHAR (50) NOT NULL ,
                            date_naissance   DATE  NOT NULL ,
                            password         VARCHAR (50) NOT NULL ,
                            type_user        VARCHAR (20) NOT NULL ,
                            telephone        VARCHAR (10) NOT NULL  ,
                            CONSTRAINT User_PK PRIMARY KEY (id_user)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Etat_Arbre
------------------------------------------------------------
CREATE TABLE public.Etat_Arbre(
                                  id_etat_arbre   SERIAL NOT NULL ,
                                  etat_arbre      VARCHAR (20) NOT NULL  ,
                                  CONSTRAINT Etat_Arbre_PK PRIMARY KEY (id_etat_arbre)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Stade de développement
------------------------------------------------------------
CREATE TABLE public.Stade_de_developpement(
                                              id_stade_dev   SERIAL NOT NULL ,
                                              stade_dev      VARCHAR (20) NOT NULL  ,
                                              CONSTRAINT Stade_de_developpement_PK PRIMARY KEY (id_stade_dev)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Type de pied
------------------------------------------------------------
CREATE TABLE public.Type_de_pied(
                                    id_pied     SERIAL NOT NULL ,
                                    type_pied   VARCHAR (20) NOT NULL  ,
                                    CONSTRAINT Type_de_pied_PK PRIMARY KEY (id_pied)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Type de port
------------------------------------------------------------
CREATE TABLE public.Type_de_port(
                                    id_port     SERIAL NOT NULL ,
                                    type_port   VARCHAR (20) NOT NULL  ,
                                    CONSTRAINT Type_de_port_PK PRIMARY KEY (id_port)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: Arbre
------------------------------------------------------------
CREATE TABLE public.Arbre(
                             id_arbre         SERIAL NOT NULL ,
                             espece           VARCHAR (20) NOT NULL ,
                             hauteur_tot      FLOAT  NOT NULL ,
                             hauteur_tronc    FLOAT  NOT NULL ,
                             diametre_tronc   FLOAT  NOT NULL ,
                             remarquable      BOOL  NOT NULL ,
                             latitude         FLOAT  NOT NULL ,
                             longitude        FLOAT  NOT NULL ,
                             id_user          INT  NOT NULL ,
                             id_etat_arbre    INT  NOT NULL ,
                             id_stade_dev     INT  NOT NULL ,
                             id_pied          INT  NOT NULL ,
                             id_port          INT  NOT NULL  ,
                             CONSTRAINT Arbre_PK PRIMARY KEY (id_arbre)

    ,CONSTRAINT Arbre_User_FK FOREIGN KEY (id_user) REFERENCES public.User(id_user)
    ,CONSTRAINT Arbre_Etat_Arbre0_FK FOREIGN KEY (id_etat_arbre) REFERENCES public.Etat_Arbre(id_etat_arbre)
    ,CONSTRAINT Arbre_Stade_de_developpement1_FK FOREIGN KEY (id_stade_dev) REFERENCES public.Stade_de_developpement(id_stade_dev)
    ,CONSTRAINT Arbre_Type_de_pied2_FK FOREIGN KEY (id_pied) REFERENCES public.Type_de_pied(id_pied)
    ,CONSTRAINT Arbre_Type_de_port3_FK FOREIGN KEY (id_port) REFERENCES public.Type_de_port(id_port)
)WITHOUT OIDS;



