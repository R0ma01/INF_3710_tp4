SET search_path = bdschema;

DROP SCHEMA IF EXISTS bdschema CASCADE;
CREATE SCHEMA bdschema;

CREATE TABLE IF NOT EXISTS bdschema.Emplacement (
    eid                     VARCHAR(10)             NOT NULL,    -- 5 premieres lettres de la province, chiffres
    numeroPorte             INTEGER                 NOT NULL,
    rue                     VARCHAR(100)            NOT NULL,    
    ville                   VARCHAR(100)            NOT NULL,
    codePostal              VARCHAR(9)              NOT NULL,
    province                VARCHAR(2)              NOT NULL,
    carte                   INTEGER                 NOT NULL,
    nombreVoitures          INTEGER                 DEFAULT 0,

    PRIMARY KEY (eid)
);

CREATE TABLE IF NOT EXISTS bdschema.Vehicule (
    vid                     VARCHAR(10)             NOT NULL,    -- 3 premieres lettre de la marque 3 premieres lettres du modele 4 numeros
    marque                  VARCHAR(20)             NOT NULL,    
    modele                  VARCHAR(20)             NOT NULL,
    specifications          TEXT                    NOT NULL,    -- siege auto... etc
    emplacement             VARCHAR(10),                         
    killometragePrecedent   INTEGER					DEFAULT NULL, --killometraqge au compteur
    killometrageActuel		INTEGER					DEFAULT NULL,
	immatriculation         VARCHAR(6),
	consommation            INTEGER                 NOT NULL,

    PRIMARY KEY (vid),
    FOREIGN KEY (emplacement) REFERENCES bdschema.Emplacement(eid) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS bdschema.Membre (
    mid                     VARCHAR(10)             NOT NULL,    -- Premiere lettre du prenom, premiere lettre du nom, suite de chiffres

    PRIMARY KEY (mid)
);

CREATE TABLE IF NOT EXISTS bdschema.MembreCooperative (
    montant                 INTEGER                 NOT NULL,    -- montant des parts obtenues
    nbParts                 INTEGER                 NOT NULL,    -- nombre de parts aquises

	PRIMARY KEY (mid)
) INHERITS (bdschema.Membre);

CREATE TABLE IF NOT EXISTS bdschema.MembreAutopartage (
    quotisationAnnuelle     INTEGER                 NOT NULL,    -- montant de la quotisation annuelle
    
	PRIMARY KEY (mid)
) INHERITS (bdschema.Membre);

CREATE TABLE IF NOT EXISTS bdschema.PersonnePhysique (	
	
	PRIMARY KEY (mid)
) INHERITS (bdschema.MembreAutopartage);

CREATE TABLE IF NOT EXISTS bdschema.Conducteur (
	cid 					VARCHAR(10)				NOT NULL, 
	numeroMembre			VARCHAR(10)				NOT NULL,
    permiConduire           VARCHAR(9)              NOT NULL,    -- chiffres sur le permi de conduire
    age                     INTEGER                 NOT NULL,    -- age de la personne
    dateDernierAccident     DATE,
    compteBanquaire         INTEGER                 NOT NULL,    -- chiffres du compte
    banque                  INTEGER                 NOT NULL,    -- 3 chiffres, id de la banque
    numeroPorte             INTEGER                 NOT NULL,
    rue                     VARCHAR(100)            NOT NULL,    
    ville                   VARCHAR(100)            NOT NULL,
    codePostal              VARCHAR(9)              NOT NULL,
    province                VARCHAR(2)              NOT NULL,
	
	PRIMARY KEY (cid), 
	FOREIGN KEY (numeroMembre) REFERENCES bdschema.PersonnePhysique(mid)

);

CREATE TABLE IF NOT EXISTS bdschema.PersonneMorale (

) INHERITS (bdschema.MembreAutopartage);

CREATE TABLE IF NOT EXISTS bdschema.Reservation (
	rid						VARCHAR(10)				NOT NULL, 
	vehicule				VARCHAR(10)				NOT NULL, 
	conducteur				VARCHAR(10)				NOT NULL, 
	dateDebut				DATE					NOT NULL, 
	dateFin					DATE					NOT NULL,
	heureDebut				TIME					NOT NULL, 
	heureFin				TIME					NOT NULL,
	
	PRIMARY KEY (rid), 
	FOREIGN KEY (vehicule) REFERENCES bdschema.Vehicule (vid),
	FOREIGN KEY (conducteur) REFERENCES bdschema.Conducteur(cid)
	
);
