CREATE TABLE IF NOT EXISTS Utilisateur
(
	idUtilisateur INTEGER NOT NULL PRIMARY KEY,
	nom VARCHAR(25) NOT NULL,
	prenom VARCHAR(25) NOT NULL,
	email VARCHAR(200) NOT NULL UNIQUE,
	motDePasse VARCHAR(64) NOT NULL, -- Un VARCHAR de longueur 64 pour contenir un mot de passe hashé avec l'algorithme SHA-256.
	role ENUM('Utilisateur', 'Administrateur') NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Gestionnaire
(
	idGestionnaire INTEGER NOT NULL PRIMARY KEY,
	CONSTRAINT FK_Gestionnaire_Utilisateur FOREIGN KEY (idGestionnaire) REFERENCES Utilisateur(idUtilisateur) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Tournoi
(
	idTournoi INTEGER NOT NULL PRIMARY KEY,
	nom VARCHAR(25) NOT NULL,
	dateDeb DATE NOT NULL,
	duree INTEGER NOT NULL,
	idGestionnaire INTEGER NOT NULL,
	lieu TEXT NOT NULL,
	nombreTotalEquipes INTEGER NOT NULL,
	CONSTRAINT FK_Tournoi_Gestionnaire FOREIGN KEY (idGestionnaire) REFERENCES Gestionnaire(idGestionnaire) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Type
(
	idType INTEGER NOT NULL PRIMARY KEY,
	idTournoi INTEGER NOT NULL,
	typeTournoi ENUM('Coupe','Championnat','Tournoi') DEFAULT NULL,
	CONSTRAINT FK_Type_Tournoi FOREIGN KEY (idTournoi) REFERENCES Tournoi(idTournoi) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Equipe
(
	idEquipe INTEGER NOT NULL PRIMARY KEY,
	nomEquipe VARCHAR(25) NOT NULL UNIQUE,
	niveau INTEGER DEFAULT 0,
	adresse VARCHAR(50) NOT NULL UNIQUE,
	numTel VARCHAR(15) NOT NULL UNIQUE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS EquipeTournoi
(
	idEquipe INTEGER NOT NULL,
	idTournoi INTEGER NOT NULL,
	estInscrite BOOLEAN DEFAULT FALSE,
	CONSTRAINT PK_EquipeTournoi PRIMARY KEY (idEquipe, idTournoi),
	CONSTRAINT FK_EquipeTournoi_Equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_EquipeTournoi_Tournoi FOREIGN KEY (idTournoi) REFERENCES Tournoi(idTournoi) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Joueur
(
	idJoueur INTEGER NOT NULL PRIMARY KEY,
	idEquipe INTEGER NOT NULL,
	estCapitaine BOOLEAN NOT NULL,
	CONSTRAINT FK_Joueur_Utilisateur FOREIGN KEY (idJoueur) REFERENCES Utilisateur(idUtilisateur) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Joueur_Equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS MatchT
(
	idMatchT INTEGER NOT NULL PRIMARY KEY,
	idTournoi INTEGER NOT NULL,
	date DATE NOT NULL,
	horaire TIME NOT NULL,
	CONSTRAINT FK_MatchT_Tournoi FOREIGN KEY (idTournoi) REFERENCES Tournoi(idTournoi) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS EquipeMatchT
(
	idEquipe INTEGER NOT NULL,
	idMatchT INTEGER NOT NULL,
	score INTEGER NOT NULL,
	CONSTRAINT PK_EquipeMatchT PRIMARY KEY (idEquipe, idMatchT),
	CONSTRAINT FK_EquipeMatchT_Equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_EquipeMatchT_MatchT FOREIGN KEY (idMatchT) REFERENCES MatchT(idMatchT) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Poule
(
	idPoule INTEGER NOT NULL PRIMARY KEY,
	idTournoi INTEGER NOT NULL,
	nbEquipes INTEGER NOT NULL,
	CONSTRAINT FK_Poule_Tournoi FOREIGN KEY (idTournoi) REFERENCES Tournoi(idTournoi) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS EquipePoule
(
	idEquipe INTEGER NOT NULL,
	idPoule INTEGER NOT NULL,
	CONSTRAINT PK_EquipePoule PRIMARY KEY (idEquipe, idPoule),
	CONSTRAINT FK_EquipePoule_Equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_EquipePoule_Poule FOREIGN KEY (idPoule) REFERENCES Poule(idPoule) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS MatchPoule
(
	idEquipe INTEGER NOT NULL,
	idMatchT INTEGER NOT NULL,
	score INTEGER NOT NULL,
	CONSTRAINT PK_MatchPoule PRIMARY KEY (idEquipe, idMatchT),
	CONSTRAINT FK_MatchPoule_EquipePoule FOREIGN KEY (idEquipe) REFERENCES EquipePoule(idEquipe) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_MatchPoule_MatchT FOREIGN KEY (idMatchT) REFERENCES MatchT(idMatchT) ON UPDATE CASCADE ON DELETE CASCADE
) DEFAULT CHARSET=utf8;

INSERT INTO Utilisateur VALUES
(1, 'ADMIN', 'Admin', 'admin@test.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Administrateur'),
(2, 'DUJARDIN', 'Jean', 'JeanDujardin@test.com', '4ff17bc8ee5f240c792b8a41bfa2c58af726d83b925cf696af0c811627714c85', 'Utilisateur'),
(3, 'Machin', 'Truc', 'M@T.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(4, 'Jean', 'Dupont', 'J@D.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(5, 'Henri', 'Guibet', 'H@G.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(6, 'Louis', 'De Funès', 'L@F.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(7, 'Jean', 'Gabin', 'J@G.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(8, 'Robert', 'Redford', 'R@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(9, 'Lino', 'Ventura', 'L@V.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(10, 'Francis', 'Blanche', 'F@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(11, 'Venantino', 'Venantini', 'V@V.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(12, 'Jean', 'Lefevre', 'J@L.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(13, 'Bernard', 'Blier', 'B@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(14, 'Line', 'Renaud', 'L@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(15, 'Jean-Pierre', 'Marielle', 'JP@M.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(16, 'Jean', 'Rochefort', 'J@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(17, 'Jean-Pierre', 'Belmondo', 'JP@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(18, 'Philippe', 'Noiret', 'P@N.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(19, 'Claude', 'Rich', 'C@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(20, 'Guy', 'Bedos', 'G@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(21, 'Claude', 'Brasseur', 'C@B.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(22, 'Pierre', 'Richard', 'P@R.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur'),
(23, 'Mireille', 'Darc', 'M@D.com', '74913f96f46a13995ef292f85deffae7b86a35d5d3180a5581b04b12b7b30245', 'Utilisateur');

INSERT INTO Gestionnaire VALUES
(2),
(14),
(16);

INSERT INTO Equipe VALUES
(1, 'NULLA', 0, 'Une adresse 1', '11-11-11-11-11-'),
(2, 'NULLB', 0, 'Une adresse 2', '22-22-22-22-22'),
(3, 'MARSEILLE', 0, 'Une adresse 3', '03-04-03-04-03'),
(4, 'LYON', 0, 'Une adresse 4', '04-05-04-05-04'),
(5, 'ST-ETIENNE', 0, 'Une adresse 5', '05-06-05-06-05'),
(6, 'FC BARCELONA', 0, 'Une adresse 7', '02-03-02-03-06'),
(7, 'LIVERPOOL', 0, 'Une adresse 8', '03-04-03-04-07'),
(8, 'CHELSEA', 0, 'Une adresse 9', '04-05-04-05-08'),
(9, 'MANCHESTER', 0, 'Une adresse 10', '05-06-05-06-09'),
(10, 'PSG', 0, 'Une adresse 11', '01-02-01-02-01'),
(11, 'BORDEAUX', 0, 'Une adresse 12', '02-03-02-03-02'),
(12, 'Gods', 0, 'Une adresse 666', '66-66-66-66-66');

INSERT INTO Joueur VALUES
(2, 10, 1),
(3, 10, 0),
(4, 10, 0),
(5, 11, 1),
(6, 11, 0),
(7, 11, 0),
(8, 3, 1),
(9, 3, 0),
(10, 3, 0),
(11, 4, 1),
(12, 4, 0),
(13, 4, 0);

INSERT INTO Tournoi VALUES
(1, 'COUPE DU MONDE', '2012-12-12', 50, 2, 'Paris (48.859;2.347)', 8),
(3, 'OPEN TENNIS 4', '2021-05-27', 30, 14, 'Saint-Tropez (43.26285;6.658133)', 8),
(4, 'FUTUR', '2021-12-25', 100, 2, 'Carcassonne (43.227434;2.386974)', 8);

INSERT INTO EquipeTournoi VALUES
(5, 1, 1),
(5, 3, 1),
(5, 4, 1),
(6, 1, 1),
(6, 3, 1),
(6, 4, 1),
(7, 1, 1),
(7, 3, 1),
(7, 4, 1),
(8, 1, 1),
(8, 3, 1),
(8, 4, 1),
(9, 1, 1),
(9, 3, 1),
(9, 4, 1),
(10, 1, 1),
(10, 3, 1),
(10, 4, 1),
(11, 1, 1),
(11, 3, 1),
(11, 4, 1),
(12, 1, 1),
(12, 3, 1),
(12, 4, 0);

INSERT INTO MatchT VALUES
(1, 1, '2021-06-17', '23:41:00'),
(2, 1, '2021-06-17', '23:41:00'),
(3, 1, '2021-06-11', '23:41:00'),
(4, 1, '2021-05-30', '13:49:00'),
(5, 1, '2021-06-25', '23:41:00'),
(6, 1, '2021-06-30', '23:41:00'),
(7, 1, '2021-07-02', '16:31:00'),
(8, 3, '2021-06-18', '00:23:00'),
(9, 3, '2021-06-18', '00:23:00'),
(10, 3, '2021-06-18', '00:23:00'),
(11, 3, '2021-06-24', '00:23:00'),
(12, 3, '2021-06-25', '00:23:00'),
(13, 3, '2021-06-25', '00:23:00'),
(14, 3, '2021-07-02', '00:23:00');

INSERT INTO EquipeMatchT VALUES
(5, 3, 0),
(5, 11, -1),
(6, 4, 2),
(6, 11, -1),
(7, 4, 7),
(7, 6, 5),
(7, 7, 1),
(7, 10, -1),
(8, 3, 8),
(8, 6, 4),
(8, 9, -1),
(9, 2, 9),
(9, 5, 1),
(9, 8, -1),
(10, 1, 7),
(10, 8, -1),
(11, 1, 9),
(11, 5, 5),
(11, 7, 8),
(11, 9, -1),
(12, 2, 8),
(12, 10, -1);

INSERT INTO EquipeTournoi VALUES
(3, 5, 1),
(4, 5, 1),
(5, 5, 1),
(6, 5, 1),
(7, 5, 1),
(8, 5, 1),
(9, 5, 1),
(10, 5, 1);