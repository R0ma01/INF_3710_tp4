-- EMPLACEMENTS
INSERT INTO bdschema.Emplacement (eid, numeroPorte, rue, ville, codePostal, carte, nombreVoituresMax)
VALUES  ('Emp0000001', 1,    'Macédoine',    'Montréal',   'H6C3X8', 123, 35 ),
        ('Emp0000002', 134,  'La Tulipe',            'Sagueney',   'H7H3Z1', 123, 21 ),
        ('Emp0000003', 2033, 'Notre-Dame O', 'Chicoutimi', 'H3Z6T4', 123, 65 ),
        ('Emp0000004', 45,   'LesEscoumins', 'Tadoussac',  'H9X3Z1', 123, 9 );

-- VOITURES (hybrid, regulier, miniCamionette)
INSERT INTO bdschema.Vehicule (vid, marque, modele, specifications, emplacement, immatriculation, consommationEssence, odometre, valeurOdometreVente, dateMiseEnService, prixHoraire, prixKillometre)
VALUES  ('cami000001', 'toyota', 'scienna','bluetooth', 'Emp0000001', 'J53ZTX', 8.6, 32000, 70000, '2022-08-01', 6, 0.22),
        ('cami000002', 'ford', 'F-150' ,  'siege-auto', 'Emp0000002', 'C36ABC', 7.4, 64000, 80000, '2022-04-05', 8, 0.32),
        ('cami000003', 'dodge',  'RAM','bluetooth', NULL, 'U12UUU', 9.0, 11000, 60000, '2023-02-23', 7, 0.44),
        ('regu000001', 'subaru', 'WRX-STI', 'toit-ouvrant',  NULL, 'C65FCD', 5.6, 1000,   70000, '2023-03-29', 5, 0.67),
        ('regu000002', 'infinity', 'QX-5', 'gps', 'Emp0000002', 'C00LLL', 7.0, 32000,  57000, '2021-12-24', 5, 0.45),
        ('regu000003', 'mustang',   'Shelby','bluetooth gps','Emp0000002', 'M00DLE', 9.2, 40000,  80000, '2020-09-11', 12, 1.33),
        ('regu000004', 'lamborghini', 'urus','bluetooth', 'Emp0000003', 'H33LLO', 10.1, 10000, 90000, '2022-03-01', 15, 1.55),
        ('hybr000001', 'toyota', 'prius','siege-auto', 'Emp0000003', 'P01YTE', 6.6, 70000, 71000,  '2021-03-01', 8, 0.80),
        ('hybr000002', 'mazda', 'mazda3', 'bluetooth', 'Emp0000001', 'S31FIE', 9.5, 56000, 80000,  '2022-03-01', 3, 0.60),
        ('hybr000003', 'bmw', 'i8' , 'bluetooth siege-auto', 'Emp0000003', 'G64GVD', 3.2, 5000,  100000, '2023-03-25', 2, 0.45);

INSERT INTO bdschema.miniCamionette (vid)
VALUES  ('cami000001'),
        ('cami000002'),
        ('cami000003');

INSERT INTO bdschema.Regulier (vid)
VALUES  ('regu000001'),
        ('regu000002'),
        ('regu000003'),
        ('regu000004');

INSERT INTO bdschema.Hybrid (vid, killowateur)
VALUES  ('hybr000001', 10),
        ('hybr000002', 100),
        ('hybr000003', 50);

-- ASSURANCES
INSERT INTO bdschema.Assurance (numAssurance, voitureAssuree, dateDebut, dateEcheance, assureur)
VALUES  ('Ass0000001', 'cami000001', '2023-03-01', '2024-03-01', 'Intact' ),
        ('Ass0000002', 'cami000001', '2023-03-01', '2023-03-01', 'Intact' ),
        ('Ass0000003', 'cami000002', '2022-07-04', '2023-07-04', 'LaPersonelle' ),
        ('Ass0000004', 'cami000003', '2023-01-01', '2023-01-01', 'CAA' ),
        ('Ass0000005', 'regu000001', '2023-01-01', '2023-01-01', 'DesJardins' ),
        ('Ass0000006', 'regu000002', '2023-03-01', '2024-03-01', 'Intact' ),
        ('Ass0000007', 'regu000003', '2023-03-01', '2023-03-01', 'Intact' ),
        ('Ass0000008', 'regu000004', '2022-07-04', '2023-07-04', 'LaPersonelle' ),
        ('Ass0000009', 'hybr000001', '2023-01-01', '2023-01-01', 'CAA' ),
        ('Ass0000010', 'hybr000002', '2023-01-01', '2023-01-01', 'DesJardins' ),
        ('Ass0000011', 'hybr000003', '2023-01-01', '2023-01-01', 'Wawaneesa' );

-- MEMBRES
INSERT INTO bdschema.Membre (mid, numeroPorte, rue, ville, codePostal, adresseEmail, numBancaire, banque, motDePasse, emplacementPrefere)
VALUES  ('MeCo000001', 4, 'Monterergie', 'Montréal', 'H3C2T2', 'alex.Tristan02@gmail.com', 05043512, 003, 'PasseDeMots123!', 'Emp0000001'),
        ('MeCo000002', 789, 'Thibaudeau', 'Chicoutimi', 'H6D8T4', 'elwiiiise.Warin@hotmail.com', 74523895, 002, 'jaimelesChevaux34', 'Emp0000003'),
        ('MePh000001', 97,  'Monterergie', 'Montréal',  'H4H3F4', 'gevienve.trello@outlook.com', 43279123, 003, 'Anacondalandq12', 'Emp0000001'),
        ('MePh000002', 453, 'Justice', 'Sagueney',  'H7Y5G5', 'hohoho@gmail.com', 56743492, 002, '5boiledPotatoes', 'Emp0000002'),
        ('MePh000003', 845, 'Rose', 'Tadoussac', 'H8K2N3', 'maths4life@gmail.com', 43240754, 001, 'existanceIsPointless', 'Emp0000004'),
        ('MePh000004', 342, 'Harrow', 'Tadoussac', 'H7D1H1', 'lily.Mayer@gmail.com', 34322211, 001, 'JeSuisCute23', 'Emp0000004'),
        ('MeMo000001', 105,  'Narwhale',  'Montréal',   'H0G2S4', 'factures@genetec.com', 74927490, 003, 'GenetectTransport1', 'Emp0000001'), 
        ('MeMo000002', 78, 'Sentoriel',  'Sagueney',   'H5B9L1', 'factures@gyro.com', 35323111, 002, 'GyroBouge2', 'Emp0000002'),
        ('MeMo000003', 486, 'St-Exupery', 'Chicoutimi', 'H4J2H2', 'factures@stc.com', 28934432, 001, 'transportsPasPublics', 'Emp0000003');

INSERT INTO bdschema.MembreCooperative (mid, montant, nbParts)
VALUES  ('MeCo000001', 100, 10),
        ('MeCo000002', 450, 60);

INSERT INTO bdschema.PersonnePhysique (mid, age, dateDernierAccident, permisConduire, cotisationAnnuelle)
VALUES  ('MePh000001', 34, NULL, 'A3556-12352-43', 80), 
        ('MePh000002', 41, '2020-09-12', 'K9421-74621-08', 70),  
        ('MePh000003', 43, '2023-02-11', 'X3402-94639-23', 90),
        ('MePh000004', 18, '2021-09-12', 'U0378-03842-31', 90);

INSERT INTO bdschema.PersonneMorale (mid, cotisationAnnuelle)
VALUES  ('MeMo000001', 500),  -- prix de base pour une personne morale 
        ('MeMo000002', 500),
        ('MeMo000003', 500);

INSERT INTO bdschema.Reservation (numeroMembre, vehicule, emplacement, dateDebut, dateFin, heureDebut, heureFin, exigeancesSupp)
VALUES  ('MeCo000001', 'cami000001', 'Emp0000001', '2023-12-24', '2024-04-10', '10:00', '13:00', 'bluetooth'),
        ('MeCo000002', 'regu000002', 'Emp0000002', '2023-02-21', '2023-03-21', '11:00', '13:00', 'siege-auto'), 
        ('MePh000001', 'cami000002', 'Emp0000003', '2023-01-22', '2023-01-24', '12:00', '13:00', 'gps'),  --entre
        ('MePh000002', 'cami000002', 'Emp0000004', '2024-11-11', '2024-12-11', '17:00', '13:00', ''), --futur
        ('MePh000003', 'regu000003', 'Emp0000004', '2022-07-27', '2022-08-09', '13:00', '13:00', 'siege-auto'), --passe
        ('MePh000004', 'regu000002', 'Emp0000004', '2021-01-22', '2021-02-01', '13:00', '13:00', 'gps'), --passe
        ('MeMo000001', 'regu000004', 'Emp0000003', '2023-03-12', '2023-09-24', '13:00', '13:00', ''), --futur
        ('MeMo000002', 'hybr000001', 'Emp0000003', '2023-11-25', '2023-11-30', '13:00', '13:00', ''), -- futur
        ('MeMo000003', 'cami000001', 'Emp0000002', '2022-10-05', '2022-10-21', '13:00', '13:00', 'bluetooth'), --passe
        ('MePh000001', 'hybr000002', 'Emp0000002', '2023-05-01', '2023-05-06', '13:00', '13:00', 'bluetooth'), --futur
        ('MeMo000001', 'hybr000001', 'Emp0000001', '2024-03-18', '2024-03-27', '13:00', '13:00', 'gps'); --futur

-- FACTURE
INSERT INTO bdschema.Facture (fid, numeroMembre, estPaye, dateEcheance, dateFacturation)
VALUES  ('Fact000001', 'MeCo000001', FALSE, '2025-02-01', '2024-01-01'),
        ('Fact000002', 'MeCo000002', FALSE, '2024-02-01', '2023-01-01'),
        ('Fact000003', 'MePh000001', FALSE, '2024-02-01', '2023-01-01'),
        ('Fact000004', 'MePh000002', FALSE, '2025-02-01', '2024-01-01'),
        ('Fact000005', 'MePh000003', TRUE, '2023-02-01', '2022-01-01'),
        ('Fact000006', 'MePh000004', TRUE, '2022-02-01', '2021-01-01'),
        ('Fact000007', 'MeMo000001', FALSE, '2024-02-01', '2023-01-01'),
        ('Fact000008', 'MeMo000002', FALSE, '2024-02-01', '2023-01-01'),
        ('Fact000009', 'MeMo000003', TRUE, '2023-02-01', '2022-01-01'),
        ('Fact0000010', 'MeMo000001', FALSE, '2025-02-01', '2024-01-01'),
        ('Fact0000011', 'MePh000001', FALSE, '2024-02-01', '2023-01-01');
 
-- UTILISATION
INSERT INTO bdschema.Utilisation (numeroMembre, vehicule, numeroFacture, dateDebut, dateFin, nombreKillometres)
VALUES  ('MeCo000002', 'regu000002', 'Fact000002', '2023-02-21', '2023-03-21', 100), 
        ('MePh000001', 'cami000002', 'Fact000003', '2023-01-22', '2023-01-24', 200),  
        ('MePh000003', 'regu000003', 'Fact000005', '2022-07-27', '2022-08-09', 30), 
        ('MePh000004', 'regu000002', 'Fact000006', '2021-01-22', '2021-02-01', 40), 
        ('MeMo000001', 'regu000004', 'Fact000007', '2023-03-12', '2023-09-24', 50), 
        ('MeMo000003', 'cami000001', 'Fact000009', '2022-10-05', '2022-10-21', 90);        






