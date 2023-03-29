-- EMPLACEMENTS
--bdschema.Emplacement(eid, numeroPorte, rue, ville, codePostal, carte, nombreVoituresMax) 

INSERT INTO bdschema.Emplacement (eid, numeroPorte, rue, ville, codePostal, carte, nombreVoituresMax)
VALUES  ('Emp0000001', 1,    "Macédoine",    "Montréal",   'H6C3X8', 123, 35 ),
        ('Emp0000002', 134,  "La Tulipe",    "Sagueney",   'H7H3Z1', 123, 21 ),
        ('Emp0000003', 2033, "Notre-Dame O", "Chicoutimi", 'H3Z6T4', 123, 65 ),
        ('Emp0000004', 45,   "LesEscoumins", "Tadoussac",  'H9X3Z1', 123, 9 );

-- VOITURES (hybrid, regulierm miniCamionette)
INSERT INTO bdschema.miniCamionette (vid, marque, modele, specifications, emplacement, immatriculation, consommationEssence, odometre, valeurOdometreVente, dateMiseEnService, prixHoraire, prixKillometre)
VALUES  ('cami000001', 'toyota', 'bluetooth',  'eid', 'J53ZTX', 8.6, 32000, 70000, '2022-08-01', 6, 0.22 ),
        ('cami000002', 'ford',   'siege-auto', 'eid', 'C36ABC', 7.4, 64000, 80000, '2022-04-05', 8, 0.32 ),
        ('cami000003', 'dodge',  'bluetooth',   NULL, 'U12UUU', 9.0, 11000, 60000, '2023-02-23', 7, 0.44 );

INSERT INTO bdschema.Regulier (vid, marque, modele, specifications, emplacement, immatriculation, consommationEssence, odometre, valeurOdometreVente, dateMiseEnService, prixHoraire, prixKillometre)
VALUES  ('regu000001', 'subaru',    'toit-ouvrant',  NULL, 'C65FCD', 5.6, 1000,   70000, '2023-03-29', 5, 0.67 ),
        ('regu000002', 'infinity',  'gps',          'eid', 'C00LLL', 7.0, 32000,  57000, '2021-12-24', 5, 0.45 ),
        ('regu000003', 'mustang',   'bluetooth gps','eid', 'M00DLE', 9.2, 40000,  80000, '2020-09-11', 12, 1.33 ),
        ('regu000004', 'lambrgini', 'bluetooth',    'eid', 'H33LLO', 10.1, 10000, 90000, '2022-03-01', 15, 1.55 );

INSERT INTO bdschema.Hybrid (vid, marque, modele, specifications, emplacement, immatriculation, consommationEssence, odometre, valeurOdometreVente, dateMiseEnService, prixHoraire, prixKillometre, killowateur)
VALUES  ('hybr000001', 'toyota', 'siege-auto',          'eid', 'P01YTE', 6.6, 70000, 71000,  '2021-03-01', 8, 0.80,10 ),
        ('hybr000002', 'mazda',  'bluetooth',           'eid', 'S31FIE', 9.5, 56000, 80000,  '2022-03-01', 3, 0.60, 100 ),
        ('hybr000003', 'bmw',    'bluetooth siege-auto', NULL, 'G64GVD', 3.2, 5000,  100000, '2023-03-25', 2, 0.45, 50 );


-- ASSURANCES
INSERT INTO bdschema.Assurance (numAssurance, voitureAssuree, dateDebut, dateEcheance, assureur)
VALUES  ('Ass0000001', 'cami000001', '2023-03-01', '2024-03-01', "Intact" ),
        ('Ass0000002', 'cami000001', '2023-03-01', '2023-03-01', "Intact" ),
        ('Ass0000003', 'cami000002', '2022-07-04', '2023-07-04', "LaPersonelle" ),
        ('Ass0000004', 'cami000003', '2023-01-01', '2023-01-01', "CAA" ),
        ('Ass0000005', 'regu000001', '2023-01-01', '2023-01-01', "DesJardins" ),
        ('Ass0000006', 'regu000002', '2023-03-01', '2024-03-01', "Intact" ),
        ('Ass0000007', 'regu000003', '2023-03-01', '2023-03-01', "Intact" ),
        ('Ass0000008', 'regu000004', '2022-07-04', '2023-07-04', "LaPersonelle" ),
        ('Ass0000009', 'hybr000001', '2023-01-01', '2023-01-01', "CAA" ),
        ('Ass0000010', 'hybr000002', '2023-01-01', '2023-01-01', "DesJardins" );
        ('Ass0000011', 'hybr000003', '2023-01-01', '2023-01-01', "Wawaneesa" );

-- MEMBRES
INSERT INTO bdschema.MembreCooperative (mid, numeroPorte, rue, ville, codePostal, adresseEmail, numBancaire, banque, motDePasse, emplacementPrefere, montant, nbParts)
VALUES  ('MeCo000001', 4, "Monterergie", "Montreal", 'H3C2T2', "alex.Tristan02@gmail.com", 05043512, 003, "PasseDeMots123!", 'emplacementPrefere', 100, 10),
        ('MeCo000002', 789, "Thibaudeau", "Chicoutimi", 'H6D8T4', "elwiiiise.Warin@hotmail.com", 74523895, 002, "jaimelesChevaux34", 'emplacementPrefere', 450, 60);

INSERT INTO bdschema.PersonnePhysique (mid, numeroPorte, rue, ville, codePostal, adresseEmail, numBancaire, banque, motDePasse, emplacementPrefere, cotisationAnnuelle)
VALUES  ('MePh000001', 97,  "Monterergie",    "Montreal",  'H4H3F4', "gevienve.trello@outlook.com", 43279123, 003, "Anacondalandq12",      'emplacementPrefere', 150),  -- prix de base pour une personne physique
        ('MePh000002', 453, "Justice",        "Sagueney",  'H7Y5G5', "hohoho@gmail.com",            56743492, 002, "5boiledPotatoes",      'emplacementPrefere', 150),
        ('MePh000003', 845, "Rose",           "Tadoussac", 'H8K2N3', "maths4life@gmail.com",        43240754, 001, "existanceIsPointless", 'emplacementPrefere', 150);


INSERT INTO bdschema.PersonneMorale (mid, numeroPorte, rue, ville, codePostal, adresseEmail, numBancaire, banque, motDePasse, emplacementPrefere, cotisationAnnuelle)
VALUES  ('MeMo000001', 105,  "Narwhale",  "Montreal",   'H0G2S4', "factures@genetec.com", 74927490, 003, "GenetectTransport1",   'emplacementPrefere', 500),  -- prix de base pour une personne morale 
        ('MeMo000002', 78, "Sentoriel",  "Sagueney",   'H5B9L1', "factures@gyro.com",    35323111, 002, "GyroBouge2",           'emplacementPrefere', 500),
        ('MeMo000003', 486, "St-Exupery", "Chicoutimi", 'H4J2H2', "factures@stc.com",     28934432, 001, "transportsPasPublics", 'emplacementPrefere', 500);

-- CONDUCTEURS
INSERT INTO bdschema.Conducteur (cid, permiConduire, age, dateDernierAccident)
VALUES  ('Cond000001',  'B5739-201843-26', 35, '2021-12-30'),
        ('Cond000002',  'C2432-342112-31', 35, '2023-03-29'),
        ('Cond000003',  'D1239-234212-31', 35, '2019-07-04'),
        ('Cond000004',  'E2345-254313-34', 35, '2021-08-13'),
        ('Cond000005',  'F0353-432963-74', 35, '2001-11-30'),
        ('Cond000006',  'G7247-739014-84', 35, '2021-06-21'),
        ('Cond000007',  'H0184-926491-45', 35, '2012-09-11'),
        ('Cond000008',  'I9742-843910-10', 35, NULL),
        ('Cond000009',  'J3210-943249-01', 35, NULL),
        ('Cond0000010', 'K8142-839432-91', 35, NULL),
        ('Cond0000011', 'L8413-123812-93', 35, NULL),
        ('Cond0000012', 'M9272-831932-09', 35, NULL);

-- RESERVATIONS
bdschema.Reservation (numeroMembre, vehicule, emplacement, dateDebut, dateFin, heureDebut, heureFin, exigeancesSupp)




-- FACTURE
bdschema.Facture (fid)




-- UTILISATION
INSERT INTO bdschema.Utilisation (numeroMembre, numeroFacture, vehicule, dateDebut, dateFin)




