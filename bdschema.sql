SET search_path = bdschema;

DROP SCHEMA IF EXISTS bdschema CASCADE;
CREATE SCHEMA bdschema;

CREATE TABLE IF NOT EXISTS bdschema.Emplacement (
    eid                     VARCHAR(10)             NOT NULL,    -- 5 premieres lettres de la province, chiffres
    numeroPorte             INTEGER                 NOT NULL,
    rue                     VARCHAR(100)            NOT NULL,    
    ville                   VARCHAR(100)            NOT NULL,
    codePostal              VARCHAR(9)              NOT NULL,
    carte                   INTEGER                 NOT NULL,
    nombreVoituresMax       INTEGER                 DEFAULT 0,

    PRIMARY KEY (eid)
);

CREATE TABLE IF NOT EXISTS bdschema.Vehicule (
    vid                     VARCHAR(10)             NOT NULL,    -- 3 premieres lettre de la marque 3 premieres lettres du modele 4 numeros
    marque                  VARCHAR(20)             NOT NULL,    
    modele                  VARCHAR(20)             NOT NULL,
    specifications          TEXT                    NOT NULL,    -- siege auto... etc
    emplacement             VARCHAR(10),                         
	immatriculation         VARCHAR(6)              NOT NULL,
	consommationEssence     FLOAT(1)                NOT NULL,    -- Litres/100km
    odometre                INTEGER                 NOT NULL, 
    valeurOdometreVente     INTEGER                 NOT NULL, 
    dateMiseEnService       DATE                    NOT NULL, 
    prixHoraire             INTEGER                 NOT NULL, 
    prixKillometre          FLOAT(2)                NOT NULL, 

    Constraint "Vehicule_pkey" Primary Key ("vid"),
    FOREIGN KEY (emplacement) REFERENCES bdschema.Emplacement(eid) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS bdschema.Hybrid (
    killowateur             INTEGER                 NOT NULL, 

    --PRIMARY KEY (vid) 
) INHERITS(bdschema.Vehicule);

CREATE TABLE IF NOT EXISTS bdschema.Regulier (
    
    --PRIMARY KEY (vid)
) INHERITS(bdschema.Vehicule);

CREATE TABLE IF NOT EXISTS bdschema.MiniCamionette (
    
    --PRIMARY KEY (vid)
) INHERITS(bdschema.Vehicule);

CREATE TABLE IF NOT EXISTS bdschema.Assurance(
    numAssurance            VARCHAR(10)             NOT NULL, 
    voitureAssuree          VARCHAR(10)             NOT NULL, 
    dateDebut               DATE                    NOT NULL, 
    dateEcheance            DATE                    NOT NULL, 
    assureur                TEXT                    NOT NULL, 

    PRIMARY KEY (numAssurance, voitureAssuree),
    FOREIGN KEY (voitureAssuree) REFERENCES bdschema.Vehicule(vid)
);

CREATE TABLE IF NOT EXISTS bdschema.Membre (
    mid                     VARCHAR(10)             NOT NULL, 
    numeroPorte             INTEGER                 NOT NULL,
    rue                     VARCHAR(100)            NOT NULL,    
    ville                   VARCHAR(100)            NOT NULL,
    codePostal              VARCHAR(9)              NOT NULL,
    adresseEmail            TEXT                    NOT NULL, 
    numBancaire             VARCHAR(9)              NOT NULL, 
    banque                  VARCHAR(3)              NOT NULL,
    motDePasse              TEXT                    NOT NULL, 
    emplacementPref         VARCHAR(10)             NOT NULL, 

    PRIMARY KEY (mid),
    FOREIGN KEY (emplacementPref) REFERENCES bdschema.Emplacement(eid)
);

CREATE TABLE IF NOT EXISTS bdschema.MembreCooperative (
    montant                 INTEGER                 NOT NULL,    -- montant des parts obtenues
    nbParts                 INTEGER                 NOT NULL,    -- nombre de parts aquises

	PRIMARY KEY (mid)
) INHERITS (bdschema.Membre);


CREATE TABLE IF NOT EXISTS bdschema.PersonneMorale (
    cotisationAnnuelle     INTEGER                  NOT NULL,
	PRIMARY KEY (mid)
) INHERITS (bdschema.Membre);

CREATE TABLE IF NOT EXISTS bdschema.PersonnePysique (
    age                     INTEGER                 NOT NULL,    -- age de la personne
    dateDernierAccident     DATE                    DEFAULT NULL,
    permiConduire           VARCHAR(15)             NOT NULL,
    cotisationAnnuelle     INTEGER                  NOT NULL,

	PRIMARY KEY (mid)
) INHERITS (bdschema.Membre);

CREATE TABLE IF NOT EXISTS bdschema.Reservation (
	numeroMembre			VARCHAR(10)				NOT NULL,
	vehicule				VARCHAR(10)				NOT NULL, 	
	dateDebut				DATE					NOT NULL, 
	dateFin					DATE					NOT NULL,
	heureDebut				TIME					NOT NULL, 
	heureFin				TIME					NOT NULL,
    exigeancesSupp          TEXT                    NOT NULL, 
	
	PRIMARY KEY (numeroMembre, vehicule, dateDebut), 
	FOREIGN KEY (numeroMembre) REFERENCES bdschema.Membre (mid),
	FOREIGN KEY (vehicule) REFERENCES bdschema.Vehicule (vid)
);

CREATE TABLE IF NOT EXISTS bdschema.Facture (
    fid                     VARCHAR(10)             NOT NULL, 
    solde                   INTEGER                 NOT NULL, 
    estPaye                 BOOLEAN                 DEFAULT TRUE, 
    dateEcheance            DATE                    NOT NULL, 
    dateFacturation         DATE                    NOT NULL, 
    noMembre                VARCHAR(10)             NOT NULL,
   
    PRIMARY KEY (fid),
    FOREIGN KEY (noMembre) REFERENCES Membre(mid)
);

CREATE TABLE IF NOT EXISTS bdschema.Utilisation (
    nombreKillometres       INTEGER                 NOT NULL, 
    numeroMembre			VARCHAR(10)				NOT NULL,
	vehicule				VARCHAR(10)				NOT NULL, 	
	dateDebut				DATE					NOT NULL,  
    numeroFacture           VARCHAR(10)             NOT NULL, 
    dateFin                 DATE                    NOT NULL, 

    PRIMARY KEY (numeroMembre, numeroFacture, vehicule, dateDebut),
    FOREIGN KEY (numeroMembre, vehicule, dateDebut) REFERENCES bdschema.Reservation (numeroMembre, vehicule, dateDebut),
    FOREIGN KEY (numeroFacture) REFERENCES bdschema.Facture (fid)
);
