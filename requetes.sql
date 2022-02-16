
		TP N°1

CREATE USER Gest_Vols  IDENTIFIED BY password;
	GRANT DBA TO Gest_Vols;

CONNECT Gest_Vols/password;

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
		DATE_VOL DATE,
		CONSTRAINT Fk_Pilote FOREIGN KEY(NP) REFERENCES Pilote(NP),
		CONSTRAINT Fk_Avion  FOREIGN KEY(NA) REFERENCES Avion(NA)
	);



	INSERT INTO Pilote VALUES(1, 'Miranda', '18-08-52','Sophia-Antipolis', '93548254', 18009.0,50);
	INSERT INTO Pilote VALUES(2, 'St-exupery', '16-10-32', 'Lyon', '91548254', 12300.0,50);
	INSERT INTO Avion VALUES(1, 'A300', 300, 'Nice', 'En service');   
	INSERT INTO Avion VALUES(2, 'A300', 300, 'Nice', 'En service'); 
	INSERT INTO Vol VALUES(100, 1,1,'Nice', 'Paris', '1345', '1500','3-03-89' );  
	INSERT INTO Vol VALUES(110, 3,6,'Nice', 'Toulouse', '1230', '1325','6-03-89' );       

	INSERT INTO Vol Values(100, 1,1,'Nice', 'Paris', '1345', '1500','3-03-89' );  
	INSERT INTO Vol Values(110, 3,6,'Nice', 'Toulouse', '1230', '1325','6-03-89' );     
	INSERT INTO Vol Values(120,4,3,'Nice', 'Paris', '0745', '0900','21-06-89' );    
	INSERT INTO Vol Values(125, 12,6,'Paris', 'Nice', '1330', '1845','10-01-89' );     
	INSERT INTO Vol Values(130, 4,8,'Toulouse', 'Beauvais', '0630','0750', '27-03-89' );    
	INSERT INTO Vol Values(111, 5,3,'Nice', 'Paris', '0800', '0920','4-DEC-89' );    
	INSERT INTO Vol Values(135, 8,5,'Paris', 'Toulouse', '1200','1320','22-03-89' );     
	INSERT INTO Vol Values(140, 14,9,'Lyon', 'Nice', '0700', '0750','4-06-89' );    
	INSERT INTO Vol Values(150, 1,1,'Paris', 'Nantes','1630', '1725','28-03-89' );    
	INSERT INTO Vol Values(153, 2,3,'Lyon', 'Nice', '1210', '1300','6-11-89' );   
	INSERT INTO Vol Values(156, 9,2,'Paris', 'Lyon', '0230', '0320','14-01-89' );   
	INSERT INTO Vol Values(200, 5,3,'Nice', 'Toulouse', '2030', '2125','17-06-89' );    
	INSERT INTO Vol Values(210, 14,7,'Nice', 'Nantes', '1430', '1525','14-10-89' );     
	INSERT INTO Vol Values(236, 8,4,'Lyon', 'Toulouse', '2130', '2250','15-10-89' );    
	INSERT INTO Vol Values(240, 13,10, 'Nice', 'Paris', '2300', '2355','19-11-89' );     
	INSERT INTO Vol Values(250, 13,4,'Bordeaux', 'Paris', '2300','2355', '25-12-89' );   
	INSERT INTO Vol Values(260, 13,5,'Bordeaux', 'Paris', '2300','2355', '30-11-89' );    
	INSERT INTO Vol Values(270, 13,9,'Paris', 'New york', '1400','2300', '3-01-89' );    
	INSERT INTO Vol Values(280, 8,9,'Nice', 'Mulhouse', '1200','1320','21-03-89' );     
	INSERT INTO Vol Values(290, 3,8,'Beauvais', 'Marseille', '1230','1425', '9-03-89' );  


	INSERT INTO Avion VALUES(100, 'AIRBUS', 300, 'LOME', 'En service');
	INSERT INTO Avion VALUES(101, 'B737', 250, 'CASA', 'En service');
	INSERT INTO Avion VALUES(102, 'B737', 220, 'DAKAR', 'En service');

	DELETE FROM Pilote WHERE NP=5;
	DELETE FROM Pilote WHERE NP=10;

	UPDATE Pilote SET Salaire=Salaire+Salaire*0.25 WHERE NP=20;

	UPDATE Pilote SET Salaire=Salaire-Salaire*0.11 WHERE NP=15;


 	SELECT * FROM Avion;

 	SELECT * FROM Avion ORDER BY Nom ASC;

 	SELECT Nom, Capacite FROM Avion;

 	SELECT DISTINCT(Localite) FROM Avion;

 	SELECT Vol.NV NumVol, Avion.NA NumAvions, Pilote.Nom NomPilotes FROM Vol v, Avion a, Pilote p WHERE v.NV = p.NP; 

 	SELECT * FROM Avion WHERE Localite='LOME' OR Localite='CASA';

 	UPDATE Avion SET Capacite=220 WHERE NA=101;

 	DELETE FROM Avion WHERE Capacite<200;

 	SELECT MIN(Capacite) MINIMAL, MAX(Capacite) MAXIMAL, AVG(Capacite) MOYENNE FROM Avion;

 	SELECT * FROM Avion WHERE Capacite=MIN(Capacite);

 	SELECT * FROM Avion WHERE Capacite>AVG(Capacite);

 	SELECT Nom, Adr FROM Pilote, Vol WHERE Pilote.NP=Vol.NP AND NV='IT100' AND NV='IT104';

 	SELECT NP FROM Vol; 

 	SELECT NP FROM Pilote WHERE NP NOT IN ( SELECT NP FROM Vol);

 	SELECT Pilote.Nom FROM Pilote, Vol, Avion WHERE Pilote.NP=Vol.NP AND Avion.NA=Vol.NA AND Avion.Nom='AIRBUS'; 
 		
 ~---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


 				TP N°2



 	DESCRIBE DICT;
	SELECT * FROM DICT;
	DESCRIBE ALL_CATALOG;
	DESCRIBE ALL_USERS;
	DESCRIBE ALL_COL_COMMENTS;
	DESCRIBE ALL_CONSTRAINTS;
	DESCRIBE ALL_TAB_PRIVS;
	SELECT OBJECT_TYPE, COUNT(*) FROM DBA_OBJECTS GROUP BY OBJECT_TYPE ORDER BY COUNT(*) DESC;
	SELECT COUNT(*) FROM ALL_CATALOG;
	SELECT COUNT(*) FROM ALL_VIEWS;
	SELECT COUNT(*) FROM ALL_TABLES;
	SELECT COUNT(*) FROM ALL_SYNONYMS;
	SELECT COUNT(*) FROM ALL_SEQUENCES;
	DESCRIBE USER_USERS;
	SELECT username, password  FROM DBA_USERS;
	SELECT USER FROM DUAL;
	SELECT COUNT(*) FROM ALL_CATALOG;
	SELECT COUNT(*) FROM USER_CATALOG;
	DESCRIBE ALL_CATALOG;
	DESCRIBE USER_CATALOG;
	SELECT owner, table_name FROM ALL_TABLES;


				TP N°3


	CONNECT sys/toor as sysdba;
 	CREATE USER User_Oracle10G IDENTIFIED BY Oracle10G;
 	GRANT DBA TO User_Oracle10G;
 	ALTER USER User_Oracle10G IDENTIFIED BY SYSOracle10G;
	ALTER USER User_Oracle10G ACCOUNT LOCK;
	ALTER USER User_Oracle10G ACCOUNT UNLOCK;
