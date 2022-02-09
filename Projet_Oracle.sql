
PROJET:ADMINISTRATION DES BASES DE DONNEES ORACLE 10G

				TP N°1

I-/

1.	CREATE USER Gest_Vols  IDENTIFIED BY password;
	GRANT DBA TO Gest_Vols;

2.	CONNECT Gest_Vols/password;

	CREATE TABLE Pilote (
		NP  NUMBER PRIMARY KEY,
		Nom  VARCHAR2(25),
		Dnaiss  DATE,
		Adr  VARCHAR2(40),
		Tel  NUMBER(10),
		Salaire  NUMBER(7),
		Age  NUMBER(2)
	);

	CREATE TABLE Avion (
		NA NUMBER PRIMARY KEY,
		Nom VARCHAR2(12),
		Capacite NUMBER(6),
		Localite VARCHAR2(10),
		Remarq VARCHAR2(100)
	);

	CREATE TABLE Vol(
		NV NUMBER(6) PRIMARY KEY,
		NP NUMBER, 
		NA NUMBER,
		VD VARCHAR2(10),
		VA VARCHAR(10),
		HD NUMBER,
		HA NUMBER,
		DATE_VOL DATE
		CONSTRAINT Fk_Pilote FOREIGN KEY(NP) REFERENCES Pilote(NP),
		CONSTRAINT Fk_Avion  FOREIGN KEY(NA) REFERENCES Avion(NA)
	);

3. 	INSERT INTO Pilote VALUES(1, 'Miranda', '18-08-52','Sophia-Antipolis', '93548254', 18009.0,50);
	INSERT INTO Pilote VALUES(2, 'St-exupery', '16-10-32', 'Lyon', '91548254', 12300.0,50);
	INSERT INTO Avion VALUES(1, 'A300', 300, 'Nice', 'En service');   
	INSERT INTO Avion VALUES(2, 'A300', 300, 'Nice', 'En service'); 
	INSERT INTO Vol VALUES(100, 1,1,'Nice', 'Paris', '1345', '1500','3-03-89' );  
	INSERT INTO Vol VALUES(110, 3,6,'Nice', 'Toulouse', '1230', '1325','6-03-89' );       



II-/

	1. INSERT INTO Avion VALUES(100, 'AIRBUS', 300, 'LOME', 'En service');
	   INSERT INTO Avion VALUES(101, 'B737', 250, 'CASA', 'En service');
	   INSERT INTO Avion VALUES(102, 'B737', 220, 'DAKAR', 'En service');

	2. DELETE FROM Pilote WHERE NP=5;
	 	DELETE FROM Pilote WHERE NP=10;

	3.  UPDATE Pilote SET Salaire=Salaire+Salaire*0.25 WHERE NP=20;

	4. UPDATE Pilote SET Salaire=Salaire-Salaire*0.11 WHERE NP=15;

 III-/ Requêtes


 	1. SELECT * FROM Avion;

 	2. SELECT * FROM Avion ORDER BY Nom ASC;

 	3. SELECT Nom, Capacite FROM Avion;

 	4. SELECT DISTINCT(Localite) FROM Avion;

 	5. SELECT Vol.NV NumVol, Avion.NA NumAvions, Pilote.Nom NomPilotes FROM Vol v, Avion a, Pilote p WHERE v.NV = p.NP; 

 	6. SELECT * FROM Avion WHERE Localite='LOME' OR Localite='CASA';

 	7. UPDATE Avion SET Capacite=220 WHERE NA=101;

 	8. DELETE FROM Avion WHERE Capacite<200;

 	9. SELECT MIN(Capacite) MINIMAL, MAX(Capacite) MAXIMAL, AVG(Capacite) MOYENNE FROM Avion;

 	10. SELECT * FROM Avion WHERE Capacite=MIN(Capacite);

 	11. SELECT * FROM Avion WHERE Capacite>AVG(Capacite);

 	12. SELECT Nom, Adr FROM Pilote, Vol WHERE Pilote.NP=Vol.NP AND NV='IT100' AND NV='IT104';

 	13. SELECT NP FROM Vol; 

 	14. SELECT NP FROM Pilote WHERE NP NOT IN ( SELECT NP FROM Vol);

 	15. SELECT Pilote.Nom FROM Pilote, Vol, Avion WHERE Pilote.NP=Vol.NP AND Avion.NA=Vol.NA AND Avion.Nom='AIRBUS'; 
 		


 					TP N°2