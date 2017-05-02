-- Generado por Oracle SQL Developer Data Modeler 3.1.3.709
--   en:        2017-05-02 23:42:26 CEST
--   sitio:      Oracle Database 10g
--   tipo:      Oracle Database 10g

set echo on
spool museo_log.txt

drop user MUSEO cascade;
create user MUSEO identified by "museo";
grant create session, create table, unlimited tablespace to MUSEO;
conn MUSEO/museo

CREATE TABLE ADQUISICION 
    ( 
     idAdq INTEGER  NOT NULL , 
     metodo VARCHAR2 (30) 
    ) 
;



ALTER TABLE ADQUISICION 
    ADD CONSTRAINT "ADQUISICION PK" PRIMARY KEY ( idAdq ) ;



CREATE TABLE ARQUEOLOGIA 
    ( 
     idArq INTEGER  NOT NULL , 
     nomObj VARCHAR2 (30) , 
     peso VARCHAR2 (20) , 
     idFec INTEGER  NOT NULL , 
     idOri INTEGER  NOT NULL , 
     idCons INTEGER  NOT NULL 
    ) 
;



ALTER TABLE ARQUEOLOGIA 
    ADD CONSTRAINT "ARQUEOLOGIA PK" PRIMARY KEY ( idArq ) ;



CREATE TABLE ARTISTA 
    ( 
     idArt INTEGER  NOT NULL , 
     nomArt VARCHAR2 (30) , 
     apeArt VARCHAR2 (30) , 
     codigo INTEGER , 
     lugNac VARCHAR2 (40) , 
     fNac DATE 
    ) 
;



ALTER TABLE ARTISTA 
    ADD CONSTRAINT "ARTISTA PK" PRIMARY KEY ( idArt ) ;



CREATE TABLE BELLA_ARTE 
    ( 
     idObra INTEGER  NOT NULL , 
     nomObra VARCHAR2 (30) , 
     numInv INTEGER , 
     ubicacion VARCHAR2 (50) , 
     idArt INTEGER  NOT NULL 
    ) 
;



ALTER TABLE BELLA_ARTE 
    ADD CONSTRAINT "BELLA_ARTE PK" PRIMARY KEY ( idObra ) ;



CREATE TABLE COMPOSICION 
    ( 
     objeto INTEGER  NOT NULL , 
     material INTEGER  NOT NULL 
    ) 
;



ALTER TABLE COMPOSICION 
    ADD CONSTRAINT COMPOSICION__IDX PRIMARY KEY ( objeto, material ) ;



CREATE TABLE CONSERVACION 
    ( 
     idCons INTEGER  NOT NULL , 
     estado VARCHAR2 (30) 
    ) 
;



ALTER TABLE CONSERVACION 
    ADD CONSTRAINT "CONSERVACION PK" PRIMARY KEY ( idCons ) ;



CREATE TABLE DESCRIPCION 
    ( 
     idDes INTEGER  NOT NULL , 
     numEnt INTEGER , 
     numLib INTEGER 
    ) 
;



ALTER TABLE DESCRIPCION 
    ADD CONSTRAINT "DESCRIPCION PK" PRIMARY KEY ( idDes ) ;



CREATE TABLE ETNOLOGIA 
    ( 
     idEt INTEGER  NOT NULL , 
     fIng DATE , 
     fAdq DATE , 
     procedencia VARCHAR2 (30) , 
     idDes INTEGER  NOT NULL , 
     idAdq INTEGER  NOT NULL 
    ) 
;



ALTER TABLE ETNOLOGIA 
    ADD CONSTRAINT "ETNOLOGIA PK" PRIMARY KEY ( idEt ) ;



CREATE TABLE FECHA 
    ( 
     idFec INTEGER  NOT NULL , 
     fIng DATE , 
     fIns DATE 
    ) 
;



ALTER TABLE FECHA 
    ADD CONSTRAINT "FECHA PK" PRIMARY KEY ( idFec ) ;



CREATE TABLE MATERIAL 
    ( 
     idMat INTEGER  NOT NULL , 
     nomMat VARCHAR2 (30) 
    ) 
;



ALTER TABLE MATERIAL 
    ADD CONSTRAINT "MATERIAL PK" PRIMARY KEY ( idMat ) ;



CREATE TABLE OBJETO 
    ( 
     idObj INTEGER  NOT NULL , 
     nomObj VARCHAR2 (30) , 
     numCat INTEGER , 
     dimensiones VARCHAR2 (15) , 
     idObra INTEGER  NOT NULL , 
     idArq INTEGER  NOT NULL , 
     idEt INTEGER  NOT NULL 
    ) 
;



ALTER TABLE OBJETO 
    ADD CONSTRAINT "OBJETO PK" PRIMARY KEY ( idObj ) ;



CREATE TABLE ORIGEN 
    ( 
     idOri INTEGER  NOT NULL , 
     cultura VARCHAR2 (30) , 
     serie VARCHAR2 (30) , 
     serie_2 VARCHAR2 (30) 
    ) 
;



ALTER TABLE ORIGEN 
    ADD CONSTRAINT "ORIGEN PK" PRIMARY KEY ( idOri ) ;



CREATE TABLE TECNICA 
    ( 
     idTec INTEGER  NOT NULL , 
     nomTec VARCHAR2 (30) , 
     estilo VARCHAR2 (30) , 
     idArt INTEGER  NOT NULL 
    ) 
;



ALTER TABLE TECNICA 
    ADD CONSTRAINT "TECNICA PK" PRIMARY KEY ( idTec ) ;




ALTER TABLE COMPOSICION 
    ADD CONSTRAINT FK_ASS_1 FOREIGN KEY 
    ( 
     objeto
    ) 
    REFERENCES OBJETO 
    ( 
     idObj
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE COMPOSICION 
    ADD CONSTRAINT FK_ASS_2 FOREIGN KEY 
    ( 
     material
    ) 
    REFERENCES MATERIAL 
    ( 
     idMat
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNOLOGIA 
    ADD CONSTRAINT Relation_10 FOREIGN KEY 
    ( 
     idDes
    ) 
    REFERENCES DESCRIPCION 
    ( 
     idDes
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ETNOLOGIA 
    ADD CONSTRAINT Relation_11 FOREIGN KEY 
    ( 
     idAdq
    ) 
    REFERENCES ADQUISICION 
    ( 
     idAdq
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBJETO 
    ADD CONSTRAINT Relation_2 FOREIGN KEY 
    ( 
     idObra
    ) 
    REFERENCES BELLA_ARTE 
    ( 
     idObra
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBJETO 
    ADD CONSTRAINT Relation_3 FOREIGN KEY 
    ( 
     idArq
    ) 
    REFERENCES ARQUEOLOGIA 
    ( 
     idArq
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE OBJETO 
    ADD CONSTRAINT Relation_4 FOREIGN KEY 
    ( 
     idEt
    ) 
    REFERENCES ETNOLOGIA 
    ( 
     idEt
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE BELLA_ARTE 
    ADD CONSTRAINT Relation_5 FOREIGN KEY 
    ( 
     idArt
    ) 
    REFERENCES ARTISTA 
    ( 
     idArt
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE TECNICA 
    ADD CONSTRAINT Relation_6 FOREIGN KEY 
    ( 
     idArt
    ) 
    REFERENCES ARTISTA 
    ( 
     idArt
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ARQUEOLOGIA 
    ADD CONSTRAINT Relation_7 FOREIGN KEY 
    ( 
     idFec
    ) 
    REFERENCES FECHA 
    ( 
     idFec
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ARQUEOLOGIA 
    ADD CONSTRAINT Relation_8 FOREIGN KEY 
    ( 
     idOri
    ) 
    REFERENCES ORIGEN 
    ( 
     idOri
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE ARQUEOLOGIA 
    ADD CONSTRAINT Relation_9 FOREIGN KEY 
    ( 
     idCons
    ) 
    REFERENCES CONSERVACION 
    ( 
     idCons
    ) 
    ON DELETE CASCADE 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

spool off
