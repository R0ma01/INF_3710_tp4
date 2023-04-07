--1. Retournez la marque, le modèle et l’emplacement d’origine des véhicules
SELECT marque, modele, emplacement as emplacement_Origine FROM bdschema.Vehicule
WHERE emplacement IS NOT NULL;

--2. Retournez la marque, le modèle et l’emplacement d’origine des véhicules y compris les
--marques et modèles qui n’ont pas de localisation
SELECT marque, modele, emplacement as emplacement_Origine FROM bdschema.Vehicule;

--3. Retournez les emplacements sans véhicules (not working)
SELECT * 
FROM bdschema.Emplacement
WHERE eid not IN (  SELECT emplacement 
                    FROM bdschema.Vehicule 
                    WHERE emplacement IS NOT NULL);

--4. Retournez tous les véhicules dont le domicile est situé dans la ville de Montréal
SELECT * FROM bdschema.Vehicule
WHERE emplacement IN (
    SELECT eid 
    FROM bdschema.Emplacement 
    WHERE ville = 'Montréal'
);

--5. Retournez les emplacements et le nombre de voitures hybrides à chaque emplacement
SELECT emplacement, COUNT(vid) AS nombreHybride
FROM bdschema.Vehicule
WHERE vid IN (SELECT vid
			  FROM bdschema.hybrid
			 )
GROUP BY emplacement;

--6. Retournez les plaques d’immatriculation des véhicules qui ont été utilisés (pas seulement
--réservés)
SELECT immatriculation
FROM bdschema.Vehicule
WHERE vid IN (  SELECT vehicule 
				FROM bdschema.Utilisation);

--7. Retournez toutes les informations des membres (personnes physiques) vivant dans une
--ville avec un emplacement qui a des voitures hybrides
SELECT *
FROM bdschema.PersonnePhysique NATURAL JOIN bdschema.Membre 
WHERE ville IN (SELECT ville
				FROM bdschema.Vehicule v JOIN bdschema.Emplacement e
				ON v.emplacement = e.eid
				NATURAL JOIN bdschema.hybrid	
				GROUP BY ville
				);

--8. Retournez toutes les informations des véhicules à l’emplacement Montréal qui sont libres
--le 23/01/2023 à 10 h
SELECT *
FROM bdschema.Vehicule
WHERE vid NOT IN (
    SELECT vehicule 
    FROM bdschema.Reservation
    WHERE '2023-01-23' BETWEEN dateDebut AND DateFin 
	AND ('10:00' < heureFin OR '10:00' > heureDebut)
)
AND emplacement IS NOT NULL;

--9. Retournez les plaques d’immatriculation et le nombre de réservations de chaque véhicule
--(y compris ceux sans réservation, c’est-à-dire que le nombre de réservations est 0)
SELECT v.immatriculation, COUNT(r.vehicule) AS nombreReservation
FROM bdschema.Vehicule v, bdschema.Reservation r
WHERE r.vehicule = v.vid
group by v.immatriculation;

--10. Quel est le véhicule avec la consommation de carburant la plus élevée ?
SELECT *
FROM bdschema.Vehicule
WHERE consommationEssence = (SELECT MAX(consommationEssence) FROM bdschema.Vehicule);

--11. Retournez la consommation de carburant maximale, moyenne et minimale par catégorie
--de véhicule
SELECT 
    CASE
        WHEN v.vid LIKE 'hybr%' THEN 'Hybride'
        WHEN v.vid LIKE 'cami%' THEN 'Camionnette'
        WHEN v.vid LIKE 'regu%' THEN 'Régulier'
    END AS categorie,
    MAX(v.consommationEssence) AS consommation_max,
    MIN(v.consommationEssence) AS consommation_min,
    AVG(v.consommationEssence) AS consommation_moy
FROM bdschema.Vehicule v
LEFT JOIN bdschema.Hybrid ON v.vid = Hybrid.vid
LEFT JOIN bdschema.Regulier ON v.vid = Regulier.vid
LEFT JOIN bdschema.MiniCamionette ON v.vid = MiniCamionette.vid
WHERE v.vid LIKE 'hybr%' 
OR v.vid LIKE 'cami%' 
OR v.vid LIKE 'regu%'
GROUP BY categorie;


--12. Retournez tous les membres qui ont réservé un véhicule à un endroit autre que leur
--emplacement d’origine même si le type de véhicule existe à leur emplacement d’origine 

Select *
from bdschema.membre
where mid in 
(SELECT numeroMembre 
			 from bdschema.Reservation JOIN bdschema.Membre 
			  on bdschema.Reservation.numeroMembre = bdschema.Membre.mid
			  join bdschema.Vehicule
			  on vehicule = bdschema.vehicule.vid
			 where emplacementPrefere = emplacement) ;
