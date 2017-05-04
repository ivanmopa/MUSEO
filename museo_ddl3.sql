-- Generado por Oracle SQL Developer Data Modeler 3.1.3.709
--   en:        2017-05-04 21:22:50 CEST
--   sitio:      Oracle Database 10g
--   tipo:      Oracle Database 10g

set echo on
spool museo_log3.txt

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
     fNac DATE , 
     desconocido VARCHAR2 (10) 
    ) 
;



ALTER TABLE ARTISTA 
    ADD CONSTRAINT "ARTISTA PK" PRIMARY KEY ( idArt ) ;



CREATE TABLE BELLA_ARTE 
    ( 
     idObra INTEGER  NOT NULL , 
     numInv INTEGER , 
     ubicacion VARCHAR2 (50) , 
     idArt INTEGER  NOT NULL , 
     fIng DATE , 
     fCrea DATE , 
     fDesconocido DATE , 
     iconografia VARCHAR2 (100) , 
     nomObra VARCHAR2 (30) 
    ) 
;



ALTER TABLE BELLA_ARTE 
    ADD CONSTRAINT "BELLA_ARTE PK" PRIMARY KEY ( idObra ) ;



CREATE TABLE BIBLIOGRAFIA 
    ( 
     idBib INTEGER  NOT NULL , 
     referencias VARCHAR2 (60) , 
     autor VARCHAR2 (30) , 
     editorial VARCHAR2 (30) , 
     año DATE , 
     publicacion VARCHAR2 (30) , 
     pagina_ref VARCHAR2 (30) 
    ) 
;



ALTER TABLE BIBLIOGRAFIA 
    ADD CONSTRAINT "BIBLIOGRAFIA PK" PRIMARY KEY ( idBib ) ;



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
     estado VARCHAR2 (30) , 
     descripcion VARCHAR2 (50) , 
     idProA INTEGER  NOT NULL 
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



CREATE TABLE DOCUMENTO 
    ( 
     idDoc INTEGER  NOT NULL , 
     conclusiones VARCHAR2 (70) , 
     recomendaciones VARCHAR2 (70) , 
     idInt INTEGER  NOT NULL , 
     idEst INTEGER  NOT NULL , 
     idInfo INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX DOCUMENTO__IDX ON DOCUMENTO 
    ( 
     idInt ASC 
    ) 
;
CREATE UNIQUE INDEX DOCUMENTO__IDXv1 ON DOCUMENTO 
    ( 
     idEst ASC 
    ) 
;
CREATE UNIQUE INDEX DOCUMENTO__IDXv2 ON DOCUMENTO 
    ( 
     idInfo ASC 
    ) 
;

ALTER TABLE DOCUMENTO 
    ADD CONSTRAINT "DOCUMENTO PK" PRIMARY KEY ( idDoc ) ;



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



CREATE TABLE GALERIA 
    ( 
     IMAGEN_idIma INTEGER  NOT NULL , 
     OBJETO_idObj INTEGER  NOT NULL 
    ) 
;



ALTER TABLE GALERIA 
    ADD CONSTRAINT GALERIA__IDX PRIMARY KEY ( IMAGEN_idIma, OBJETO_idObj ) ;



CREATE TABLE IMAGEN 
    ( 
     idIma INTEGER  NOT NULL , 
     foto BLOB 
    ) 
;



ALTER TABLE IMAGEN 
    ADD CONSTRAINT "IMAGEN PK" PRIMARY KEY ( idIma ) ;



CREATE TABLE INFO_ESTADO 
    ( 
     idEst INTEGER  NOT NULL , 
     conclusiones VARCHAR2 (70) , 
     recomendaciones VARCHAR2 (70) , 
     caracteristicas VARCHAR2 (100) , 
     metodologia VARCHAR2 (70) , 
     observaciones VARCHAR2 (100) , 
     idDoc INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX INFO_ESTADO__IDX ON INFO_ESTADO 
    ( 
     idDoc ASC 
    ) 
;

ALTER TABLE INFO_ESTADO 
    ADD CONSTRAINT "INFO_ESTADO PK" PRIMARY KEY ( idEst ) ;



CREATE TABLE INFO_INTERVENCION 
    ( 
     idInfo INTEGER  NOT NULL , 
     restaurador VARCHAR2 (50) , 
     prioridad INTEGER , 
     recomendaciones VARCHAR2 (100) , 
     conclusiones VARCHAR2 (100) , 
     imagen BLOB , 
     descripcion VARCHAR2 (100) , 
     idDoc INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX INFO_INTERVENCION__IDX ON INFO_INTERVENCION 
    ( 
     idDoc ASC 
    ) 
;

ALTER TABLE INFO_INTERVENCION 
    ADD CONSTRAINT "INFO_INTERVENCION PK" PRIMARY KEY ( idInfo ) ;



CREATE TABLE INTERVENCION 
    ( 
     idInt INTEGER  NOT NULL , 
     detalles VARCHAR2 (60) , 
     prioridad INTEGER , 
     imagen BLOB , 
     estado_inicial VARCHAR2 (60) , 
     idCons INTEGER  NOT NULL , 
     idDoc INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX INTERVENCION__IDX ON INTERVENCION 
    ( 
     idDoc ASC 
    ) 
;

ALTER TABLE INTERVENCION 
    ADD CONSTRAINT "INTERVENCION PK" PRIMARY KEY ( idInt ) ;



CREATE TABLE MATERIAL 
    ( 
     idMat INTEGER  NOT NULL , 
     nomMat VARCHAR2 (30) 
    ) 
;



ALTER TABLE MATERIAL 
    ADD CONSTRAINT "MATERIAL PK" PRIMARY KEY ( idMat ) ;



CREATE TABLE METODO 
    ( 
     ARTISTA_idArt INTEGER  NOT NULL , 
     TECNICA_idTec INTEGER  NOT NULL 
    ) 
;



ALTER TABLE METODO 
    ADD CONSTRAINT METODO__IDX PRIMARY KEY ( ARTISTA_idArt, TECNICA_idTec ) ;



CREATE TABLE MOVIMIENTO 
    ( 
     idMov INTEGER  NOT NULL , 
     lugExp VARCHAR2 (40) , 
     fExp DATE 
    ) 
;



ALTER TABLE MOVIMIENTO 
    ADD CONSTRAINT "MOVIMIENTO PK" PRIMARY KEY ( idMov ) ;



CREATE TABLE OBJETO 
    ( 
     idObj INTEGER  NOT NULL , 
     nomObj VARCHAR2 (30) , 
     numCat INTEGER , 
     dimensiones VARCHAR2 (15) , 
     idObra INTEGER  NOT NULL , 
     idArq INTEGER  NOT NULL , 
     idEt INTEGER  NOT NULL , 
     idBib INTEGER  NOT NULL 
    ) 
;



ALTER TABLE OBJETO 
    ADD CONSTRAINT "OBJETO PK" PRIMARY KEY ( idObj ) ;



CREATE TABLE ORIGEN 
    ( 
     idOri INTEGER  NOT NULL , 
     cultura VARCHAR2 (30) , 
     serie VARCHAR2 (30) , 
     depositario VARCHAR2 (30) 
    ) 
;



ALTER TABLE ORIGEN 
    ADD CONSTRAINT "ORIGEN PK" PRIMARY KEY ( idOri ) ;



CREATE TABLE PROCEDENCIA_ARQUE 
    ( 
     idProA INTEGER  NOT NULL , 
     yacimiento VARCHAR2 (40) , 
     hallazgo VARCHAR2 (40) , 
     municipio VARCHAR2 (40) 
    ) 
;



ALTER TABLE PROCEDENCIA_ARQUE 
    ADD CONSTRAINT "PROCEDENCIA_ARQUE PK" PRIMARY KEY ( idProA ) ;



CREATE TABLE PROCEDENCIA_BELLA 
    ( 
     idProB INTEGER  NOT NULL , 
     forma_adq VARCHAR2 (50) , 
     idObra INTEGER  NOT NULL 
    ) 
;



ALTER TABLE PROCEDENCIA_BELLA 
    ADD CONSTRAINT "PROCEDENCIA_BELLA PK" PRIMARY KEY ( idProB ) ;



CREATE TABLE PROPIETARIO 
    ( 
     idPro INTEGER  NOT NULL , 
     iniciales VARCHAR2 (5) 
    ) 
;



ALTER TABLE PROPIETARIO 
    ADD CONSTRAINT "PROPIETARIO PK" PRIMARY KEY ( idPro ) ;



CREATE TABLE TECNICA 
    ( 
     idTec INTEGER  NOT NULL , 
     nomTec VARCHAR2 (30) , 
     estilo VARCHAR2 (30) 
    ) 
;



ALTER TABLE TECNICA 
    ADD CONSTRAINT "TECNICA PK" PRIMARY KEY ( idTec ) ;



CREATE TABLE TITULAR 
    ( 
     OBJETO_idObj INTEGER  NOT NULL , 
     PROPIETARIO_idPro INTEGER  NOT NULL 
    ) 
;



ALTER TABLE TITULAR 
    ADD CONSTRAINT TITULAR__IDX PRIMARY KEY ( OBJETO_idObj, PROPIETARIO_idPro ) ;



CREATE TABLE "TRASLADO " 
    ( 
     BELLA_ARTE_idObra INTEGER  NOT NULL , 
     MOVIMIENTO_idMov INTEGER  NOT NULL 
    ) 
;



ALTER TABLE "TRASLADO " 
    ADD CONSTRAINT "TRASLADO __IDX" PRIMARY KEY ( BELLA_ARTE_idObra, MOVIMIENTO_idMov ) ;




ALTER TABLE COMPOSICION 
    ADD CONSTRAINT FK_600 FOREIGN KEY 
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
    ADD CONSTRAINT FK_700 FOREIGN KEY 
    ( 
     material
    ) 
    REFERENCES MATERIAL 
    ( 
     idMat
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE GALERIA 
    ADD CONSTRAINT FK_ASS_1 FOREIGN KEY 
    ( 
     IMAGEN_idIma
    ) 
    REFERENCES IMAGEN 
    ( 
     idIma
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE TITULAR 
    ADD CONSTRAINT FK_ASS_15 FOREIGN KEY 
    ( 
     OBJETO_idObj
    ) 
    REFERENCES OBJETO 
    ( 
     idObj
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE TITULAR 
    ADD CONSTRAINT FK_ASS_16 FOREIGN KEY 
    ( 
     PROPIETARIO_idPro
    ) 
    REFERENCES PROPIETARIO 
    ( 
     idPro
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE "TRASLADO " 
    ADD CONSTRAINT FK_ASS_17 FOREIGN KEY 
    ( 
     BELLA_ARTE_idObra
    ) 
    REFERENCES BELLA_ARTE 
    ( 
     idObra
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE "TRASLADO " 
    ADD CONSTRAINT FK_ASS_18 FOREIGN KEY 
    ( 
     MOVIMIENTO_idMov
    ) 
    REFERENCES MOVIMIENTO 
    ( 
     idMov
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE GALERIA 
    ADD CONSTRAINT FK_ASS_2 FOREIGN KEY 
    ( 
     OBJETO_idObj
    ) 
    REFERENCES OBJETO 
    ( 
     idObj
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE METODO 
    ADD CONSTRAINT FK_ASS_3 FOREIGN KEY 
    ( 
     ARTISTA_idArt
    ) 
    REFERENCES ARTISTA 
    ( 
     idArt
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE METODO 
    ADD CONSTRAINT FK_ASS_4 FOREIGN KEY 
    ( 
     TECNICA_idTec
    ) 
    REFERENCES TECNICA 
    ( 
     idTec
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


ALTER TABLE DOCUMENTO 
    ADD CONSTRAINT Relation_100 FOREIGN KEY 
    ( 
     idInt
    ) 
    REFERENCES INTERVENCION 
    ( 
     idInt
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
    ADD CONSTRAINT Relation_14 FOREIGN KEY 
    ( 
     idBib
    ) 
    REFERENCES BIBLIOGRAFIA 
    ( 
     idBib
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE PROCEDENCIA_BELLA 
    ADD CONSTRAINT Relation_15 FOREIGN KEY 
    ( 
     idObra
    ) 
    REFERENCES BELLA_ARTE 
    ( 
     idObra
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE CONSERVACION 
    ADD CONSTRAINT Relation_18 FOREIGN KEY 
    ( 
     idProA
    ) 
    REFERENCES PROCEDENCIA_ARQUE 
    ( 
     idProA
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


ALTER TABLE INTERVENCION 
    ADD CONSTRAINT Relation_20 FOREIGN KEY 
    ( 
     idCons
    ) 
    REFERENCES CONSERVACION 
    ( 
     idCons
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE DOCUMENTO 
    ADD CONSTRAINT Relation_200 FOREIGN KEY 
    ( 
     idEst
    ) 
    REFERENCES INFO_ESTADO 
    ( 
     idEst
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE INTERVENCION 
    ADD CONSTRAINT Relation_21 FOREIGN KEY 
    ( 
     idDoc
    ) 
    REFERENCES DOCUMENTO 
    ( 
     idDoc
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


ALTER TABLE DOCUMENTO 
    ADD CONSTRAINT Relation_300 FOREIGN KEY 
    ( 
     idInfo
    ) 
    REFERENCES INFO_INTERVENCION 
    ( 
     idInfo
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


ALTER TABLE INFO_ESTADO 
    ADD CONSTRAINT Relation_400 FOREIGN KEY 
    ( 
     idDoc
    ) 
    REFERENCES DOCUMENTO 
    ( 
     idDoc
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


ALTER TABLE INFO_INTERVENCION 
    ADD CONSTRAINT Relation_500 FOREIGN KEY 
    ( 
     idDoc
    ) 
    REFERENCES DOCUMENTO 
    ( 
     idDoc
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
-- CREATE TABLE                            27
-- CREATE INDEX                             6
-- ALTER TABLE                             56
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
