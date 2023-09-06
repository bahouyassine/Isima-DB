-- Requêtes SQL

-- 1.	Donner le nom des cours dans lequel intervient Gilles Leborgne.
-- 1e version
SELECT nomCours as 'Nom du Cours'
FROM (COURSENSEIGNANTS CE JOIN COURS C ON C.idCours = CE.idCours) JOIN ENSEIGNANT E ON CE.idEnseignant = E.idEnseignant 
WHERE nomEnseignant = 'Leborgne' and prenomEnseignant = 'Gilles';

-- 2e version
SELECT nomCours as 'Nom du Cours'
FROM COURSENSEIGNANTS JOIN COURS ON COURS.idCours = COURSENSEIGNANTS.idCours
WHERE idEnseignant in (SELECT idEnseignant
                       FROM ENSEIGNANT
                       WHERE nomEnseignant = 'Leborgne' and prenomEnseignant = 'Gilles');

-- 3e version
SELECT nomCours as 'Nom du Cours'
FROM COURS 
WHERE COURS.idCours in (SELECT idCours
                  FROM COURSENSEIGNANTS 
                  WHERE idEnseignant in (SELECT idEnseignant
                                         FROM ENSEIGNANT
                                         WHERE nomEnseignant = 'Leborgne' and prenomEnseignant = 'Gilles'));



-- 2.	Pour chaque cours (on affichera juste l’id), donner le nombre
-- d’intervenants et le nombre d’heures totales déclarées (CM+TD+TP),
-- uniquement s’il y a plus d’un intervenant.
SELECT C.idCours as 'Identifiant du cours', COUNT(idEnseignant) as 'Nombre d`intervenants', C.nbCM + C.nbTD + C.nbTP as 'Nombre d`heures totals déclarées'
FROM COURS C JOIN COURSENSEIGNANTS CE ON C.idCours = CE.idCours
GROUP BY C.idCours
HAVING COUNT(idEnseignant) > 1;



-- 3.	Pour chaque enseignant (on affichera le nom et le prénom),
-- donner le nombre de cours dans lequel il intervient (on mettra 0
-- s’il n’enseigne dans aucun cours pour le moment).
SELECT nomEnseignant, prenomEnseignant, COUNT(idCours)
FROM ENSEIGNANT E LEFT JOIN COURSENSEIGNANTS CE ON E.idEnseignant = CE.idEnseignant
GROUP BY E.idEnseignant
ORDER BY nomEnseignant;


-- 4.	Donner le nom et le prénom des enseignants qui enseignent
-- dans tous les niveaux.
SELECT nomEnseignant, prenomEnseignant
FROM ENSEIGNANT
WHERE idEnseignant IN (SELECT idEnseignant
                       FROM COURSENSEIGNANTS CE JOIN COURS C ON CE.idCours = C.idCours 
                       GROUP BY idEnseignant
                       HAVING COUNT( DISTINCT niveau) = (SELECT COUNT(niveau)
                                     FROM NIVEAU));