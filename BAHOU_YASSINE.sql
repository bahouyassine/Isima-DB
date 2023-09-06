-- Définition du moteur de base de données
SET default_storage_engine=InnoDB;

-- Création de la base de données
DROP DATABASE IF EXISTS BAHOU_YASSINE;
CREATE DATABASE BAHOU_YASSINE;
USE BAHOU_YASSINE;

-- Structure de la table `ENSEIGNANT`
CREATE TABLE ENSEIGNANT(
  idEnseignant varchar(20),
  nomEnseignant varchar(30),
  prenomEnseignant varchar(30),
  type_enseignant varchar(10),
  statut varchar(30),
  organisme varchar(50),
  PRIMARY KEY(idEnseignant)
);

-- Structure de la table `FILIERE`
CREATE TABLE FILIERE(
  noFiliere int(2),
  nomFiliere varchar(100),
  resp1Filiere varchar(20),
  resp2Filiere varchar(20),
  PRIMARY KEY(noFiliere),
  FOREIGN KEY(resp1Filiere) REFERENCES ENSEIGNANT(idEnseignant),
  FOREIGN KEY(resp2Filiere) REFERENCES ENSEIGNANT(idEnseignant)
);

-- Structure de la table `NIVEAU`
CREATE TABLE NIVEAU(
  niveau varchar(3),
  respNiveau varchar(20),
  PRIMARY KEY(niveau),
  FOREIGN KEY(respNiveau) REFERENCES ENSEIGNANT(idEnseignant)
);

-- Structure de la table `COURS`
CREATE TABLE COURS(
  idCours varchar(20),
  nomCours varchar(50),
  niveau varchar(3),
  respCours varchar(20),
  TC varchar(15),
  nbCM int(2),
  nbTD int(2),
  nbTP int(2),
  PRIMARY KEY(idCours),
  FOREIGN KEY(respCours) REFERENCES ENSEIGNANT(idEnseignant),
  FOREIGN KEY(niveau) REFERENCES NIVEAU(niveau)
);

-- Structure de la table `SYLLABUS`
CREATE TABLE SYLLABUS(
  idCours varchar(20),
  nomCoursAnglais varchar(50),
  objectifDuCours varchar(1000),
  descriptif varchar(1000),
  PRIMARY KEY(idCours)
);

-- Structure de la table `ENSEIGNEMENT_COURS`
CREATE TABLE COURSENSEIGNANTS(
  idCours varchar(20),
  idEnseignant varchar(20),
  nbCM int(2),
  nbTD int(2), 
  nbTP int(2),
  PRIMARY KEY(idCours, idEnseignant),
  FOREIGN KEY(idCours) REFERENCES COURS(idCours),
  FOREIGN KEY(idEnseignant) REFERENCES ENSEIGNANT(idEnseignant)
);

-- Structure de la table `COURSFILIERE`
CREATE TABLE COURSFILIERES(
  idCours varchar(20),
  noFiliere int(2),
  PRIMARY KEY(idCours, noFiliere),
  FOREIGN KEY(idCours) REFERENCES COURS(idCours),
  FOREIGN KEY(noFiliere) REFERENCES FILIERE(noFiliere)
);

-- Insertion dans la table 'ENSEIGNANT'.
INSERT INTO `ENSEIGNANT` VALUES('jeverdier', 'VERDIER', 'Jean-Michel', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('memiln', 'MILN', 'Megane', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('mablanchet', 'BLANCHET', 'Maxens', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('magarcia', 'GARCIA', 'Marie-Béatrice', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('frgodeart', 'GODEART', 'France', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('yizheng', 'ZHENG', 'Yin', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('aychinonakano', 'CHINO NAKANO', 'Aya', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('mysimona', 'SIMONA', 'Myriame', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('mykang', 'KANG', 'Myoung-Ah', 'Permanent', 'PRCE', NULL);
INSERT INTO `ENSEIGNANT` VALUES('daferney', 'FERNEY', 'Damien', 'Exterieur', NULL, 'CLMSLF');
INSERT INTO `ENSEIGNANT` VALUES('mabouet', 'BOUET', 'Marinette', 'Permanent', 'PRCE', NULL);
INSERT INTO `ENSEIGNANT` VALUES('bealbert', 'ALBERT', 'Benoit', 'Permanent', 'PRCE', NULL);

INSERT INTO `ENSEIGNANT` VALUES('chblanc', 'BLANC', 'Christophe', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('hupeytavin', 'PEYTAVIN', 'Hugues', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('viantoine', 'ANTOINE', 'Violaine', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('arsusan', 'ARBON-LEAHY', 'Susan', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('roaufrere', 'AUFRERE', 'Romuald', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('vibarra', 'BARRA', 'Vincent', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('fabendali', 'BENDALI', 'Fatiha', 'Permanent', 'MCU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('michabrol', 'CHABROL', 'Michelle', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('micheminant', 'CHEMINAT', 'Michel', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('amchofri', 'CHOFRI', 'Amina', 'Permanent', 'ATER', NULL);
INSERT INTO `ENSEIGNANT` VALUES('clmazel', 'MAZEL', 'Claude', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('yvesdaniel', 'DANIEL', 'Yves-Jean', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('jegayon', 'GAYON', 'Jean-Philippe', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('brguillon', 'GUILLON', 'Bruno', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('alguiton', 'GUITTON', 'Alexandre', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('evhassinger', 'HASSINGER', 'Eva', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('dahill', 'HILL', 'David', 'Permanent', 'MCU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('makante', 'KANTE', 'Mamadou', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('hekerivin', 'KERIVIN', 'Herve', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('jokoko', 'KOKO', 'Jonas', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('aulagoutte', 'LAGOUTTE', 'Aurelie', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('chlaforest', 'LAFOREST', 'Christian', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('phlacomme', 'LACOMME', 'Philippe', 'Permanent', 'MCU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('gileborgne', 'LEBORGNE', 'Gilles', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('jjli', 'LI', 'Jian-Jin', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('yaloiseau', 'LOISEAU', 'Yannick', 'Permanent', 'MCU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('emmesnard', 'MESNARD', 'Emmanuel', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('palaurencot', 'LAURENCOT', 'Patrice', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('ramedina', 'MEDINA', 'Raoul', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('enmephunguifo', 'MEPHU NGUIFO', 'Engelbert', 'Permanent', 'MCU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('mumouzat', 'MOUZAT', 'Murielle', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('vietnguyen', 'NGUYEN', 'Viet-Hung', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('lhnourine', 'NOURINE', 'Lhouari', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('mapailloux', 'PAILLOUX', 'Marie', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('lupastor', 'PASTOR', 'Lucas', 'Permanent', 'MCU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('alpereda', 'PEREDA', 'Alexis', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('olraynaud', 'RAYNAUD', 'Olivier', 'Permanent', 'MCU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('chtilmant', 'TILMANT', 'Christophe', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('loyon', 'YON', 'Loic', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('edcouet', 'COUET', 'Edith', 'Exterieur', NULL, 'MICHELIN');
INSERT INTO `ENSEIGNANT` VALUES('jemaurin', 'MAURIN', 'Jean-Michel', 'Exterieur', NULL, 'IAE');
INSERT INTO `ENSEIGNANT` VALUES('frcassiere', 'CASSIERE', 'François', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('molefevre', 'LEFEVRE', 'Monique', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('papinault', 'PINAULT', 'Paul', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('aumonbelli', 'MONBELLI', 'Aurelien', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('mealbaret', 'ALBARET', 'Mélanie', 'Exterieur', NULL, 'Ecole de Droit');
INSERT INTO `ENSEIGNANT` VALUES('jolaconte', 'LACONTE', 'Johann', 'Permanent','PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('ceteuliere', 'TEULIERE', 'Céline', 'Exterieur', NULL, 'EUPI');
INSERT INTO `ENSEIGNANT` VALUES('jevial', 'VIAL', 'Jérémy', 'Exterieur', NULL, 'Société Witeko');
INSERT INTO `ENSEIGNANT` VALUES('malabussiere', 'Labussiere', 'Mathieu', 'Exterieur', NULL, 'Société Witeko');

INSERT INTO `ENSEIGNANT` VALUES('jolaffont', 'LAFFONT', 'Joel', '', NULL, 'MICHELIN');
INSERT INTO `ENSEIGNANT` VALUES('lebreuil', 'BREUIL', 'Leo', 'Exterieur', NULL, 'MICHELIN');
INSERT INTO `ENSEIGNANT` VALUES('odgoutet', 'GOUTET', 'Odile', 'Exterieur', NULL, 'OPENIUM');
INSERT INTO `ENSEIGNANT` VALUES('boroziere', 'ROZIERE', 'Boris', 'Exterieur', NULL, 'Société OV Corporation');
INSERT INTO `ENSEIGNANT` VALUES('pafraustot', 'FRAUSTOT', 'Paul', 'Exterieur', NULL, 'MICHELIN');
INSERT INTO `ENSEIGNANT` VALUES('jofontanel', 'FONTANEL', 'Jonathan', 'Exterieur', NULL, 'CARINA CONSULTING');
INSERT INTO `ENSEIGNANT` VALUES('kafarias', 'KARIN', 'Farias', 'Exterieur', NULL, 'SIGMA');
INSERT INTO `ENSEIGNANT` VALUES('odcoupelon', 'COUPELON', 'Odile', 'Exterieur', NULL, 'COFFREO');
INSERT INTO `ENSEIGNANT` VALUES('pacolomb', 'COLOMB', 'Patrice', 'Exterieur', NULL, 'IP LEARNWARE');
INSERT INTO `ENSEIGNANT` VALUES('rojacquelin', 'JACQUELIN', 'Rose', 'Exterieur','PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('anwagler', 'WAGLER', 'Annegret', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('pibeaurepaire', 'BEAUREPAIRE', 'Pierre', 'Exterieur', NULL, 'SIGMA');
INSERT INTO `ENSEIGNANT` VALUES('lasabourin', 'SABOURIN', 'Laurent', 'Exterieur', NULL, 'SIGMA');
INSERT INTO `ENSEIGNANT` VALUES('rasilveiracosta', 'SILVEIRA COSTA', 'Raul', 'Exterieur', NULL, 'Société DATALYO');
INSERT INTO `ENSEIGNANT` VALUES('daraynaud', 'RAYNAUD', 'Daniel', 'Exterieur', NULL, 'CAP GEMINI');
INSERT INTO `ENSEIGNANT` VALUES('anmahul', 'MAHUL', 'Antoinne', 'Exterieur', NULL, 'DSI UCA');
INSERT INTO `ENSEIGNANT` VALUES('cadioudonnat', 'DIOUDONNAT', 'Carine', 'Exterieur', NULL, 'BE/YS');
INSERT INTO `ENSEIGNANT` VALUES('axroux', 'ROUX', 'Axelle', 'Exterieur', NULL, 'CGI');
INSERT INTO `ENSEIGNANT` VALUES('frberry', 'BERRY', 'François', 'Exterieur', NULL, 'Institut PASCAL');
INSERT INTO `ENSEIGNANT` VALUES('dasauveron', 'SAUVERON', 'David', 'Exterieur', 'Exterieur', 'Université de Limoges');
INSERT INTO `ENSEIGNANT` VALUES('rofaury', 'FAURY', 'Romain', 'Exterieur', NULL, 'ADOBE');
INSERT INTO `ENSEIGNANT` VALUES('lamalatere', 'MALATERE', 'Laurent', 'Exterieur', NULL, 'Institu Pascal');
INSERT INTO `ENSEIGNANT` VALUES('vimazenod', 'MAZENOD', 'Vincent', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('Radubourgnoux', 'DUBOURGNOUX', 'Raymond', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('Brmarquet', 'MARQUET', 'Brice', 'Permanent', 'PRAG', NULL);
INSERT INTO `ENSEIGNANT` VALUES('gighalhoub', 'GHALHOUB', 'Gilles', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('anplantin', 'PLANTIN', 'Anthony', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('Jausson', 'USSON', 'Jacques', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('jegagnet', 'GAGNET', 'Jean', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('pachevillot', 'CHEVILLOT', 'Paul Louis', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('Thlefaure', 'LEFAURE', 'Theo', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('tajouve', 'JOUVE', 'Tamia', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('molaurent', 'LAURENT', 'Moise', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('becaure', 'CAURE', 'Bettina', 'Permanent', 'PU', NULL);
INSERT INTO `ENSEIGNANT` VALUES('marobin', 'ROBIN', 'Maria', 'Permanent', 'PU', NULL);

-- Insertion dans la table 'FILIERE'.
INSERT INTO `FILIERE` VALUES('1', 'Informatique des systèmes interactifs pour l’embarqué, la robotique et le virtuel', 'makante', NULL);
INSERT INTO `FILIERE` VALUES('2', 'Génie Logiciel et Systèmes Informatiques', 'loyon', NULL);
INSERT INTO `FILIERE` VALUES('3', 'Systèmes d''inormations et aide à la décision', 'phlacomme', NULL);
INSERT INTO `FILIERE` VALUES('4', 'Modélisation mathématiques et Science des Données', 'viantoine', NULL);
INSERT INTO `FILIERE` VALUES('5', 'Réseaux et Sécurité Informatique', 'chtilmant', 'micheminant');

-- Insertion dans la table 'NIVEAU'.
INSERT INTO `NIVEAU` VALUES('ZZ1', 'clmazel');
INSERT INTO `NIVEAU` VALUES('ZZ2', 'palaurencot');
INSERT INTO `NIVEAU` VALUES('ZZ3', 'mapailloux');

-- Insertion dans la table 'COURS'
-- Cours de ZZ1
INSERT INTO `COURS` VALUES('ZZ1LV1Angl', 'Anglais', 'ZZ1', 'arsusan', 'Tronc Commun',0,0,26);
INSERT INTO `COURS` VALUES('ZZ1LV2All', 'Allemand', 'ZZ1', 'evhassinger', 'Tronc Commun',0,0,26);
INSERT INTO `COURS` VALUES('ZZ1LV2Esp', 'Espagnol', 'ZZ1', 'frgodeart', 'Tronc Commun',0,0,26);
INSERT INTO `COURS` VALUES('ZZ1LV2Jap', 'Japonais', 'ZZ1', 'aychinonakano', 'Tronc Commun',0,0,26);
INSERT INTO `COURS` VALUES('ZZ1LV2chi', 'Chinois', 'ZZ1', 'yizheng', 'Tronc Commun',0,0,26);
INSERT INTO `COURS` VALUES('ZZ1LV2ita', 'Italien', 'ZZ1', 'mysimona', 'Tronc Commun',0,0,26);
INSERT INTO `COURS` VALUES('ZZ1shscomm', 'Expression et communication', 'ZZ1', 'mumouzat', 'Tronc Commun',0,0,22);
INSERT INTO `COURS` VALUES('ZZ1manage', 'Management et organisation des entreprises', 'ZZ1', 'frcassiere', 'Tronc Commun',26,0,0);

INSERT INTO `COURS` VALUES('infolangc', 'Langage C', 'ZZ1', 'loyon', 'Tronc Commun',0,32,40);
INSERT INTO `COURS` VALUES('infoalgo', 'Algorithmique et structures de données', 'ZZ1', 'michabrol', 'Tronc Commun',0,70,0);
INSERT INTO `COURS` VALUES('infoprogfonc', 'Programmation fonctionnelle', 'ZZ1', 'yvesdaniel', 'Tronc Commun',0,12,14);
INSERT INTO `COURS` VALUES('infoautom', 'Automates', 'ZZ1', 'clmazel', 'Tronc Commun',0,26,0);
INSERT INTO `COURS` VALUES('infocybersecu', 'Sensibilisation à la cybersécurité', 'ZZ1', 'palaurencot', 'Tronc Commun',22,0,6);
INSERT INTO `COURS` VALUES('infosysexpl', 'Systèmes d''exploitation', 'ZZ1', 'brguillon', 'Tronc Commun',12,0,8);
INSERT INTO `COURS` VALUES('infobdd', 'Bases de données', 'ZZ1', 'mapailloux', 'Tronc Commun',0,20,8);

INSERT INTO `COURS` VALUES('siphys', 'Physique des semi-conducteurs', 'ZZ1', 'edcouet', 'Tronc Commun',0,26,20);
INSERT INTO `COURS` VALUES('sitransmdo', 'Transmission de données', 'ZZ1', 'chtilmant', 'Tronc Commun',0,26,24);
INSERT INTO `COURS` VALUES('sitraitsignal', 'Traitement du signal', 'ZZ1', 'chtilmant', 'Tronc Commun',0,26,0);
INSERT INTO `COURS` VALUES('sicsn', 'Conception des systemes numeriques', 'ZZ1', 'emmesnard', 'Tronc Commun',0,26,10);
INSERT INTO `COURS` VALUES('siautomat', 'Automatique', 'ZZ1', 'roaufrere', 'Tronc Commun',0,26,0);

INSERT INTO `COURS` VALUES('mathstg', 'Théorie des graphes', 'ZZ1', 'chlaforest', 'Tronc Commun',0,26,10);
INSERT INTO `COURS` VALUES('mathsproba', 'Probabilités', 'ZZ1', 'clmazel', 'Tronc Commun',0,26,0);
INSERT INTO `COURS` VALUES('mathsanalnum', 'Analyse numerique', 'ZZ1', 'vibarra', 'Tronc Commun',0,26,10);
INSERT INTO `COURS` VALUES('mathscalcul', 'Calcul différentiel', 'ZZ1', 'gileborgne', 'Tronc Commun',0,26,0);
INSERT INTO `COURS` VALUES('mathsproglineaire', 'Programmation linéaire', 'ZZ1', 'hekerivin', 'Tronc Commun',0,26,0);
INSERT INTO `COURS` VALUES('mathsanaldonnées', 'Analyse de données', 'ZZ1', 'viantoine', 'Tronc Commun',0,14,0);

-- Cours de ZZ2
-- Tronc Commun
INSERT INTO `COURS` VALUES('ZZ2TCLV1Angl', 'Anglais', 'ZZ2', 'arsusan', 'Tronc Commun',0,0,40);
INSERT INTO `COURS` VALUES('ZZ2TCLV2All', 'Allemand', 'ZZ2', 'evhassinger', 'Tronc Commun',0,0,40);
INSERT INTO `COURS` VALUES('ZZ2TCLV2Esp', 'Espagnol', 'ZZ2', 'frgodeart', 'Tronc Commun',0,0,40);
INSERT INTO `COURS` VALUES('ZZ2TCLV2Jap', 'Japonais', 'ZZ2', 'aychinonakano', 'Tronc Commun',0,0,40);
INSERT INTO `COURS` VALUES('ZZ2TCLV2chi', 'Chinois', 'ZZ2', 'yizheng', 'Tronc Commun',0,0,40);
INSERT INTO `COURS` VALUES('ZZ2TCLV2ita', 'Italien', 'ZZ2', 'mysimona', 'Tronc Commun',0,0,40);
INSERT INTO `COURS` VALUES('ZZ2TCshscomm', 'Expression et communication', 'ZZ2', 'mumouzat', 'Tronc Commun',0,0,16);
INSERT INTO `COURS` VALUES('ZZ2TCshsdroit', 'Droit', 'ZZ2', 'mealbaret', 'Tronc Commun',16,0,0);
INSERT INTO `COURS` VALUES('ZZ2TCshsgestion', 'Gestion', 'ZZ2', 'jemaurin', 'Tronc Commun',20,0,0);
INSERT INTO `COURS` VALUES('ZZ2TCshsprojet', 'Conduite de projet', 'ZZ2', 'molefevre', 'Tronc Commun',6,0,10);
INSERT INTO `COURS` VALUES('ZZ2TCcplus', 'C++', 'ZZ2', 'loyon', 'Tronc Commun',20,0,20);
INSERT INTO `COURS` VALUES('ZZ2TCuml', 'UML', 'ZZ2', 'aumonbelli', 'Tronc Commun',10,0,8);
INSERT INTO `COURS` VALUES('ZZ2TCjava', 'JAVA', 'ZZ2', 'loyon', 'Tronc Commun',0,0,20);
INSERT INTO `COURS` VALUES('ZZ2TCiot', 'I.O.T', 'ZZ2', 'papinault', 'Tronc Commun',12,0,0);
INSERT INTO `COURS` VALUES('ZZ2TCreseau', 'Réseaux', 'ZZ2', 'palaurencot', 'Tronc Commun',10,0,10);

-- F1
INSERT INTO `COURS` VALUES('ZZ2F1liembarque', 'Linux embarqué', 'ZZ2', 'jolaconte', 'Filiere',0,10,20);
INSERT INTO `COURS` VALUES('ZZ2F1sysembarque', 'Systèmes embarqués', 'ZZ2', 'emmesnard', 'Filiere',0,30,0);
INSERT INTO `COURS` VALUES('ZZ2F1semsysexembarque', 'Séminaire Systèmes d''Exploitation Embarqués', 'ZZ2', 'jevial', 'Filiere',0,18,0);
INSERT INTO `COURS` VALUES('ZZ2F1archiavancée', 'Architecture avancée', 'ZZ2', 'emmesnard', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F1capteurs', 'Capteurs', 'ZZ2', 'edcouet', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F1design', 'Design', 'ZZ2', 'micheminant', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F1traitnumdusign', 'Traitement Numérique du Signal', 'ZZ2', 'jolaconte', 'Filiere',0,8,12);
INSERT INTO `COURS` VALUES('ZZ2F1trdonnsecu', 'Transmission de données sécurisée', 'ZZ2', 'micheminant', 'Filiere',8,0,12);
INSERT INTO `COURS` VALUES('ZZ2F1imagvisio', 'Imagerie vision', 'ZZ2', 'ceteuliere', 'Filiere',10,0,10);
INSERT INTO `COURS` VALUES('ZZ2F1robot', 'Robotique', 'ZZ2', 'roaufrere', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ2F1realvirtuelle', 'Réalité Virtuelle', 'ZZ2', 'emmesnard', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F1realvimersive', 'Réalité Immersive', 'ZZ2', 'emmesnard', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ2F1cyberautomatique', 'Cybernétique Automatique', 'ZZ2', 'roaufrere', 'Filiere',0,10,10);

-- F2
INSERT INTO `COURS` VALUES('ZZ2F2sysexps', 'Systèmes d''exploitation : Programmation système', 'ZZ2', 'jegagnet', 'Filiere',10,0,10);
INSERT INTO `COURS` VALUES('ZZ2F2swnet', 'Services Web .NET C#', 'ZZ2', 'pachevillot', 'Filiere',0,30,0);
INSERT INTO `COURS` VALUES('ZZ2F2ergdesihm', 'Ergonomie des IHM', 'ZZ2', 'marobin', 'Filiere',0,18,0);
INSERT INTO `COURS` VALUES('ZZ2F2devnet', 'Développement .NET C#', 'ZZ2', 'molaurent', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ2F2devappweb', 'Développement d''applications Web', 'ZZ2', 'becaure', 'Filiere',0,15,15);
INSERT INTO `COURS` VALUES('ZZ2F2archlogqual', 'Architectures logicielles et qualité', 'ZZ2', 'dahill', 'Filiere',8,0,12);
INSERT INTO `COURS` VALUES('ZZ2F2simu', 'Simulation', 'ZZ2', 'dahill', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ2F2outilsad', 'Outils d''aide à la décision', 'ZZ2', 'phlacomme', 'Filiere',20,0,16);
INSERT INTO `COURS` VALUES('ZZ2F2cdprojet', 'Conduite de projets web ', 'ZZ2', 'tajouve', 'Filiere',0,18,0);
INSERT INTO `COURS` VALUES('ZZ2F2ddbdd', 'Développement de bases de données', 'ZZ2', 'mapailloux', 'Filiere',10,0,10);
INSERT INTO `COURS` VALUES('ZZ2F2setsi', 'Sécurité et systèmes d''information', 'ZZ2', 'Thlefaure', 'Filiere',16,0,0);

-- F3
INSERT INTO `COURS` VALUES('ZZ2F3setsi', 'Sécurité et systèmes d''Information', 'ZZ2', 'Thlefaure', 'Filiere',16,0,0);
INSERT INTO `COURS` VALUES('ZZ2F3odmsien', 'Outil de développement mobile pour le SI de l''entreprise ', 'ZZ2', 'odgoutet', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F3aletq', 'Architectures logicielles et qualités', 'ZZ2', 'dahill', 'Filiere',8,0,12);
INSERT INTO `COURS` VALUES('ZZ2F3devweb', 'Développement Web', 'ZZ2', 'becaure', 'Filiere',0,6,10);
INSERT INTO `COURS` VALUES('ZZ2F3ddbdd', 'Développement de Bases de Données', 'ZZ2', 'mapailloux', 'Filiere',10,0,10);
INSERT INTO `COURS` VALUES('ZZ2F3fdbdd', 'Fondements des Bases de Données', 'ZZ2', 'mapailloux', 'Filiere',0,30,0);
INSERT INTO `COURS` VALUES('ZZ2F3simuafluxd', 'Simulation à flux discrets', 'ZZ2', 'phlacomme', 'Filiere',0,18,24);
INSERT INTO `COURS` VALUES('ZZ2F3modpralea', 'Modélisation des processus aléatoires ', 'ZZ2', 'jegayon', 'Filiere',18,0,0);
INSERT INTO `COURS` VALUES('ZZ2F3analfdd', 'Analyse et fouille de données', 'ZZ2', 'mapailloux', 'Filiere',0,20,20);
INSERT INTO `COURS` VALUES('ZZ2F3oad', 'Outils d''aide à la décision', 'ZZ2', 'phlacomme', 'Filiere',20,0,16);
INSERT INTO `COURS` VALUES('ZZ2F3rechoper', 'Recherche Opérationnelle', 'ZZ2', 'phlacomme', 'Filiere',0,12,12);

-- F4
INSERT INTO `COURS` VALUES('ZZ2F4modpralea', 'Modélisation des processus aléatoires', 'ZZ2', 'jegayon', 'Filiere',18,0,0);
INSERT INTO `COURS` VALUES('ZZ2F4apstat', 'Apprentissage statistique', 'ZZ2', 'vibarra', 'Filiere',0,24,0);
INSERT INTO `COURS` VALUES('ZZ2F4efinis', 'Eléments finis', 'ZZ2', 'gileborgne', 'Filiere',0,40,0);
INSERT INTO `COURS` VALUES('ZZ2F4intedist', 'Intégration et Distributions', 'ZZ2', 'gileborgne', 'Filiere',0,40,0);
INSERT INTO `COURS` VALUES('ZZ2F4rechoper', 'Recherche Opérationnelle', 'ZZ2', 'anwagler', 'Filiere',0,34,4);
INSERT INTO `COURS` VALUES('ZZ2F4stat', 'Statistiques', 'ZZ2', 'viantoine', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F4optim', 'Optimisation', 'ZZ2', 'jokoko', 'Filiere',0,12,0);
INSERT INTO `COURS` VALUES('ZZ2F4bddetfdd', 'Bases de données et fouille de données', 'ZZ2', 'mapailloux', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F4imagvisio', 'Imagerie Vision ', 'ZZ2', 'ceteuliere', 'Filiere',10,0,10);
INSERT INTO `COURS` VALUES('ZZ2F4mecasolid', 'Mécanique du solide', 'ZZ2', 'pibeaurepaire', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F4mddifffini', 'Méthodes de différences finies', 'ZZ2', 'jokoko', 'Filiere',0,16,0);
INSERT INTO `COURS` VALUES('ZZ2F4matlab', 'Matlab', 'ZZ2', 'jokoko', 'Filiere',0,0,20);

-- F5
INSERT INTO `COURS` VALUES('ZZ2F5certifindu', 'Certification industrielle', 'ZZ2', 'palaurencot', 'Filiere',0,12,0);
INSERT INTO `COURS` VALUES('ZZ2F5secprotres', 'Sécurisation des protocoles réseaux', 'ZZ2', 'palaurencot', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F5sysexps', 'Systèmes d''exploitation : Programmation système', 'ZZ2', 'jegagnet', 'Filiere',10,0,10);
INSERT INTO `COURS` VALUES('ZZ2F5swnet', 'Services Web .NET C#', 'ZZ2', 'pachevillot', 'Filiere',0,30,0);
INSERT INTO `COURS` VALUES('ZZ2F5cloud', 'Cloud', 'ZZ2', 'anplantin', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F5intcwebd', 'Intégration continue pour le web', 'ZZ2', 'jausson', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F5secuweb', 'Sécurité Web', 'ZZ2', 'vimazenod', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F5analmalw', 'Analyse de malware - Rétroingénierie', 'ZZ2', 'Brmarquet', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F5secuoc', 'Sécurité des objets connectés', 'ZZ2', 'chtilmant', 'Filiere',0,40,0);
INSERT INTO `COURS` VALUES('ZZ2F5sasr', 'Sécurisation active des systèmes en réseau', 'ZZ2', 'gighalhoub', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F5pentest', 'Tests d''intrusion (pentest)', 'ZZ2', 'Radubourgnoux', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ2F5trdonnsecu', 'Transmission de données sécurisée', 'ZZ2', 'micheminant', 'Filiere',8,0,12);

-- Cours de ZZ3
-- Tron Commun
INSERT INTO `COURS` VALUES('ZZ3TCLV1Angl', 'Anglais', 'ZZ3', 'arsusan', 'Tronc Commun',0,0,20);
INSERT INTO `COURS` VALUES('ZZ3TCLV2All', 'Allemand', 'ZZ3', 'evhassinger', 'Tronc Commun',0,0,20);
INSERT INTO `COURS` VALUES('ZZ3TCLV2Esp', 'Espagnol', 'ZZ3', 'frgodeart', 'Tronc Commun',0,0,20);
INSERT INTO `COURS` VALUES('ZZ3TCLV2Jap', 'Japonais', 'ZZ3', 'aychinonakano', 'Tronc Commun',0,0,20);
INSERT INTO `COURS` VALUES('ZZ3TCLV2chi', 'Chinois', 'ZZ3', 'yizheng', 'Tronc Commun',0,0,20);
INSERT INTO `COURS` VALUES('ZZ3TCLV2ita', 'Italien', 'ZZ3', 'mysimona', 'Tronc Commun',0,0,20);
INSERT INTO `COURS` VALUES('ZZ3TCshscomm', 'Expression et communication et management des ressources humaines', 'ZZ3', 'mumouzat', 'Tronc Commun',10,0,20);
INSERT INTO `COURS` VALUES('ZZ3TCshsdroit', 'Droit', 'ZZ3', 'mealbaret', 'Tronc Commun',14,0,0);
INSERT INTO `COURS` VALUES('ZZ3TCinteconomique', 'Intelligence économique', 'ZZ3', 'micheminant', 'Tronc Commun',10,0,0);
INSERT INTO `COURS` VALUES('ZZ3TCeddd', 'Ethique, déontologie et developpement durable', 'ZZ3', 'dahill', 'Tronc Commun',20,0,0);
INSERT INTO `COURS` VALUES('ZZ3managproj', 'Management de Projet', 'ZZ3', 'mapailloux', 'Tronc Commun',0,20,0);

-- F1
INSERT INTO `COURS` VALUES('ZZ3F1pam', 'Programmation d''applications mobiles', 'ZZ3', 'odgoutet', 'Filiere',6,10,24);
INSERT INTO `COURS` VALUES('ZZ3F1sse', 'Sécurité des systèmes embarqués ', 'ZZ3', 'dasauveron', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ3F1pFPGAVHDL', 'Programmation FPGA - VHDL', 'ZZ3', 'frberry', 'Filiere',0,30,0);
INSERT INTO `COURS` VALUES('ZZ3F1ptr', 'Programmation temps réel', 'ZZ3', 'jolaffont', 'Filiere',0,10,20);
INSERT INTO `COURS` VALUES('ZZ3F1prGPGPU', 'Programmation GPGPU', 'ZZ3', 'rofaury', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F1ram', 'Réalité augmentée et mixte', 'ZZ3', 'ceteuliere', 'Filiere',0,30,0);
INSERT INTO `COURS` VALUES('ZZ3F1ga', 'Géométrie algorithmique', 'ZZ3', 'makante', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F1icr', 'Intégration capteurs pour la robotique', 'ZZ3', 'lamalatere', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F1cc', 'Capteurs Communicants', 'ZZ3', 'micheminant', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ3F1rm', 'Robotique mobile', 'ZZ3', 'roaufrere', 'Filiere',0,20,10);

-- F2
INSERT INTO `COURS` VALUES('ZZ3F2secureseaux', 'Sécurité réseaux', 'ZZ3', 'palaurencot', 'Filiere',6,0,8);
INSERT INTO `COURS` VALUES('ZZ3F2conceparchi', 'Conception Architecture API Web/Client JS', 'ZZ3', 'cadioudonnat', 'Filiere',0,18,18);
INSERT INTO `COURS` VALUES('ZZ3F2pam', 'Programmation d''applications mobiles (PAM)', 'ZZ3', 'odgoutet', 'Filiere',6,0,24);
INSERT INTO `COURS` VALUES('ZZ3F2imsimul', 'Ingénierie des Modèles et Simulation', 'ZZ3', 'dahill', 'Filiere',0,12,12);
INSERT INTO `COURS` VALUES('ZZ3F2algocparall', 'Algorithmique pour le calcul parallèle', 'ZZ3', 'jokoko', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ3F2prgcc', 'Grilles de Calcul et Cloud', 'ZZ3', 'anmahul', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F2ram', 'Apprentissage profond', 'ZZ3', 'vibarra', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F2infograph', 'Infographie', 'ZZ3', 'pacolomb', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ3F2algoaad', 'Algorithmique de l''aide à la décision', 'ZZ3', 'dahill', 'Filiere',0,16,0);
INSERT INTO `COURS` VALUES('ZZ3F2flog', 'Forges logicielles', 'ZZ3', 'daraynaud', 'Filiere',8,0,12);
INSERT INTO `COURS` VALUES('ZZ3F2rm', 'Database Management', 'ZZ3', 'brguillon', 'Filiere',12,0,12);
INSERT INTO `COURS` VALUES('ZZ3F2javaprof', 'Java Professionnel', 'ZZ3', 'axroux', 'Filiere',0,10,10);

-- F3
INSERT INTO `COURS` VALUES('ZZ3F3mgicl', 'Modélisation et Gestion intégrée de la chaîne logistique ', 'ZZ3', 'phlacomme', 'Filiere',0,34,0);
INSERT INTO `COURS` VALUES('ZZ3F3oracleapp', 'Oracle Applications', 'ZZ3', 'mapailloux', 'Filiere',0,12,0);
INSERT INTO `COURS` VALUES('ZZ3F3pam', 'Business Intelligence', 'ZZ3', 'jofontanel', 'Filiere',0,20,20);
INSERT INTO `COURS` VALUES('ZZ3F3inteapp', 'Intégration d''applications', 'ZZ3', 'pacolomb', 'Filiere',10,0,10);
INSERT INTO `COURS` VALUES('ZZ3F3webserv', 'Web Services', 'ZZ3', 'odcoupelon', 'Filiere',0,10,10);
INSERT INTO `COURS` VALUES('ZZ3F3sysinfo', 'Systèmes d''information', 'ZZ3', 'rojacquelin', 'Filiere',0,14,0);
INSERT INTO `COURS` VALUES('ZZ3F3adbdd', 'Administration des bases de données', 'ZZ3', 'mapailloux', 'Filiere',0,20,20);
INSERT INTO `COURS` VALUES('ZZ3F3algoaad', 'Algorithmique de l''aide à la décision', 'ZZ3', 'kafarias', 'Filiere',20,0,0);
INSERT INTO `COURS` VALUES('ZZ3F3bigdata', 'Big Data', 'ZZ3', 'rasilveiracosta', 'Filiere',0,6,12);
INSERT INTO `COURS` VALUES('ZZ3F3evaloptisys', 'Evaluation et optimisation des systèmes ', 'ZZ3', 'phlacomme', 'Filiere',0,10,8);

-- F4
INSERT INTO `COURS` VALUES('ZZ3F4ecro', 'Etude de cas en R.O.', 'ZZ3', 'anwagler', 'Filiere',30,0,0);
INSERT INTO `COURS` VALUES('ZZ3F4optisyscomp', 'Optimisation des systèmes complexes', 'ZZ3', 'anwagler', 'Filiere',20,0,0);
INSERT INTO `COURS` VALUES('ZZ3F4prognonlin', 'Programmation Non Linéaire', 'ZZ3', 'jokoko', 'Filiere',0,16,0);
INSERT INTO `COURS` VALUES('ZZ3F4opticonv', 'Optimisation Convexe', 'ZZ3', 'jokoko', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F4edp', 'Equations aux Dérivées Partielles', 'ZZ3', 'gileborgne', 'Filiere',0,40,0);
INSERT INTO `COURS` VALUES('ZZ3F4mecasolid', 'Mécanique du solide', 'ZZ2', 'pibeaurepaire', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F4mddd', 'Méthodes de décomposition de domaines', 'ZZ3', 'jokoko', 'Filiere',0,8,4);
INSERT INTO `COURS` VALUES('ZZ3F4elemdecao', 'Eléments de CAO', 'ZZ3', 'lasabourin', 'Filiere',0,15,0);
INSERT INTO `COURS` VALUES('ZZ3F4algocparall', 'Algorithmique pour le calcul parallèle', 'ZZ3', 'jokoko', 'Filiere',14,0,12);
INSERT INTO `COURS` VALUES('ZZ3F4introdatasc', 'Introduction à la Data Science', 'ZZ3', 'rasilveiracosta', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F4cgljava', 'Compléments de Génie Logiciel (JAVA)', 'ZZ3', 'loyon', 'Filiere',0,16,0);
INSERT INTO `COURS` VALUES('ZZ3F4ram', 'Apprentissage profond', 'ZZ3', 'vibarra', 'Filiere',0,20,0);

-- F5
INSERT INTO `COURS` VALUES('ZZ3F5certifindu', 'Certification industrielle', 'ZZ2', 'palaurencot', 'Filiere',0,16,0);
INSERT INTO `COURS` VALUES('ZZ3F5routage', 'Routage', 'ZZ2', 'palaurencot', 'Filiere',0,12,12);
INSERT INTO `COURS` VALUES('ZZ3F5dbmanage', 'Database management', 'ZZ2', 'brguillon', 'Filiere',12,0,12);
INSERT INTO `COURS` VALUES('ZZ3F5devwebjee', 'Développent web (JEE)', 'ZZ2', 'loyon', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F5techdc', 'Programmation objet avancée', 'ZZ2', 'odgoutet', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F5intcwebd', 'Technologie des conteneurs', 'ZZ2', 'boroziere', 'Filiere',0,20,0);
INSERT INTO `COURS` VALUES('ZZ3F5pam', 'Programmation d''applications mobiles (PAM)', 'ZZ3', 'odgoutet', 'Filiere',6,0,24);
INSERT INTO `COURS` VALUES('ZZ3F5thcodecrypto', 'Théorie des codes et cryptographie', 'ZZ2', 'chtilmant', 'Filiere',0,28,0);
INSERT INTO `COURS` VALUES('ZZ3F5polidesecu', 'Politique de sécurité', 'ZZ2', 'pafraustot', 'Filiere',0,16,0);
INSERT INTO `COURS` VALUES('ZZ3F5analpostm', 'Analyse post-mortem (Forensic)', 'ZZ2', 'jolaffont', 'Filiere',0,18,0);
INSERT INTO `COURS` VALUES('ZZ3F5secureseaux', 'Sécurité réseaux', 'ZZ3', 'palaurencot', 'Filiere',6,0,8);
INSERT INTO `COURS` VALUES('ZZ3F5archirsecu', 'Architecture d''un réseau sécurisé', 'ZZ2', 'lebreuil', 'Filiere',0,6,24);

-- SYLLABUS de ZZ1

INSERT INTO `SYLLABUS` VALUES('ZZ1LV1Angl', 'English', 'Apprendre à parler couramment Anglais', 'the objective at this level is to refine the English language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ1LV2All', 'German', 'Apprendre à parler couramment Allemand', 'the objective at this level is to refine the German language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ1LV2Esp', 'Spanish', 'Apprendre à parler couramment Espagnol', 'the objective at this level is to refine the Spanish language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ1LV2Jap', 'japanese', 'Apprendre à parler couramment Japonais', 'the objective at this level is to refine the Japanese language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ1LV2chi', 'chinese', 'Apprendre à parler couramment Chinois', 'the objective at this level is to refine the Chinese language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ1LV2ita', 'italien', 'Apprendre à parler couramment Italien', 'the objective at this level is to refine the Italian language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ1shscomm', 'Expression and communication', 'Apprendre à faire des resumés de texte, à préparer des exposés et à rédiger des rapports', 'the objective is to acquire all the skills necessary to be able to communicate in the professional world and to write suitable reports and summaries that gives a good image of your work.');

INSERT INTO `SYLLABUS` VALUES('infolangc', 'C language','Apprendre à coder en langage C', 'It is a general-purpose, low-level imperative programming language. C offers the developer a significant margin of control over the machine (in particular over memory management) and is therefore used to build the “foundations” (compilers, interpreters, etc.) of these more modern languages.');
INSERT INTO `SYLLABUS` VALUES('infoalgo', 'Algorithmics and data structures','Une introduction aux structures de données(tableaux, listes,arbres,tables de hachage)','Algorithmics is the systematic study of the design and analysis of algorithms.It is fundamental and one of the oldest fields of computer science. It includes algorithm design, the art of building a procedure which can solve efficiently a specific problem or a class of problem, algorithmic complexity theory, the study of estimating the hardness of problems by studying the properties of the algorithm that solves them, or algorithm analysis, the science of studying the properties of a problem, such as quantifying resources in time and memory space needed by this algorithm to solve this problem.');
INSERT INTO `SYLLABUS` VALUES('infoprogfonc', 'Functional programming', 'Apprendre les bases de la programmation ', 'This course aims to introduce the functional programming paradigm. This course will consist of using lambda-calculus, which is the model of calculus on which functional languages ​​are based. One of the main motivations is to bring together related definitions, but which also makes it possible to introduce reusability through the system of parameterized modules.');
INSERT INTO `SYLLABUS` VALUES('infoautom', 'Automatons', 'Acquérir des connaissances en théorie des langages et en machines abtraites(Machine de Turing, Machine de Moore, Machine de Mealy, etc)', 'An automaton is a device that autonomously reproduces a sequence of predetermined actions without human intervention. In computer science, the notion of automaton emerged from the programming needs relating to syntactic analysis.');
INSERT INTO `SYLLABUS` VALUES('infocybersecu', 'Cyber ​​security awareness', 'Sensibiliser les étudiants sur la CyberSécurité', 'Cybersecurity encompasses all the means that make it possible to ensure the protection and integrity of data, sensitive or not, within a digital infrastructure. It is a specialty within the information systems professions. The notion of cybersecurity comes into play on a recurring basis thanks to the digital transformation of companies, which generalize the use of computer tools and communication via the Internet.');
INSERT INTO `SYLLABUS` VALUES('infosysexpl', 'Operating systems', 'Comprendre les fondements des Systèmes d''exploitation', 'An operating system is a collection of programs that direct the use of computer resources by application software. It receives requests for the use of computer resources - memory storage resources, central processor computing resources, communication resources to peripherals (to sometimes request computing resources from the GPU for example or any other card extension) or via the network - from application software. The operating system manages the requests as well as the necessary resources avoiding interference between software.');
INSERT INTO `SYLLABUS` VALUES('infobdd', 'Data base', 'Savoir créer une Base de données et exécuter des requètes complexes en SQL', 'In computing, a database is an organized collection of data stored and accessed electronically from a computer system. Where databases are more complex they are often developed using formal design and modeling techniques.');

INSERT INTO `SYLLABUS` VALUES('siphys', 'Semiconductor physics', 'Initiation à la physique des Semi-Conducteurs', 'The aim of this course is to teach the basic elements of the physics of light-matter interactions in semiconductors and present their most common applications in the field of generation and light detection.');
INSERT INTO `SYLLABUS` VALUES('sitransmdo', 'Data transmission', 'Prendre en main les outils nécéssaires pour la transmission de données', 'Data transmission and data reception or, more broadly, data communication or digital communications is the transfer and reception of data in the form of a digital bitstream or a digitized analog signal over a point-to-point or point-to-multipoint communication channel , analog transmission is a transmission method of conveying voice, data, image, signal or video information using a continuous signal which varies in amplitude, phase, or some other property in proportion to that of a variable.');
INSERT INTO `SYLLABUS` VALUES('sitraitsignal', 'Signal processing', 'Comprendre les fondements du traitement de signal numérique et analogique', 'Signal processing is the performance of operations on the signal. - Signal development: Synthesis (speech, music), modulation, coding. - Interpretation of signals: filtering, information extraction / detection, identification, analysis (spectral or temporal) or measurement.');
INSERT INTO `SYLLABUS` VALUES('sicsn', 'Design of digital systems', 'Apprendre les bases pour la conception de systèmes numeriques', 'Understand the operation of a microprocessor and / or microcontroller system, the relationship between a computer description and the hardware operation of the system. Know how to specify, design and validate an autonomous digital system and manage a generic I/O device.');
INSERT INTO `SYLLABUS` VALUES('siautomat', 'Automatic', 'Apprendre à modéliser, à analyser et à commander des systèmes dynamiques', 'Automation describes a wide range of technologies that reduce human intervention in processes. Human intervention is reduced by predetermining decision criteria, subprocess relationships, and related actions — and embodying those predeterminations in machines.');

INSERT INTO `SYLLABUS` VALUES('mathstg', 'Graph theory', 'Apprendre les algorithmes importants en théorie des graphes', 'Graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects. A graph in this context is made up of vertices (also called nodes or points) which are connected by edges (also called links or lines).');
INSERT INTO `SYLLABUS` VALUES('mathsproba', 'Probabilities', 'Initiation à la théorie des probabilité', 'Probability is the branch of mathematics concerning numerical descriptions of how likely an event is to occur, or how likely it is that a proposition is true. The probability of an event is a number between 0 and 1, where, roughly speaking, 0 indicates impossibility of the event and 1 indicates certainty.');
INSERT INTO `SYLLABUS` VALUES('mathsanalnum', 'Numerical analysis', 'Initiation à l''optimisation avec et sans contraintes', 'Numerical analysis is the study of algorithms that use numerical approximation (as opposed to symbolic manipulations) for the problems of mathematical analysis (as distinguished from discrete mathematics). Numerical analysis finds application in all fields of engineering and the physical sciences, and in the 21st century also the life and social sciences, medicine, business and even the arts. Current growth in computing power has enabled the use of more complex numerical analysis, providing detailed and realistic mathematical models in science and engineering.');
INSERT INTO `SYLLABUS` VALUES('mathscalcul', 'Differencial calculus', 'Initiation au Calcul différentiel', 'differential calculus is a subfield of calculus that studies the rates at which quantities change. It is one of the two traditional divisions of calculus, the other being integral calculus—the study of the area beneath a curve.');
INSERT INTO `SYLLABUS` VALUES('mathsproglineaire', 'Linear Programming', 'Initiation à l''optimisation linéaire sans contraintes', 'Linear programming (LP, also called linear optimization) is a method to achieve the best outcome (such as maximum profit or lowest cost) in a mathematical model whose requirements are represented by linear relationships.');
INSERT INTO `SYLLABUS` VALUES('mathsanaldonnées', 'Data analysis', 'Introduction à l''analyse de données', 'Data analysis is a process of inspecting, cleansing, transforming, and modelling data with the goal of discovering useful information, informing conclusions, and supporting decision-making. Data analysis has multiple facets and approaches, encompassing diverse techniques under a variety of names, and is used in different business, science, and social science domains');

-- SYLLABUS de ZZ2
-- Tronc Commun

INSERT INTO `SYLLABUS` VALUES('ZZ2TCLV1Angl', 'English', 'Apprendre à parler couramment Anglais', 'the objective at this level is to refine the English language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCLV2All', 'German', 'Apprendre à parler couramment Allemand', 'the objective at this level is to refine the German language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCLV2Esp', 'Spanish', 'Apprendre à parler couramment Espagnol', 'the objective at this level is to refine the Spanishlanguage of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCLV2Jap', 'Japanese', 'Apprendre à parler couramment Japonais', 'the objective at this level is to refine the Japanese language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCLV2chi', 'Chinese', 'Apprendre à parler couramment Chinois', 'the objective at this level is to refine the Chinese language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCLV2ita', 'Italian', 'Apprendre à parler couramment Italien', 'the objective at this level is to refine the Italian language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCshscomm', 'Expression and communication', 'Aide pour l''insertion professionelle', 'the objective is to acquire all the skills necessary to be able to communicate in the professional world and to write suitable reports and summaries that gives a good image of your work.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCshsdroit', 'Law', 'Initiation au Droit', 'This Introduction to Law course addresses the specifics of the subject (specific constraints and tools) and delivers a summary of French law allowing a better understanding of why it is organized around certain fundamental divisions (private law / public law, etc. ). It should help the student to assimilate the French jurisdictional organization, thus helping to read court decisions and a good understanding of the specificities of decisions according to the jurisdiction from which they emanate.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCshsgestion', 'Gestion', 'Initiation au management', 'The Diploma Program business management course is designed to develop students knowledge and understanding of business management theories, as well as their ability to use a range of tools and techniques.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCshsprojet', 'Project management', 'Aide pour le management de projets', 'Project management is the process of leading the work of a team to achieve all project goals within the given constraints. This information is usually described in project documentation, created at the beginning of the development process. The primary constraints are scope, time, and budget. The secondary challenge is to optimize the allocation of necessary inputs and apply them to meet pre-defined objectives.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCcplus', 'C++', 'Apprendre à coder en C++', 'C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or "C with Classes".');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCuml', 'UML', 'Introduction à l''UML', 'The Unified Modeling Language (UML) is a general-purpose, developmental, modeling language in the field of software engineering that is intended to provide a standard way to visualize the design of a system.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCjava', 'JAVA', 'Apprende à coder en Java et introduction à la programmation objet', 'This course is based on the skills acquired by students during the Java Fundamentals or Java Foundations course and aims to help them develop their skills in Java programming. Students will be able to design object-oriented applications with Java, and create Java programs as part of practical and fun activities.');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCiot', 'I.O.T', 'Introduction à l''Internet des Objets', 'The Internet of things (IoT) describes physical objects (or groups of such objects) that are embedded with sensors, processing ability, software, and other technologies that connect and exchange data with other devices and systems over the Internet or other communications networks');
INSERT INTO `SYLLABUS` VALUES('ZZ2TCreseau', 'Networks', 'Approfondir les connaissances en Réseaux', 'In this course we will see how to create networks, to manipulate them and to secure them as being and organizations of communication channels between different entities.');

-- F1 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ2F1liembarque', 'Embedded Linux', 'Acquérir les connaissances nécéssaires pour l''administration et la création Linux embarqué', 'This course aims to present all the technical elements for understand the mode of todays embedded systems: Embedded Linux');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1sysembarque', 'Embedded systems', 'Comprendre comment fonctionne un microcontrôleur. Pouvoir s''adapter à n''importe quel microcontrôleur. Démystifier l''ordinateur. Développer ses propres bibliothèques pour interagir avec un nouveau périphérique', 'An embedded system is a complex system that integrates software and hardware designed together to provide given functionality. It generally contains one or more microprocessors intended to execute a set of programs defined during design and stored in memories.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1semsysexembarque', 'Embedded Operating Systems Seminar', 'Un séminaire pour échanger avec un professionel qui travailles dans le domaine de l''embarqué', 'A seminar to exchange with a professional who works in the field of the on-board');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1archiavancée', 'Advanced architecture', 'Cet enseignement a pour objectif de préciser les mécanismes matériels mis en œuvre pour l''exécution optimisée des programmes informatiques dans les ordinateurs. Ces mécanismes permettent d''une part d''augmenter fortement la performance des processeurs ainsi que des communications sur une puce ou une carte.', 'This course aims to specify the hardware mechanisms implemented for the optimized execution of computer programs in computers. These mechanisms make it possible on the one hand to greatly increase the performance of processors as well as communications on a chip or card.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1capteurs', 'Sensors', 'Ce cours a pour objectif de présenter les différentes familles de capteurs, leur fonctionnement, leurs applications et des spécifications métrologiques.', 'The objective of this course is to present the different families of sensors, their operation, their applications and metrological specifications.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1design', 'Design', 'Apprendre à voir et concevoir, développer une gestuelle, tracer et transcrire, se familiariser avec les médiums.', 'Learn to see and design, develop body language, draw and transcribe, become familiar with mediums.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1traitnumdusign', 'Digital Signal Processing', 'Etudier les techniques de traitement (filtrage, compression, etc), d''analyse et d''interprétation des signaux numérisés.', 'Signal processing is the performance of operations on the signal. - Signal development: Synthesis (speech, music), modulation, coding. - Interpretation of signals: filtering, information extraction / detection, identification, analysis (spectral or temporal) or measurement.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1trdonnsecu', 'Secure data transmission', 'Transmettre de l’information entre deux dispositifs numériques. Trouver les méthodes et protocoles pour l’envoi et la réception des données. Rendre la transmission la plus fiable possible, sans perte d’informations', 'In computer science, secure transmission refers to the transfer of data such as confidential or proprietary information over a secure channel. Many secure transmission methods require a type of encryption. The most common email encryption is called PKI. In order to open the encrypted file, an exchange of key is done.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1imagvisio', 'Vision Imagery', 'Apprendre à créer une représentation visuelle intélligible de certaines informations', 'Learn to create an intelligible visual representation of certain information');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1robot', 'Robotics', 'Aborder les principes de la robotique, mettre en œuvre des capteurs et des actionneurs, monter un robot et le programmer pour lui faire réaliser une tâche complexe.', 'Robotics is an interdisciplinary branch of computer science and engineering.[1] Robotics involves design, construction, operation, and use of robots. The goal of robotics is to design machines that can help and assist humans.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1realvirtuelle', 'Virtual reality', 'Initiation à la réalité virtuelle', 'This course will teach you virtual reality (VR) and how to design a better VR system by learning a variety of engineering concepts (hardware, software, perception) that are used in current VR systems. This course will also explore the Virtual World Generator (VWG), which maintains the geometry and physics of the virtual world. You will be introduced to the concept of light and optical systems and their relevance to VR.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1realvimersive', 'Immersive reality', 'Initiation à l a réalité immersive', 'The technique of immersive reality refers to two different techniques, but which both allow the learner to project into a universe either fictitious, for virtual reality, or real modified for augmented reality, in which he can interact, to using joysticks, connected gloves or controls located on a digital screen.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F1cyberautomatique', 'Automatic Cybernetics', 'Donner une vision unifiée des domaines naissants de l''automatique, de l''électronique et de la théorie mathématique de l''information', 'Provide a unified vision of the emerging fields of automation, electronics and mathematical theory of information');

-- F2 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ2F2sysexps', 'Operating Systems: System Programming', 'La partie programmation système du cours a pour objectif la présentation du systéme d''exploitation. Elle doit permettre l''utilisation des ressources du système pour la réalisation de programmes efficaces. La partie réseaux du cours présente les concepts des réseaux informatiques.', 'systems programming, development of computer software that is part of a computer operating system or other control program, especially as used in computer networks. Systems programming covers data and program management, including operating systems, control programs, network software, and database management systems.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2swnet', 'Web services .NET C#', 'Développer des web service', 'A Web service, in the context of . NET, is a component that resides on a Web server and provides information and services to other network applications using standard Web protocols such as HTTP and Simple Object Access Protocol (SOAP).');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2ergdesihm', 'Ergonomics of HMIs', 'Prise en main des outils permettant de gérer la communication entre l’homme et la machine.', 'Ergonomics is the science of interactions between a person and their environment and/or a specific item while carrying out an activity in a given context or time. HMI Ergonomics is the sub-discipline which focuses on human machine interfaces.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2devnet', 'Development .NET C#', 'Enseigner les arcanes de la programmation objet en C#, sous la plate-forme Microsoft . NET.', 'In simple terms, C# is a programming language, whereas . NET is the framework on which the language is built. ... NET (Network Enabled Technology), and . NET developers will use programming languages such as C#.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2devappweb', 'Web Application Development', 'Savoir développer des applications web', 'In this course, you’ll learn all about becoming a web developer, from the responsibilities that a web developer performs on a day-to-day basis to the set of skills that you’d need to succeed in such a role. And, of course, you’ll also get your hands dirty with code: We’ll introduce you to the fundamental building blocks of the web and make sure you leave this course having developed your very first website!');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2archlogqual', 'Software architectures and quality', 'Acquérir les connaissances nécéssaires pour la réduction des coûts et l''augmentation de la qualité du logiciel', 'The architecture of a system describes its major components, their relationships (structures), and how they interact with each other. Software architecture and design includes several contributory factors such as Business strategy, quality attributes, human dynamics, design, and IT environment.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2simu', 'Simulation', 'Apprendre à mettre en œuvre la simulation de modèles complexes', 'Learn to implement the simulation of complex models');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2outilsad', 'Decision-making tools', 'Prise en main des outils d''aide à la décision', 'Decision Making tools are software applications that help you to map out all the possible alternatives to your decision, its cost, as well as chances of success or failure.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2cdprojet', 'Web project management', 'Apprendre à diriger des projets web', 'A web project manager is a professional that deals with the management and coordination of a web project (site or application) from its inception to the delivery (and more, if a maintenance phase has to be considered). The web project manager is an all-accomplished figure as he gets in contact with the client, with the salespeople, with designers, with developers and with systems analysts; with – in other words – everyone involved in the project.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2ddbdd', 'Database Development', 'Acquérir les connaissances pour le développement de bases de données', 'This course will guide you step-by-step through all the phases of a database system development project to guarantee that the resulting product will not only work as it is designed to work, but also that the design truly responds to user needs.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F2setsi', 'Security and Information Systems', 'Savoir sécuriser des systèmes d''information', 'As computers and other digital devices have become essential to business and commerce, they have also increasingly become a target for attacks. In order for a company or an individual to use a computing device with confidence, they must first be assured that the device is not compromised in any way and that all communications will be secure. In this chapter, we will review the fundamental concepts of information systems security and discuss some of the measures that can be taken to mitigate security threats. We will begin with an overview focusing on how organizations can stay secure. Several different measures that a company can take to improve security will be discussed. We will then follow up by reviewing security precautions that individuals can take in order to secure their personal computing environment.');

-- F3 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ2F3setsi', 'Security and Information Systems', 'Savoir sécuriser des systèmes d''information', 'As computers and other digital devices have become essential to business and commerce, they have also increasingly become a target for attacks. In order for a company or an individual to use a computing device with confidence, they must first be assured that the device is not compromised in any way and that all communications will be secure. In this chapter, we will review the fundamental concepts of information systems security and discuss some of the measures that can be taken to mitigate security threats. We will begin with an overview focusing on how organizations can stay secure. Several different measures that a company can take to improve security will be discussed. We will then follow up by reviewing security precautions that individuals can take in order to secure their personal computing environment.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3odmsien', 'Mobile development tool for the company''s Information System', 'Prise en main des outils de développement mobile des Systèmes d''Information de l''entreprise', 'A native development tool is a software which allows developers to create applications for use in a single particular system family, platform or device, like Android, iOS, or Windows');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3aletq', 'Software architectures and qualities', 'Acquérir les connaissances nécéssaires pour la réduction des coûts et l''augmentation de la qualité du logiciel', 'Software architecture is, simply, the organization of a system. This organization includes all components, how they interact with each other, the environment in which they operate, and the principles used to design the software. In many cases, it can also include the evolution of the software into the future.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3devweb', 'Web development', 'Savoir développer des applications web', 'This course is designed to start you on a path toward future studies in web development and design, no matter how little experience or technical knowledge you currently have. The web is a very big place, and if you are the typical internet user, you probably visit several websites every day, whether for business, entertainment or education.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3ddbdd', 'Database Development', 'Acquérir les connaissances pour le développement de bases de données', 'This course will guide you step-by-step through all the phases of a database system development project to guarantee that the resulting product will not only work as it is designed to work, but also that the design truly responds to user needs.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3fdbdd', 'Database Foundations', 'Comprendre les fondements des bases de données', 'This Specialization is designed to help beginners learn the foundational knowledge invaluable towards their journey to becoming proficient with the Oracle database environment. ');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3simuafluxd', 'Discrete flux simulation', 'Apprendres les bases de la simulation des flux discrets', 'Apprendres les bases de la simulation des flux discrets');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3modpralea', 'Modeling of random processes', 'Savoir moéliser des procésus aléatoires et complexes', 'in this chapter, we consider two examples of stochastic random state space processes, known as Markov chains, the first in discrete time and the second in continuous time. These two models will provide simple tools for modeling and analyzing a particular class of discrete event systems. in addition, the analysis of Markov chains is a necessary preliminary to the study of queuing systems.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3analfdd', 'Data analysis and mining', 'Analyser et extraires des données dans des bases de données gigantesques', 'Data Mining and Analytics provides a broad and interactive overview of a rapidly growing field. The exponentially increasing rate at which data is generated creates a corresponding need for professionals who can effectively handle its storage, analysis, and translation. With a dual focus on concepts and operations, this text comprises a complete how-to and is an excellent resource for anyone considering the field.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3oad', 'Decision-making tools', 'Prise en main des outils d''aide à la décision', 'Decision Making tools are software applications that help you to map out all the possible alternatives to your decision, its cost, as well as chances of success or failure.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F3rechoper', 'Operational research', 'Comprendre l''ensemble des méthodes mathématiques et algorithmiques qui permettent de résoudre un problème donné de la meilleure façon possible', 'Operations Research (OR) is a discipline that helps to make better decisions in complex scenarios by the application of a set of advanced analytical methods. It couples theories, results and theorems of mathematics, statistics and probability with its own theories and algorithms for problem solving.');

-- F4 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ2F4modpralea', 'Modeling of random processes', 'Savoir moéliser des procésus aléatoires et complexes', 'in this chapter, we consider two examples of stochastic random state space processes, known as Markov chains, the first in discrete time and the second in continuous time. These two models will provide simple tools for modeling and analyzing a particular class of discrete event systems. in addition, the analysis of Markov chains is a necessary preliminary to the study of queuing systems.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4apstat', 'Statistical learning', 'Présenter les théories et algorithmes majeurs de l''apprentissage statistique', 'As the scale and scope of data collection continue to increase across virtually all fields, statistical learning has become a critical toolkit for anyone who wishes to understand data. An Introduction to Statistical Learning provides a broad and less technical treatment of key topics in statistical learning. Each chapter includes an R lab. This book is appropriate for anyone who wishes to use contemporary tools for data analysis.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4efinis', 'Finite elements', 'Prise en main des outils nécéssaires à la compréhension de la méthode des éléments finis', 'he Finite Element Analysis (FEA) is a numerical method for solving problems of engineering and mathematical physics. Useful for problems with complicated geometries, loadings, and material properties where analytical solutions can not be obtained.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4intedist', 'Integration and Distributions', 'Savoir intégrer des fonctions complexes(fonction non continues). Comprendre l''intégration au sens des distributions', 'Savoir intégrer des fonctions complexes(fonction non continues). Comprendre l''intégration au sens des distributions');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4rechoper', 'Operational research', 'Comprendre l''ensemble des méthodes mathématiques et algorithmiques qui permettent de résoudre un problème donné de la meilleure façon possible', 'Operations Research (OR) is a discipline that helps to make better decisions in complex scenarios by the application of a set of advanced analytical methods. It couples theories, results and theorems of mathematics, statistics and probability with its own theories and algorithms for problem solving.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4stat', 'Statistics', 'Résumer, synthétiser l''information contenue dans la série statistique et mettre en évidence ses propriétés pour suggérer des hypothèses relatives à la population dont est issu l''échantillon.', 'Statistics is a study of data: describing properties of data (descriptive statistics) and drawing conclusions about a population based on information in a sample (inferential statistics). The distinction between a population together with its parameters and a sample together with its statistics is a fundamental concept in inferential statistics. Information in a sample is used to make inferences about the population from which the sample was drawn.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4optim', 'Optimisation', 'Résoudre des problèmes d''optimisation convexes, sans contraintes, et de dimension finie.', 'Optimization is an important tool in making decisions and in analyzing physical systems. In mathematical terms, an optimization problem is the problem of finding the best solution from among the set of all feasible solutions.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4bddetfdd', 'Databases and data mining', 'Analyser et extraires des données dans des bases de données gigantesques', 'Databases and other collections of data are everywhere. Retailers use data about customers and their purchases to make decisions that increase profits. Researchers analyze data about the human genome to find treatments for diseases. Policymakers analyze socioeconomic data to gain insights that guide their decisions. Online music and video services perform data mining to deliver customized recommendations');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4imagvisio', 'Vision Imagery', 'Apprendre à créer une représentation visuelle intélligible de certaines informations', 'Learn to create an intelligible visual representation of certain information');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4mecasolid', 'Solid mechanics', 'Apporter une contribution à l''acquisition d''une culture scientifique de base permettant la compréhension des lois du mouvement et une certaine maîtrise dans le maniement des outils de la dynamique.', 'Solid mechanics, also known as mechanics of solids, is the branch of continuum mechanics that studies the behavior of solid materials, especially their motion and deformation under the action of forces, temperature changes, phase changes, and other external or internal agents.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4mddifffini', 'Finite difference methods', 'Initiation à la méthode des éléments finis pour la résolution de problèmes issus des applications aux sciences de l''ingénieur.', 'The finite difference method (FDM) is an approximate method for solving partial differential equations. It has been used to solve a wide range of problems. These include linear and non-linear, time independent and dependent problems.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F4matlab', 'Matlab', 'Prise en main du langage de programmation Matlab', 'MATLAB is a software package for high-performance mathematical computation, visualization, and programming environment. It provides an interactive environment with hundreds of built-in functions for technical computing, graphics, and animations. MATLAB stands for Matrix Laboratory.');

-- F5 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ2F5certifindu', 'Industrial certification', 'Obtenir un éclairage sur le marché de la certification appliquée à la maintenance afin de disposer d’un niveau d''information suffisant pour améliorer les pratiques des organismes de certification.', 'Industrial training aims to provide the students of all fields with real work experience in a particular field. Students also get a certificate of industrial training for their future records. In college or university, students only gain theoretical knowledge');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5secprotres', 'Securing network protocols', 'Approfondir les technologies des réseaux et les solutions de sécurité qui sont associées.', 'Network security protocols are a type network protocol that ensures the security and integrity of data in transit over a network connection. Network security protocols define the processes and methodology to secure network data from any illegitimate attempt to review or extract the contents of data.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5sysexps', 'Operating Systems: System Programming', 'La partie programmation système du cours a pour objectif la présentation du systéme d''exploitation. Elle doit permettre l''utilisation des ressources du système pour la réalisation de programmes efficaces. La partie réseaux du cours présente les concepts des réseaux informatiques.', 'An operating system acts as an intermediary between the user of a computer and computer hardware. The purpose of an operating system is to provide an environment in which a user can execute programs conveniently and efficiently.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5swnet', 'Web Services .NET C#', 'Développer des web service', 'A Web service, in the context of . NET, is a component that resides on a Web server and provides information and services to other network applications using standard Web protocols such as HTTP and Simple Object Access Protocol (SOAP).');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5cloud', 'Cloud', 'Découvrir les différents types de Cloud. ... Anticiper les impacts directs et indirects du Cloud sur l''entreprise et son système d''informations. Comprendre comment mener un projet de Cloud Computing.', 'Cloud Computing is the delivery of computing services such as servers, storage, databases, networking, software, analytics, intelligence, and more, over the Cloud (Internet).');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5intcwebd', 'Continuous integration for the web', 'Trouver et de corriger plus rapidement les bugs, améliorer la qualité des logiciels et réduire le temps nécessaire pour valider et publier de nouvelles mises à jour de logiciels.', 'Continuous Integration (CI) is a development practice that requires developers to integrate code into a shared repository several times a day. Each check-in is then verified by an automated build, allowing teams to detect problems early.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5secuweb', 'Web security', 'Se sensibiliser aux risques liés aux attaques sur les systèmes d''information. Se familiariser avec les concepts de la sécurité informatique. Savoir utiliser des mécanismes cryptographiques pour garantir différents services de sécurité.', 'Website security refers to the protection of personal and organizational public-facing websites from cyberattacks.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5analmalw', 'Malware Analysis - Reverse Engineering', 'Déterminer les fonctionnements des malwares et leurs impacts potentiels. Fournir la compréhension nécessaire pour concevoir des contre-mesures efficaces et des stratégies d''atténuation contre les différents logiciels malveillants.', 'Malware analysis by using reverse engineering method become one solution that can be used to extract data in a malware to find out how the malware is working when it attacks into the system.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5secuoc', 'Security of connected objects', 'Délivrer les savoir-faire visant l’identification, l’évaluation et la maîtrise de l’ensemble des risques et des malveillances à tous ceux qui veulent mieux comprendre les enjeux de la sécurité des objets connectés au sein des entreprises.', 'IoT security is the technology segment focused on safeguarding connected devices and networks in the internet of things (IoT). IoT involves adding internet connectivity to a system of interrelated computing devices, mechanical and digital machines, objects, animals and/or people. Each "thing" is provided a unique identifier and the ability to automatically transfer data over a network. Allowing devices to connect to the internet opens them up to a number of serious vulnerabilities if they are not properly protected.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5sasr', 'Active securing of networked systems', 'Initier les étudiants aux concepts communs d''administration réseaux en mettant en place les services réseaux associées afin de sa gestion active.', 'Network security is a broad term that covers a multitude of technologies, devices and processes. In its simplest term, it is a set of rules and configurations designed to protect the integrity, confidentiality and accessibility of computer networks and data using both software and hardware technologies.');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5pentest', 'Penetration testing (pentest)', 'Identifier les vulnérabilités des réseaux et des ordinateurs au niveau technique et organisationnel et de les documenter dans un rapport détaillé.', 'A penetration test, also known as a pen test, is a simulated cyber attack against your computer system to check for exploitable vulnerabilities. In the context of web application security, penetration testing is commonly used to augment a web application firewall (WAF).');
INSERT INTO `SYLLABUS` VALUES('ZZ2F5trdonnsecu', 'Secure data transmission', 'Transmettre de l’information entre deux dispositifs numériques. Trouver les méthodes et protocoles pour l’envoi et la réception des données. Rendre la transmission la plus fiable possible, sans perte d’informations', 'In computer science, secure transmission refers to the transfer of data such as confidential or proprietary information over a secure channel. Many secure transmission methods require a type of encryption. The most common email encryption is called PKI. In order to open the encrypted file, an exchange of key is done.');

-- SYLLABUS de ZZ3
-- Tron Commun OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ3TCLV1Angl', 'English', 'Apprendre à parler couramment Anglais', 'the objective at this level is to refine the English language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCLV2All', 'German', 'Apprendre à parler couramment Alemand', 'the objective at this level is to refine the German language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCLV2Esp', 'Spanish', 'Apprendre à parler couramment Espagnol', 'the objective at this level is to refine the Spanish language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCLV2Jap', 'Japanese', 'Apprendre à parler couramment Japonais', 'the objective at this level is to refine the Japanese language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCLV2chi', 'Chinese', 'Apprendre à parler couramment Chinois', 'the objective at this level is to refine the Chinese language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCLV2ita', 'Italian', 'Apprendre à parler couramment Italien', 'the objective at this level is to refine the Italian language of each participant. This is a course where participants have to read, write, understand and converse. The emphasis is on oral practice, through more specific practical conversations tailored to the needs and interests of the participants.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCshscomm', 'Expression, communication and management of human resources', 'Aide pour l''insertion professionelle. Apprendre aux étudiants comment parvenir à assurer une bonne ambiance au travail dans le but d''améliorer leur productivité.', 'the objective is to acquire all the skills necessary to be able to communicate in the professional world and to write suitable reports and summaries that gives a good image of your work, and to best comprehend Human Resource Management (HRM) which is an operation in companies designed to maximize employee performance in order to meet the employers strategic goals and objectives.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCshsdroit', 'Law', 'Initiation au Droit', 'This Introduction to Law course addresses the specifics of the subject (specific constraints and tools) and delivers a summary of French law allowing a better understanding of why it is organized around certain fundamental divisions (private law / public law, etc. ). It should help the student to assimilate the French jurisdictional organization, thus helping to read court decisions and a good understanding of the specificities of decisions according to the jurisdiction from which they emanate.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCinteconomique', 'Economic intelligence', 'Assurer la protection de l’organisation de l’entreprise et l’ensemble de ses actifs matériels et imma­tériels, de permettre l’élaboration de stratégies d’influence, de contrôler la concurrence par la gestion des flux d’informations, d’anticiper les menaces et de déceler les opportunités.', 'Economic intelligence can be loosely defined as information gathered about materials and resources that are developed, produced, or managed outside the United States, and the interpretation and presentation of raw information or unpublished data to reports or analyses that inform policy makers and consumers.');
INSERT INTO `SYLLABUS` VALUES('ZZ3TCeddd', 'Ethics, deontology and sustainable development', 'Une sensibilisation sur l''éthique, la déontologie, et le développement durable.', 'Sustainable development was defined as "development that meets the needs of current generations without compromising the ability of future generations to meet their needs" (WCED 1987). The Brundtland definition of sustainable development was a broad ethical principle with two key components.');
INSERT INTO `SYLLABUS` VALUES('ZZ3managproj', 'Project Management', 'Savoir diriger des projets', 'Project management is the process of leading the work of a team to achieve all project goals within the given constraints. This information is usually described in project documentation, created at the beginning of the development process. The primary constraints are scope, time, and budget. The secondary challenge is to optimize the allocation of necessary inputs and apply them to meet pre-defined objectives.');

-- F1 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ3F1pam', 'Mobiles applications programming', 'Savoir créer vos propres applications mobiles iOS et Android de A à Z (et les publier dans les store) savoir réaliser tous type d''applications tout en partageant le code entre iOS et Android (gain de temps énorme).', 'Mobile application development is the process to making software for smartphones and digital assistants, most commonly for Android and iOS. ... The programming and markup languages used for this kind of software development include Java, Swift, C# and HTML5. Mobile app development is rapidly growing.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1sse', 'Security of embedded systems', 'La formation présente l''état de l''art des différentes attaques physiques auxquelles sont exposés les systèmes embarqués, les conditions dans lesquelles elles peuvent être réalisées et les contre-mesures à déployer pour s''en protéger.', 'Embedded systems security is a cybersecurity field focused on preventing malicious access to and use of embedded systems. Embedded systems security provides mechanisms to protect a system from all types of malicious behavior.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1pFPGAVHDL', 'FPGA - VHDL programming', ' Etudier les différents types de circuits programmables, ainsi que les différentes méthodes de conception en particulier la programmation en utilisant les langages de description matérielle', 'Field programmable gate arrays (FPGAs) are digital integrated circuits (Ics) that contain configurable (programmable) blocks of logic along with configurable interconnects between these blocks . FPGA — is an FPD featuring a general structure that allows very high logic capacity.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1ptr', 'Real time programming', 'Connaître et identifier les problèmes inhérents au développement de systèmes temps réel; connaître et appliquer le traitement du temps au niveau des systèmes informatiques; spécifier, concevoir, programmer et vérifier des systèmes temps réel.', 'Real-time programming is a software engineering discipline that has been around ever since the dawn of digital computing. The dream of real-time programmers is to unlock the virtually unlimited po- tential of software for embedded computer systems – digital computers that are supposed to behave like analog devices.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1prGPGPU', 'GPGPU programming', 'Appréhender par la pratique la programmation des GPU (processeurs graphiques) pour le calcul scientifique. Le langage CUDA sera étudié, ainsi que de nombreux concepts de l''algorithmique de calcul sur GPU, et mis en oeuvre lors de plusieurs TP.', 'It is a parallel programming paradigm released in 2007 by NVIDIA. It is used to develop software for graphics processors and is used to develop a variety of general purpose applications for GPUs that are highly parallel in nature and run on hundreds of GPUs processor cores.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1ram', 'Augmented and mixed reality', 'Comprendre les fondements de base de la réalité augmentée, mixte et virtuelle dans un cadre de développement d’une application interactive. Analyser les distinctions entre les types de réalité. Être à mesure d’utiliser efficacement des outils de développement pour des expériences immersives. Être à mesure de développer un projet permettant une expérience d’immersion en réalité augmentée, mixte et ou virtuelle.', 'Augmented reality (AR) adds digital elements to a live view often by using the camera on a smartphone. ... In a Mixed Reality (MR) experience, which combines elements of both AR and VR, real-world and digital objects interact.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1ga', 'Algorithmic geometry', 'Fournir quelques clés essentielles à travers l''étude de structures de données géométriques comme les diagrammes de Voronoï et les triangulations de Delaunay qui ont une portée universelle et permettent de modéliser des formes très variées dans tous les domaines scientifiques.', '“Computational geometry” is a term claimed by a number of different groups. The term was coined perhaps first by Marvin Minsky in his book “Perceptrons”, which was about pattern recognition, and it has also been used often to describe algorithms for manipulating curves and surfaces in solid modeling. It’s most widely recognized use, however, is to describe the subfield of algorithm theory that involves the design and analysis of efficient algorithms for problems involving geometric input and output.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1icr', 'Sensor integration for robotics', 'Savoir concevoir des capteurs pour la robotique.', 'Integration is the process of merging an industrial robot, peripherals, and manufacturing machinery into a production system that functions as a single unit. Robot integration allows industrial robots to perform specific manufacturing tasks and can lower costs, improve product quality, and decrease production time.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1cc', 'Communicating Sensors', 'Apprendre à concevoir des capteurs communiquant et savoir les intégrer à la robotique.', 'A Wireless sensor network can be defined as a network of devices that can communicate the information gathered from a monitored field through wireless links. The data is forwarded through multiple nodes, and with a gateway, the data is connected to other networks like wireless Ethernet.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F1rm', 'Mobile robotics', 'Développer un algorithme d''apprentissage automatique (reinforcement learning, par exemple) pour faire apprendre la nage à un robot à palmes . Navigation avec évitement d''obstacle pour une Kinect montée sur le robot.', 'Mobile robotics is the industry related to creating mobile robots, which are robots that can move around in a physical environment. ... Mobile robots combine the progress in artificial intelligence with physical robotics, which allows them to navigate their surroundings.');

-- F2 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ3F2secureseaux', 'Network security', 'Au terme du cours, vous serez en mesure d''identifier les vulnérabilités et les risques auxquels les réseaux informatiques sont exposés, de choisir et de déployer les contre-mesures appropriées pour augmenter la sécurité du réseau de l''entreprise et le protéger contre les menaces internes et externes.', 'Network security protocols are a type network protocol that ensures the security and integrity of data in transit over a network connection. Network security protocols define the processes and methodology to secure network data from any illegitimate attempt to review or extract the contents of data.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2conceparchi', 'Web API Architecture Design', 'Connaître les applications et leurs contraintes d''utilisation, s''intéresser à l''architecture de composants et à l''infrastructure de liaison.', 'The bottom layer in the Web API processing architecture is responsible for the hosting and acts as the interface between Web API and an underlying HTTP infrastructure, such as the classic ASP.NET pipeline, the HttpListener class found in the . NET Frameworks System.Net assembly, or an OWIN host.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2pam', 'Mobile Application Programming', 'Apprendre à gérer l''entrée et la sortie des données. Ce cours permet à l''étudiant de développer les compétences en programmation dont il a besoin pour créer des applications Windows en utilisant le langage C #.', 'Mobile application development is the process to making software for smartphones and digital assistants, most commonly for Android and iOS. The software can be preinstalled on the device, downloaded from a mobile app store or accessed through a mobile web browser. The programming and markup languages used for this kind of software development include Java, Swift, C# and HTML5.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2imsimul', 'Model Engineering and Simulation', 'L''objectif principal du cours est de faire le design, la modélisation et la simulation de systèmes complexes.', 'Modeling and Simulation Engineering is creating a design or hypothesis and testing it in real-world conditions through: Graphical and Mathematical Models, Virtual Reality Simulations, Serious Gaming, Computer Programming, 3-D Printed Models, Statistical Analysis');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2algocparall', 'Algorithmics for parallel computation', 'L''algorithmique parallèle se focalise plutôt quant à elle sur les problèmes de performances, dont en particulier le facteur d''accélération que l''on peut espérer tirer de l''exécution d''un calcul sur plusieurs processeurs, comparé à l''exécution de ce même calcul sur un unique processeur.', 'A parallel algorithm is an algorithm that can execute several instructions simultaneously on different processing devices and then combine all the individual outputs to produce the final result.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2prgcc', 'Computing Grids and Cloud', 'Comprendre le concept et le fonctionnement des systèmes distribués à grande échelle. Prendre connaissances des nouvelles évolutions liés aux architectures parallèles. Découvrir les différents types de Cloud. ... Anticiper les impacts directs et indirects du Cloud sur l''entreprise et son système d''informations. Comprendre comment mener un projet de Cloud Computing.', 'While grid computing involves virtualizing computing resources to store massive amounts of data, whereas cloud computing is where an application doesnt access resources directly, rather it accesses them through a service over the internet');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2ram', 'Deep learning', 'Cette discipline repose sur la construction de systèmes inspirés de nos cerveaux, comportant des réseaux de neurones artificiels.', 'Deep learning is a class of machine learning algorithms that uses multiple layers to progressively extract higher-level features from the raw input. For example, in image processing, lower layers may identify edges, while higher layers may identify the concepts relevant to a human such as digits or letters or faces');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2infograph', 'Infographics', 'Créer et manipuler des images à l''aide de logiciels, comprendre un brief client, définir l''identité visuelle d''un produit ou d''une entreprise.', 'An infographic is a visual image such as a chart or diagram used to represent information or data in a way that is visually engaging. It can make digesting a lot of data easier and help the reader avoid boredom. ... In other words, a good image IS worth a thousand words.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2algoaad', 'Algorithmics of decision support', 'Ce cours a pour objectif de sensibiliser à la démarche de l''aide à la décision : analyse d''un problème, modélisation, résolution, analyse de la solution.', 'Algorithmic or automated decision systems use data and statistical analyses to classify people for the purpose of assessing their eligibility for a benefit or penalty. ... They are also used in the public sector, including for the delivery of government services, and in criminal justice sentencing and probation decisions.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2flog', 'Software forges', 'Prise en main d''outils pour les besoins du développement.', ' A software forge is generally defined as a collaboration platform hosted as a website designed to facilitate, stimulate and concentrate community (and often, but not always, “independent”) software application development projects — the forge is home to software application development tools, management .');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2rm', 'Database Management', 'L''objectif visé par ce cours est d''introduire le concept de base de données et l''outil SGBD (Système de Gestion de Bases de Données). ... L''accent est mis sur la conception d''un bon schéma d''une base de données relationnelle centralisée (non répartie) et à l''utilisation des SGBD pour l''implémenter et l''exploiter.', 'A database management system (DBMS) refers to the technology for creating and managing databases. DBMS is a software tool to organize (create, retrieve, update, and manage) data in a database. The main aim of a DBMS is to supply a way to store up and retrieve database information that is both convenient and efficient.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F2javaprof', 'Professional Java', 'Découvrir les technologies Java permettant de développer des applications embarquées, notamment sur des téléphones portables. Découvrir deux technologies supportées par Oracle : Java ME et Java FX.', 'This course is based on the skills acquired by students during the Java Fundamentals or Java Foundations course and aims to help them develop their skills in Java programming. Students will be able to design object-oriented applications with Java, and create Java programs as part of practical and fun activities.');

-- F3 OK pour les syllabus
INSERT INTO `SYLLABUS` VALUES('ZZ3F3mgicl', 'Modeling and Integrated Supply Chain Management', 'Apprendre la modélisation et la gestion intégrée de la chaîne d''approvisionnement.', 'The term supply chain modeling refers to different processes used over the years to define, determine and understand an organizations supply chain. ... This type uses mathematical optimization modeling software to determine appropriate supply chain decisions.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3oracleapp', 'Oracle Applications', 'Développer des applications RAD taillées sur mesure. Mettre en place la sécurité APEX. Installer des ressources externes.', 'Oracle Applications comprise the applications software or business software of the Oracle Corporation both in the cloud and on-premises. The term refers to the non-database and non-middleware parts.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3pam', 'Business Intelligence', 'L''objectif de la Business Intelligence est de soutenir une meilleure prise de décision des verticales métiers, commerciale, marketing, finance. Essentiellement, les systèmes de Business Intelligence sont des systèmes d''aide à la décision axés sur les données.', 'Business intelligence (BI) is a technology-driven process for analyzing data and presenting useful information to help executives, managers and other end users make informed business decisions. ... In short, BI technologies allow a business to view their operations, past, present and future.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3inteapp', 'Integration of applications', 'Savoir implémenter des applications professionnelles en séparant les couches métiers/serveur des couches clientes. Connaissances globales de l''architecture. Connaissances de la technologies Entity.', 'What is the Application of Integration? Application integration services enable the sharing of processes and business data among a wide range of applications in an organization. This means seamlessly connecting a variety of on-premise and cloud apps to transform and orchestrate the data required for business workflows.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3webserv', 'Web Services', 'Développer des web service', 'A web service makes software application resources available over networks using standard technologies. Because web services are based on standard interfaces, they can communicate even if they are running on different operating systems and are written in different languages.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3sysinfo', 'Information system', 'Dans l''organisation socio-économique d''aujourd''hui, toute opération, analyse, décision, stratégie se construit qu''en s''appuyant sur un système d''information (SI) regroupant les processus d''organisation, d''exploitation et d''échange des informations pertinentes.', 'Information Systems is an academic study of systems with a specific reference to information and the complementary networks of computer hardware and software that people and organizations use to collect, filter, process, create and also distribute data.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3adbdd', 'Database administration', 'Apprendre à administrer des bases de données.', 'Database administration is the function of managing and maintaining database management systems (DBMS) software. ... As such, corporations that use DBMS software often hire specialized information technology personnel called database administrators or DBAs.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3algoaad', 'Algorithmics of decision support', 'Ce cours a pour objectif de sensibiliser à la démarche de l''aide à la décision : analyse d''un problème, modélisation, résolution, analyse de la solution.', 'Algorithmic or automated decision systems use data and statistical analyses to classify people for the purpose of assessing their eligibility for a benefit or penalty. ... They are also used in the public sector, including for the delivery of government services, and in criminal justice sentencing and probation decisions.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3bigdata', 'Big Data', 'Répondre aux nouveaux enjeux de traitement de très hautes volumétries de données structurées et non structurées à grande vitesse, afin de créer de la valeur pour l''entreprise.', 'The definition of big data is data that contains greater variety, arriving in increasing volumes and with more velocity. ... Put simply, big data is larger, more complex data sets, especially from new data sources. These data sets are so voluminous that traditional data processing software just cant manage them.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F3evaloptisys', 'Systems evaluation and optimization', 'Savoir évaluer les performances des systèmes et savoir les optimiser en conséquence.', 'Savoir évaluer les performances des systèmes et savoir les optimiser en conséquence.');

-- F4
INSERT INTO `SYLLABUS` VALUES('ZZ3F4ecro', 'Operational research case study', 'Etudier quelques cas en recherche opérationnelle.', 'Operational research can be defined as the set of rational methods and techniques oriented towards the search for the best choice in the way of operating in order to achieve the desired result or the best possible result or even the optimal result.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4optisyscomp', 'Optimization of complex systems', 'Comprendre les outils nécéssaire à l''optimisation de systèmes complexes.', 'Natural or artificial, complex systems are everywhere. Although there is still no unanimously accepted formal definition of their nature, they are characterized by the interaction of components of various sizes and a heterogeneous, uncertain nature whose overall evolution is dominated by couplings and retro-actions.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4prognonlin', 'Non Linear Programming', 'Acquérir toutes les connaissances de l''optimisation et de la programmation non linéaire.', 'In mathematics, nonlinear programming (NLP) is the process of solving an optimization problem where some of the constraints or the objective function are nonlinear. ... It is the sub-field of mathematical optimization that deals with problems that are not linear.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4opticonv', 'Convex Optimization', 'Acquérir totes les connaissances nécéssaire à l''optimisation de fonctions convexes non dérivables.', 'Convex optimization is a subfield of mathematical optimization that studies the problem of minimizing convex functions over convex sets. Many classes of convex optimization problems admit polynomial-time algorithms, whereas mathematical optimization is in general NP-hard.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4edp', 'Partial Differential Equations', 'Apprendre à résoudre des équations aux dérivées partielles.', 'In mathematics, a partial differential equation (PDE) is an equation which imposes relations between the various partial derivatives of a multivariable function. ... Partial differential equations are ubiquitous in mathematically-oriented scientific fields, such as physics and engineering.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4mecasolid', 'Solid mechanics', 'Apporter une contribution à l''acquisition d''une culture scientifique de base permettant la compréhension des lois du mouvement et une certaine maîtrise dans le maniement des outils de la dynamique.', 'Solid mechanics, also known as mechanics of solids, is the branch of continuum mechanics that studies the behavior of solid materials, especially their motion and deformation under the action of forces, temperature changes, phase changes, and other external or internal agents.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4mddd', 'Domain decomposition methods', 'Introduction et perfectionnement à la Méthodes de décomposition de domaine.', 'The value of domain decomposition methods is part of a general need for parallel algorithms for professional and consumer use. We will focus on scientific computing and more specifically on the solution of the algebraic systems arising from the approximation of a partial differential equation.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4elemdecao', 'Computer aided design elements', 'Concevoir des systèmes dont la complexité dépasse la capacité de l''être humain comme en micro ou nanoélectronique. La conception virtuelle permet l''appréciation globale du comportement de l''objet créé avant même que celui-ci n''existe.', 'Computer-aided design (CAD) involves creating computer models defined by geometrical parameters. These models typically appear on a computer monitor as a three-dimensional representation of a part or a system of parts, which can be readily altered by changing relevant parameters.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4algocparall', 'Algorithmics for parallel computation', 'L''algorithmique parallèle se focalise plutôt quant à elle sur les problèmes de performances, dont en particulier le facteur d''accélération que l''on peut espérer tirer de l''exécution d''un calcul sur plusieurs processeurs, comparé à l''exécution de ce même calcul sur un unique processeur.', 'A parallel algorithm is an algorithm that can execute several instructions simultaneously on different processing devices and then combine all the individual outputs to produce the final result.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4introdatasc', 'Introduction to Data Science', 'Introduction à la science des données.', 'Data science is the practice of mining large data sets of raw data, both structured and unstructured, to identify patterns and extract actionable insight from them.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4cgljava', 'Software Engineering Complements (JAVA)', 'Compléments de méthodes de génie logiciel.', 'Compléments de méthodes de génie logiciel.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F4ram', 'Deep learning', 'Cette discipline repose sur la construction de systèmes inspirés de nos cerveaux, comportant des réseaux de neurones artificiels.', 'Deep learning is a class of machine learning algorithms that uses multiple layers to progressively extract higher-level features from the raw input. For example, in image processing, lower layers may identify edges, while higher layers may identify the concepts relevant to a human such as digits or letters or faces');

-- F5
INSERT INTO `SYLLABUS` VALUES('ZZ3F5certifindu', 'Industrial certification', 'Obtenir un éclairage sur le marché de la certification appliquée à la maintenance afin de disposer d’un niveau d''information suffisant pour améliorer les pratiques des organismes de certification.', 'Industrial training aims to provide the students of all fields with real work experience in a particular field. Students also get a certificate of industrial training for their future records. In college or university, students only gain theoretical knowledge');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5routage', 'Routing', 'Perfectionner les connaisances acquises en routage les années précédentes.', 'Routing is the process of forwarding packets from one network to the destination address in another network. Router, a packet forwarding device between two networks, is designed to transmit packets based on the various routes stored in routing tables. Each route is known as a routing entry.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5dbmanage', 'Database management', 'L''objectif visé par ce cours est d''introduire le concept de base de données et l''outil SGBD (Système de Gestion de Bases de Données). ... L''accent est mis sur la conception d''un bon schéma d''une base de données relationnelle centralisée (non répartie) et à l''utilisation des SGBD pour l''implémenter et l''exploiter.', 'A database management system (DBMS) refers to the technology for creating and managing databases. DBMS is a software tool to organize (create, retrieve, update, and manage) data in a database. The main aim of a DBMS is to supply a way to store up and retrieve database information that is both convenient and efficient.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5devwebjee', 'Web development', 'Savoir développer des applications web', 'This course is designed to start you on a path toward future studies in web development and design, no matter how little experience or technical knowledge you currently have. The web is a very big place, and if you are the typical internet user, you probably visit several websites every day, whether for business, entertainment or education.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5techdc', 'Advanced object programming', 'Prefectionnement en programmation orientée objet.', 'Systems are modelled as configurations of objects communicating with one another. Techniques (e.g. inheritance) are introduced which allow objects to play different roles within a system. These two concepts are key to the support for adaptation and reuse that OOP provides.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5intcwebd', 'Container technology', 'À l''issue de la formation, le participant sera en mesure de : Comprendre le positionnement de Docker et des conteneurs. Manipuler l''interface en ligne de commande de Docker pour créer des conteneurs. Mettre en œuvre et déployer des applications dans des conteneurs.', 'Container technology is a method of packaging an application so it can be run with isolated dependencies, and they have fundamentally altered the development of software today due to their compartmentalization of a computer system. ... Container technology was born in 1979 with Unix version 7 and the chroot system.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5pam', 'Mobile Application Programming', 'Apprendre à gérer l''entrée et la sortie des données. Ce cours permet à l''étudiant de développer les compétences en programmation dont il a besoin pour créer des applications Windows en utilisant le langage C #.', 'Mobile application development is the process to making software for smartphones and digital assistants, most commonly for Android and iOS. The software can be preinstalled on the device, downloaded from a mobile app store or accessed through a mobile web browser. The programming and markup languages used for this kind of software development include Java, Swift, C# and HTML5.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5thcodecrypto', 'Code theory and cryptography', 'Initiation et introduction à la Théorie des codes et à la cryptographie', 'Coding theory is the study of the properties of codes and their respective fitness for specific applications. Codes are used for data compression, cryptography, error detection and correction, data transmission and data storage.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5polidesecu', 'Security policy', 'Iniation à la politique de sécurité en informatique.', 'A security policy can control the traffic forwarding between security zones/segments. By default, the devices will deny all traffic between security zones/segments. A security policy controls the traffic forwarding by relying on the filtering conditions.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5analpostm', 'Post-mortem analysis (Forensic)', 'L''objectif de ce bilan est de déterminer les aspects positifs à conserver et de pouvoir analyser les sources des problèmes rencontrés afin d''y trouver des solutions préventives à appliquer dans les projets futurs.', 'A post-mortem analysis is a process in which you summarize what went wrong (and should be fixed) in a project, as well as what went well and should be repeated. The analysis also produces action items and who is responsible for each.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5secureseaux', 'Network security', 'Au terme du cours, vous serez en mesure d''identifier les vulnérabilités et les risques auxquels les réseaux informatiques sont exposés, de choisir et de déployer les contre-mesures appropriées pour augmenter la sécurité du réseau de l''entreprise et le protéger contre les menaces internes et externes.', 'Network security protocols are a type network protocol that ensures the security and integrity of data in transit over a network connection. Network security protocols define the processes and methodology to secure network data from any illegitimate attempt to review or extract the contents of data.');
INSERT INTO `SYLLABUS` VALUES('ZZ3F5archirsecu', 'Architecture of a secure network', 'Connaître les caractéristiques d''une architecture sécurisée et savoir les prendre en compte dans le cadre d''architectures spécifiques. Sécuriser les architectures courantes en entreprise. Évaluer la sécurité d''une architecture.', 'Cybersecurity architecture, also known as “network security architecture”, is a framework that specifies the organizational structure, standards, policies and functional behavior of a computer network, including both security and network features.'); 

-- Insertion dans la table COURSFILIERES

-- F1
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1liembarque', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1sysembarque', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1semsysexembarque', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1archiavancée', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1capteurs', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1design', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1traitnumdusign', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1trdonnsecu', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1imagvisio', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1robot', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1realvirtuelle', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1realvimersive', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F1cyberautomatique', 1);

-- F2
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2sysexps', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2swnet', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2ergdesihm', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2devnet', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2devappweb', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2archlogqual', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2simu', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2outilsad', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2cdprojet', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2ddbdd', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F2setsi', 2);

-- F3
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3setsi', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3odmsien', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3aletq', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3devweb', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3ddbdd', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3fdbdd', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3simuafluxd', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3modpralea', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3analfdd', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3oad', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F3rechoper', 3);

-- F4
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4modpralea', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4apstat', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4efinis', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4intedist', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4rechoper', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4stat', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4optim', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4bddetfdd', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4imagvisio', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4mecasolid', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4mddifffini', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F4matlab', 4);

-- F5
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5certifindu', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5secprotres', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5sysexps', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5swnet', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5cloud', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5intcwebd', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5secuweb', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5analmalw', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5secuoc', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5sasr', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5pentest', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ2F5trdonnsecu', 5);

-- COURSFILIERES de ZZ3
-- F1
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1pam', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1sse', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1pFPGAVHDL', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1ptr', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1prGPGPU', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1ram', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1ga', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1icr', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1cc', 1);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F1rm', 1);

-- F2
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2secureseaux', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2conceparchi', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2pam', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2imsimul', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2algocparall', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2prgcc', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2ram', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2infograph', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2algoaad', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2flog', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2rm', 2);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F2javaprof', 2);

-- F3
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3mgicl', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3oracleapp', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3pam', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3inteapp', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3webserv', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3sysinfo', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3adbdd', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3algoaad', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3bigdata', 3);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F3evaloptisys', 3);

-- F4
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4ecro', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4optisyscomp', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4prognonlin', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4opticonv', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4edp', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4mecasolid', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4mddd', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4elemdecao', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4algocparall', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4introdatasc', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4cgljava', 4);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F4ram', 4);

-- F5
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5certifindu', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5routage', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5dbmanage', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5devwebjee', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5techdc', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5intcwebd', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5pam', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5thcodecrypto', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5polidesecu', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5analpostm', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5secureseaux', 5);
INSERT INTO `COURSFILIERES` VALUES('ZZ3F5archirsecu', 5);


-- Insertion dans la table COURSENSEIGNANTS
-- COURSENSEIGNANTS de ZZ1

INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV1Angl', 'jeverdier',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV1Angl', 'memiln',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV1Angl', 'mablanchet',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV2All', 'evhassinger',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV2Esp', 'magarcia',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV2Jap', 'aychinonakano',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV2chi', 'yizheng',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1LV2ita', 'mysimona',0,0,26);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1shscomm', 'mumouzat',0,0,22);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ1manage','frcassiere',26,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('infolangc','loyon',0,32,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('infolangc','hupeytavin',0,32,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('infolangc','jjli',0,32,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('infoalgo','michabrol',0,70,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('infoalgo','viantoine',0,70,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('infoalgo','jjli',0,70,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('infoprogfonc','yvesdaniel',0,12,14);
INSERT INTO `COURSENSEIGNANTS` VALUES('infoprogfonc','clmazel',0,12,14);
INSERT INTO `COURSENSEIGNANTS` VALUES('infoautom','clmazel',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('infoautom','anwagler',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('infocybersecu','palaurencot',22,0,6);
INSERT INTO `COURSENSEIGNANTS` VALUES('infocybersecu','micheminant',22,0,6);
INSERT INTO `COURSENSEIGNANTS` VALUES('infosysexpl','brguillon',12,0,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('infosysexpl','mykang',0,0,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('infosysexpl','jjli',0,0,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('infobdd','mapailloux',0,20,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('infobdd','mykang',0,20,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('infobdd','mabouet',0,20,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('siphys', 'edcouet',0,26,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('sitransmdo', 'chtilmant',0,26,24);
INSERT INTO `COURSENSEIGNANTS` VALUES('sitransmdo', 'micheminant',0,26,24);
INSERT INTO `COURSENSEIGNANTS` VALUES('sitraitsignal', 'chtilmant',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('sitraitsignal', 'micheminant',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('sicsn','emmesnard',0,26,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('sicsn','roaufrere',0,26,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('siautomat','roaufrere',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('siautomat','micheminant',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathstg','chlaforest',0,26,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathstg','makante',0,26,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsproba','clmazel',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsproba','jegayon',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsanalnum','vibarra',0,26,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsanalnum','jokoko',0,26,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsanalnum','vietnguyen',0,26,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathscalcul','gileborgne',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathscalcul','amchofri',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathscalcul','bealbert',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsproglineaire','hekerivin',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsproglineaire','aulagoutte',0,26,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsanaldonnées','viantoine',0,14,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('mathsanaldonnées','vibarra',0,14,0);

-- COURSENSEIGNANTS de ZZ2
-- Tronc Commun

INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCLV1Angl', 'arsusan',0,0,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCLV2All', 'evhassinger',0,0,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCLV2Esp', 'frgodeart',0,0,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCLV2Jap', 'aychinonakano',0,0,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCLV2chi', 'yizheng',0,0,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCLV2ita','mysimona',0,0,40);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCshscomm', 'mumouzat',0,0,16);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCshsdroit','mealbaret',16,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCshsgestion','jemaurin',20,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCshsprojet','molefevre',6,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCcplus','loyon',20,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCcplus','lupastor',0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCcplus','yvesdaniel',0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCcplus','alpereda',0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCuml','aumonbelli',10,0,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCjava','loyon',0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCiot','papinault',12,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2TCreseau','palaurencot',10,0,10);

-- F1
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1liembarque','jolaconte',0,10,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1sysembarque','emmesnard',0,30,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1semsysexembarque','jevial',0,18,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1archiavancée','emmesnard',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1capteurs','edcouet',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1design','micheminant',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1traitnumdusign','jolaconte',0,8,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1trdonnsecu','micheminant',8,0,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1imagvisio','ceteuliere',10,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1robot','roaufrere',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1robot','malabussiere',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1realvirtuelle','emmesnard',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1realvimersive','emmesnard',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1cyberautomatique','roaufrere',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F1cyberautomatique','malabussiere',0,10,10);

-- F2
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2sysexps','jegagnet',10,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2swnet','pachevillot',0,30,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2ergdesihm','marobin',0,18,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2devnet','molaurent',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2devappweb','becaure',0,15,15);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2archlogqual','dahill',8,0,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2simu','dahill',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2outilsad','phlacomme',20,0,16);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2cdprojet','tajouve',0,18,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2ddbdd','mapailloux',10,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F2setsi','Thlefaure',16,0,0);

-- F3
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3setsi','Thlefaure',16,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3odmsien','odgoutet',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3aletq','dahill',8,0,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3devweb','becaure',0,6,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3ddbdd','mapailloux',10,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3fdbdd','mapailloux',0,30,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3simuafluxd','phlacomme',0,18,24);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3modpralea','jegayon',18,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3analfdd','mapailloux',0,20,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3oad','phlacomme',20,0,16);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F3rechoper','phlacomme',0,12,12);

-- F4
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4modpralea','jegayon',18,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4apstat','vibarra',0,24,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4efinis','gileborgne',0,40,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4intedist','gileborgne',0,40,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4rechoper','anwagler',0,34,4);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4stat','viantoine',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4optim','jokoko',0,12,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4bddetfdd','mapailloux',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4imagvisio','ceteuliere',10,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4mecasolid','pibeaurepaire',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4mddifffini','jokoko',0,16,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F4matlab','jokoko',0,0,20);

-- F5
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5certifindu','palaurencot',0,12,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5secprotres','palaurencot',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5sysexps','jegagnet',10,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5swnet','pachevillot',0,30,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5cloud','anplantin',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5intcwebd','jausson',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5secuweb','vimazenod',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5analmalw','Brmarquet',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5secuoc','chtilmant',0,40,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5sasr','gighalhoub',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5pentest','Radubourgnoux',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ2F5trdonnsecu','micheminant',8,0,12);

-- COURSENSEIGNANTS de ZZ3
-- Tron Commun
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCLV1Angl','arsusan', 0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCLV2All','evhassinger', 0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCLV2Esp','frgodeart', 0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCLV2Jap','aychinonakano', 0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCLV2chi','yizheng', 0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCLV2ita','mysimona', 0,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCshscomm','mumouzat', 10,0,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCshsdroit','mealbaret', 14,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCinteconomique','micheminant', 10,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCeddd','dahill', 18,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3TCeddd','vimazenod', 2,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3managproj','mapailloux', 0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3managproj','palaurencot', 0,20,0);

-- F1
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1pam','odgoutet',6,10,24);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1sse','dasauveron',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1pFPGAVHDL','frberry',0,30,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1ptr','jolaffont',0,10,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1prGPGPU','rofaury',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1ram','ceteuliere',0,30,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1ga','makante',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1icr','lamalatere',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1cc','micheminant',0,5,5);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1cc','chtilmant',0,5,5);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F1rm','roaufrere',0,20,10);

-- F2
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2secureseaux','palaurencot',6,0,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2conceparchi','cadioudonnat',0,18,18);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2pam','odgoutet',6,0,24);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2imsimul','dahill',0,12,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2algocparall','jokoko',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2prgcc','anmahul',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2ram','vibarra',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2infograph','pacolomb',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2algoaad','dahill',0,16,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2flog','daraynaud',8,0,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2rm','brguillon',12,0,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F2javaprof','axroux',0,10,10);

-- F3
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3mgicl','phlacomme',0,34,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3oracleapp','mapailloux',0,12,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3pam','jofontanel',0,20,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3inteapp','pacolomb',10,0,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3webserv','odcoupelon',0,10,10);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3sysinfo','rojacquelin',0,14,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3adbdd','mapailloux',0,20,20);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3algoaad','kafarias',20,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3bigdata','rasilveiracosta',0,6,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F3evaloptisys','phlacomme',0,10,8);

-- F4
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4ecro','anwagler',30,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4optisyscomp','anwagler',20,0,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4prognonlin','jokoko',0,16,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4opticonv','jokoko',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4edp','gileborgne',0,40,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4mecasolid','pibeaurepaire',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4mddd','jokoko',0,8,4);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4elemdecao','lasabourin',0,15,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4algocparall','jokoko',14,0,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4introdatasc','rasilveiracosta',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4cgljava','loyon',0,16,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F4ram','vibarra',0,20,0);

-- F5
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5certifindu','palaurencot',0,16,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5routage','palaurencot',0,12,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5dbmanage','brguillon',12,0,12);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5devwebjee','loyon',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5techdc','odgoutet',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5intcwebd','boroziere',0,20,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5pam','odgoutet',6,0,24);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5thcodecrypto','chtilmant',0,28,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5polidesecu','pafraustot',0,16,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5analpostm','jolaffont',0,18,0);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5secureseaux','palaurencot',6,0,8);
INSERT INTO `COURSENSEIGNANTS` VALUES('ZZ3F5archirsecu','lebreuil',0,6,24);


-- Ces deux TRIGGERS vérifient qu'à chaque insertion ou modification de la 
-- table ENSEIGNANT; chaque enseignant extérieur ait son champ statut à NULL
-- et chaque enseignant permanent ait son champ organisme à NULL
DROP TRIGGER IF EXISTS BEFORE_INSERT_ENSEIGNANT;
DELIMITER //
CREATE TRIGGER BEFORE_INSERT_ENSEIGNANT
BEFORE INSERT ON ENSEIGNANT FOR EACH ROW
BEGIN
  IF NEW.type_enseignant = 'Permanent' THEN SET NEW.organisme = NULL;
  ELSE SET NEW.statut = NULL;
  END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS BEFORE_UPDATE_ENSEIGNANT;
DELIMITER //
CREATE TRIGGER BEFORE_UPDATE_ENSEIGNANT
BEFORE UPDATE ON ENSEIGNANT FOR EACH ROW
BEGIN
  IF NEW.type_enseignant = 'Permanent' THEN SET NEW.organisme = NULL;
  ELSE SET NEW.statut = NULL;
  END IF;
END //
DELIMITER ;


-- Ces deux TRIGGERS permettent de garantir que les responsables de filières
-- sont tous des enseignants permanents
DROP TRIGGER IF EXISTS BEFORE_INSERT_FILIERE;
DELIMITER //
CREATE TRIGGER BEFORE_INSERT_FILIERE
BEFORE INSERT ON FILIERE FOR EACH ROW
BEGIN
  DECLARE type1 VARCHAR(10);
  DECLARE type2 VARCHAR(10);

  SELECT type_enseignant INTO type1
  FROM ENSEIGNANT 
  WHERE ENSEIGNANT.idEnseignant = NEW.resp1Filiere;

  SELECT type_enseignant INTO type2
  FROM ENSEIGNANT 
  WHERE ENSEIGNANT.idEnseignant = NEW.resp2Filiere;

  IF type1 = 'EXTERIEUR' OR type2 = 'EXTERIEUR'
  THEN SIGNAL SQLSTATE '45000';
  END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS BEFORE_UPDATE_FILIERE;
DELIMITER //
CREATE TRIGGER BEFORE_UPDATE_FILIERE
BEFORE UPDATE ON FILIERE FOR EACH ROW
BEGIN
  DECLARE type1 VARCHAR(10);
  DECLARE type2 VARCHAR(10);

  SELECT type_enseignant INTO type1
  FROM ENSEIGNANT 
  WHERE ENSEIGNANT.idEnseignant = NEW.resp1Filiere;

  SELECT type_enseignant INTO type2
  FROM ENSEIGNANT 
  WHERE ENSEIGNANT.idEnseignant = NEW.resp2Filiere;

  IF type1 = 'EXTERIEUR' OR type2 = 'EXTERIEUR'
  THEN SIGNAL SQLSTATE '45000';
  END IF;
END //
DELIMITER ;


-- Fonction 
DELIMITER //
CREATE FUNCTION CALCUL_TOTAL_HEURES(id_enseignant varchar(20))
  RETURNS INT(4)
BEGIN
  DECLARE resultat INT(4) DEFAULT 0;
  SELECT IFNULL(SUM(nbCM)+SUM(nbTD)+SUM(nbTP),0) INTO resultat
  FROM COURSENSEIGNANTS
  WHERE idEnseignant = id_enseignant;
  RETURN resultat;
END//
DELIMITER ;


-- Procedure
DROP PROCEDURE IF EXISTS LISTE_DES_COURS; 
DELIMITER // 
CREATE PROCEDURE LISTE_DES_COURS(id_enseignant varchar(20)) 
BEGIN 
  DECLARE v_cours_list VARCHAR(1000) DEFAULT '';
  DECLARE v_cours VARCHAR(50); 
  DECLARE done INT DEFAULT FALSE;  
  DECLARE c_cours CURSOR FOR 
    SELECT nomCours 
    FROM COURSENSEIGNANTS JOIN COURS ON COURSENSEIGNANTS.idCours = COURS.idCours
    WHERE COURSENSEIGNANTS.idEnseignant = id_enseignant; 
  DECLARE CONTINUE HANDLER FOR NOT FOUND 
    SET done=TRUE; 
  OPEN c_cours; 
  loop_cours: LOOP 
    FETCH c_cours INTO v_cours; 
    IF done THEN LEAVE loop_cours; 
    END IF; 
    SET v_cours_list = CONCAT(v_cours_list,v_cours,', '); 
  END LOOP; 
  CLOSE c_cours; 
  SELECT v_cours_list; 
END//
DELIMITER ;