--1. Retournez la marque, le modèle et l’emplacement d’origine des véhicules
SELECT marque, modele, localisation FROM bdschema.Vehicule
WHERE localisation IS NOT NULL;

--2. Retournez la marque, le modèle et l’emplacement d’origine des véhicules y compris les
--marques et modèles qui n’ont pas de localisation
SELECT marque, modele, localisation FROM bdschema.Vehicule
WHERE localisation IS NOT NULL AND localisation IS NULL;

--3. Retournez les emplacements sans véhicules
SELECT * FROM bdschema.Emplacement
WHERE nombreVoitures IS 0;

--4. Retournez tous les véhicules dont le domicile est situé dans la ville de Montréal
SELECT * FROM bdschema.Vehicule
WHERE emplacement IS (
    SELECT eid 
    FROM bdschema.Emplacement 
    WHERE ville = 'Montreal'
);

--5. Retournez les emplacements et le nombre de voitures hybrides à chaque emplacement
SELECT emplacement COUNT(specifications) AS nopmbreHybride
FROM bdschema.Vehicule
WHERE specifications LIKE '%hybride%'
GROUP BY emplacement;


--6. Retournez les plaques d’immatriculation des véhicules qui ont été utilisés (pas seulement
--réservés)
SELECT immatriculation 
FROM bdschema.Reservation NATURAL JOIN bdschema.Vehicule
WHERE dateFin < current_date;

--7. Retournez toutes les informations des membres (personnes physiques) vivant dans une
--ville avec un emplacement qui a des voitures hybrides
SELECT *
FROM bdschema.PersonnePhysique
WHERE ville IS IN (
    SELECT ville 
    FROM bdschema.Emplacement
    WHERE eid IS IN (
        SELECT emplacement 
        FROM bdschema.Vehicule
        WHERE specifications IS LIKE '%hybride%'
        GROUP BY emplacement
    )
    GROUP BY ville
);

--8. Retournez toutes les informations des véhicules à l’emplacement Montréal qui sont libres
--le 23/01/2023 à 10 h
SELECT *
FROM bdschema.Vehicule
WHERE vid IS IN (
    SELECT vehicule 
    FROM bdschema.Reservation
    WHERE '2023-01-23 10:00:00' NOT BETWEEN dateDebut AND DateFin
);

--9. Retournez les plaques d’immatriculation et le nombre de réservations de chaque véhicule
--(y compris ceux sans réservation, c’est-à-dire que le nombre de réservations est 0)
SELECT immatriculation COUNT(vehicule) 
FROM bdschema.Reservation RIGHT OUTER JOIN bdschema.Vehicule
GROUP BY immatriculation;

--10. Quel est le véhicule avec la consommation de carburant la plus élevée ?
SELECT *
FROM bdschema.Vehicule
WHERE MAX(consommation);

--11. Retournez la consommation de carburant maximale, moyenne et minimale par catégorie
--de véhicule
SELECT marque MAX(consommation) MIN(consommation) AVG(consommation)
FROM bdschema.Vehicule 
WHERE ????


--12. Retournez tous les membres qui ont réservé un véhicule à un endroit autre que leur
--emplacement d’origine même si le type de véhicule existe à leur emplacement d’origine 

