--
-- File generated with SQLiteStudio v3.1.1 on Szo okt. 7 23:21:16 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Felhasznalo
CREATE TABLE Felhasznalo (
    id             INT (10)      PRIMARY KEY
                                 NOT NULL,
    nev            VARCHAR (50)  NOT NULL,
    felhasznalonev VARCHAR (20)  NOT NULL,
    jelszo         VARCHAR (20)  NOT NULL,
    email          VARCHAR (100) NOT NULL
);

INSERT INTO Felhasznalo (
                            id,
                            nev,
                            felhasznalonev,
                            jelszo,
                            email
                        )
                        VALUES (
                            0,
                            'Schneider Norbert',
                            'nobe1996',
                            'asd123',
                            'schneider.norbert96@gmail.com'
                        );


-- Table: Kolcsonzes
CREATE TABLE Kolcsonzes (
    kolcs_id      INT (10) PRIMARY KEY
                           NOT NULL,
    felh_id       INT (10) REFERENCES Felhasznalo (id) ON DELETE SET NULL
                                                       ON UPDATE CASCADE
                           NOT NULL,
    konyv_isbn    INT (13) REFERENCES Konyv (isbn) ON DELETE SET NULL
                                                   ON UPDATE CASCADE
                           NOT NULL,
    kolcs_datum   DATE,
    kolcs_lejarat DATE
);

INSERT INTO Kolcsonzes (
                           kolcs_id,
                           felh_id,
                           konyv_isbn,
                           kolcs_datum,
                           kolcs_lejarat
                       )
                       VALUES (
                           0,
                           0,
                           9789634058045,
                           '2017.10.07',
                           '2017.10.21'
                       );


-- Table: Konyv
CREATE TABLE Konyv (
    isbn               INT (13)      PRIMARY KEY
                                     NOT NULL,
    cim                VARCHAR (150) NOT NULL,
    kategoria          VARCHAR (100),
    darab              INT (5),
    leiras             VARCHAR (255),
    kolcsonzesek_szama INT (5),
    feltoltes_datuma   DATE          NOT NULL
);

INSERT INTO Konyv (
                      isbn,
                      cim,
                      kategoria,
                      darab,
                      leiras,
                      kolcsonzesek_szama,
                      feltoltes_datuma
                  )
                  VALUES (
                      9789634058045,
                      'Stephen King: AZ',
                      'thriller',
                      10,
                      'Bohócos vicces könyvecske.',
                      0,
                      '2017.10.07'
                  );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
