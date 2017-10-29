-- Generated by Oracle SQL Developer Data Modeler 4.2.0.932
--   at:        2017-10-22 19:18:15 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE tbl_categoria (
    codigo_categoria   INTEGER NOT NULL,
    categoria          VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN tbl_categoria.codigo_categoria IS
    'C�digo categor�a.';

COMMENT ON COLUMN tbl_categoria.categoria IS
    'Nombre de la categor�a,como ser: deportes,arte,ingenier�a,etc.';

ALTER TABLE tbl_categoria ADD CONSTRAINT tbl_intereses_pk PRIMARY KEY ( codigo_categoria );

CREATE TABLE tbl_colaboradores (
    codigo_colaborador   INTEGER NOT NULL,
    codigo_revista       INTEGER NOT NULL
);

COMMENT ON COLUMN tbl_colaboradores.codigo_colaborador IS
    'El c�digo del usuario que esta colaborando en la revista.';

COMMENT ON COLUMN tbl_colaboradores.codigo_revista IS
    'El c�digo de la revista en la que esta colaborando el usuario.';

ALTER TABLE tbl_colaboradores ADD CONSTRAINT tbl_colaboradores_pk PRIMARY KEY ( codigo_colaborador,codigo_revista );

CREATE TABLE tbl_comentarios (
    codigo_comentario       INTEGER NOT NULL,
    codigo_usuario          INTEGER NOT NULL,
    codigo_noticia          INTEGER,
    codigo_flip             INTEGER,
    codigo_comentario_sup   INTEGER,
    contenido               VARCHAR2(4000) NOT NULL,
    fecha                   DATE NOT NULL
);

COMMENT ON COLUMN tbl_comentarios.codigo_comentario IS
    'C�digo comentario';

COMMENT ON COLUMN tbl_comentarios.codigo_noticia IS
    'C�digo de la noticia que se comenta.';

COMMENT ON COLUMN tbl_comentarios.codigo_comentario_sup IS
    'Actualmente no se pueden comentar comentarios,pero en un futuro tal vez.';

COMMENT ON COLUMN tbl_comentarios.contenido IS
    'El comentario como tal.';

COMMENT ON COLUMN tbl_comentarios.fecha IS
    'Fecha en la que se realiz� el comentario.';

ALTER TABLE tbl_comentarios ADD CONSTRAINT tbl_comentarios_pk PRIMARY KEY ( codigo_comentario );

CREATE TABLE tbl_estado_notificacion (
    codigo_estado_notificacion   INTEGER NOT NULL,
    estado_notificacion          VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN tbl_estado_notificacion.codigo_estado_notificacion IS
    'C�digo del estado de la notificaci�n.';

COMMENT ON COLUMN tbl_estado_notificacion.estado_notificacion IS
    'Estado de la notificaci�n,por ejemplo: le�da,no le�da,etc.';

ALTER TABLE tbl_estado_notificacion ADD CONSTRAINT tbl_estado_notificacion_pk PRIMARY KEY ( codigo_estado_notificacion );

CREATE TABLE tbl_estado_usuario (
    codigo_estado   INTEGER NOT NULL,
    estado          VARCHAR2(200) NOT NULL
);

ALTER TABLE tbl_estado_usuario ADD CONSTRAINT tbl_estado_usuario_pk PRIMARY KEY ( codigo_estado );

CREATE TABLE tbl_flips (
    codigo_flip           INTEGER NOT NULL,
    codigo_noticia        INTEGER NOT NULL,
    codigo_usuario_flip   INTEGER NOT NULL,
    codigo_revista        INTEGER NOT NULL,
    fecha                 DATE NOT NULL
);

ALTER TABLE tbl_flips ADD CONSTRAINT tbl_flips_x_usuario_pk PRIMARY KEY ( codigo_flip );

ALTER TABLE tbl_flips ADD CONSTRAINT tbl_flips__un UNIQUE ( codigo_noticia,codigo_usuario_flip,codigo_revista );

CREATE TABLE tbl_intereses_x_usuario (
    codigo_usuario             INTEGER NOT NULL,
    codigo_categoria_interes   INTEGER NOT NULL
);

COMMENT ON COLUMN tbl_intereses_x_usuario.codigo_usuario IS
    'C�digo de usuario.';

COMMENT ON COLUMN tbl_intereses_x_usuario.codigo_categoria_interes IS
    'C�digo de la categor�a que le interesa,es por ello que es un inter�s como tal en la tabla.';

ALTER TABLE tbl_intereses_x_usuario ADD CONSTRAINT tbl_intereses_x_usuario_pk PRIMARY KEY ( codigo_usuario,codigo_categoria_interes );

CREATE TABLE tbl_lugares (
    codigo_lugar         INTEGER NOT NULL,
    codigo_lugar_padre   INTEGER,
    codigo_tipo_lugar    INTEGER NOT NULL,
    nombre_lugar         VARCHAR2(200) NOT NULL,
    latitud              VARCHAR2(200),
    longitud             VARCHAR2(200)
);

COMMENT ON COLUMN tbl_lugares.codigo_lugar IS
    'C�digo lugar.';

COMMENT ON COLUMN tbl_lugares.codigo_lugar_padre IS
    'C�digo del lugar en el que est� ubicado,por ejemplo: Fco. Moraz�n est� en Honduras,el c�digo de Honduras debe ir en �ste campo.'
;

COMMENT ON COLUMN tbl_lugares.codigo_tipo_lugar IS
    'C�digo del tipo de lugar que es.';

COMMENT ON COLUMN tbl_lugares.nombre_lugar IS
    'Nombre del lugar.';

COMMENT ON COLUMN tbl_lugares.latitud IS
    'Coordenas de latitud.';

COMMENT ON COLUMN tbl_lugares.longitud IS
    'Coordenadas de longitud.';

ALTER TABLE tbl_lugares ADD CONSTRAINT tbl_lugares_pk PRIMARY KEY ( codigo_lugar );

CREATE TABLE tbl_noticias (
    codigo_noticia        INTEGER NOT NULL,
    codigo_usuario        INTEGER NOT NULL,
    codigo_revista        INTEGER NOT NULL,
    codigo_categoria      INTEGER NOT NULL,
    autor_noticia         VARCHAR2(300),
    titulo_noticia        VARCHAR2(250) NOT NULL,
    descripcion_noticia   VARCHAR2(2000),
    contenido_noticia     CLOB,
    fecha_publicacion     DATE NOT NULL,
    url_portada_noti      VARCHAR2(300)
);

COMMENT ON COLUMN tbl_noticias.codigo_noticia IS
    'C�digo Noticia. ';

COMMENT ON COLUMN tbl_noticias.codigo_categoria IS
    'C�digo de la categor�a a la que pertenece la noticia.';

COMMENT ON COLUMN tbl_noticias.autor_noticia IS
    'En caso de que exista la necesidad de ingresar el nombre de un autor externo,se utilizar� este campo. Ej: El usuario verificado National Geographic public� una noticia,pero el autor de dicha noticia es Mark Black.'
;

COMMENT ON COLUMN tbl_noticias.titulo_noticia IS
    'T�tulo de noticia.';

COMMENT ON COLUMN tbl_noticias.descripcion_noticia IS
    'Breve descripci�n de la noticia.';

COMMENT ON COLUMN tbl_noticias.contenido_noticia IS
    'Cuerpo de la noticia.';

COMMENT ON COLUMN tbl_noticias.fecha_publicacion IS
    'Fecha de publicaci�n de noticia.';

COMMENT ON COLUMN tbl_noticias.url_portada_noti IS
    'Fotograf�a que servir� de car�tula para la noticia.';

ALTER TABLE tbl_noticias ADD CONSTRAINT tbl_noticias_pk PRIMARY KEY ( codigo_noticia );

CREATE TABLE tbl_notificaciones (
    codigo_notificacion          INTEGER NOT NULL,
    codigo_tipo_notificacion     INTEGER NOT NULL,
    codgio_estado_notificacion   INTEGER NOT NULL,
    codigo_usuario_receptor      INTEGER NOT NULL,
    codigo_usuario_emisor        INTEGER NOT NULL,
    codigo_revista               INTEGER,
    codigo_noticia               INTEGER,
    codigo_reaccion              INTEGER,
    hora_notificacion            DATE NOT NULL
);

COMMENT ON COLUMN tbl_notificaciones.codigo_notificacion IS
    'El c�digo de cada notificaci�n.';

COMMENT ON COLUMN tbl_notificaciones.codgio_estado_notificacion IS
    'C�digo del estado de la notificaci�n.';

COMMENT ON COLUMN tbl_notificaciones.codigo_usuario_receptor IS
    'El c�digo del usuario de la notificaci�n respectiva.';

ALTER TABLE tbl_notificaciones ADD CONSTRAINT tbl_notificaciones_pk PRIMARY KEY ( codigo_notificacion );

CREATE TABLE tbl_reacciones (
    codigo_reaccion   INTEGER NOT NULL,
    tipo_reaccion     VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN tbl_reacciones.codigo_reaccion IS
    'C�digo de la reacci�n.';

COMMENT ON COLUMN tbl_reacciones.tipo_reaccion IS
    'El tipo de reacci�n.';

ALTER TABLE tbl_reacciones ADD CONSTRAINT tbl_reacciones_pk PRIMARY KEY ( codigo_reaccion );

CREATE TABLE tbl_reacciones_x_comentarios (
    codigo_reaccion     INTEGER NOT NULL,
    codigo_comentario   INTEGER NOT NULL,
    codigo_usuario      INTEGER NOT NULL
);

COMMENT ON COLUMN tbl_reacciones_x_comentarios.codigo_reaccion IS
    'El c�digo de la reacci�n del comentario respectivo.';

COMMENT ON COLUMN tbl_reacciones_x_comentarios.codigo_comentario IS
    'El c�digo del comentario de la reacci�n respectiva.';

COMMENT ON COLUMN tbl_reacciones_x_comentarios.codigo_usuario IS
    'C�digo del usuario que realiz� la acci�n,por ejemplo le dio me gusta al comentario.';

CREATE TABLE tbl_reacciones_x_noticias (
    codigo_noticia    INTEGER,
    codigo_flip       INTEGER,
    codigo_usuario    INTEGER NOT NULL,
    codigo_reaccion   INTEGER NOT NULL
);

COMMENT ON COLUMN tbl_reacciones_x_noticias.codigo_noticia IS
    'El c�digo de la noticia de la reacci�n respectiva.';

COMMENT ON COLUMN tbl_reacciones_x_noticias.codigo_usuario IS
    'C�digo del usuario que realiza la reacci�n,por ejemplo,que le da me gusta a una noticia.';

COMMENT ON COLUMN tbl_reacciones_x_noticias.codigo_reaccion IS
    'El c�digo de la reaccion de la noticia respectiva.';

CREATE TABLE tbl_revistas (
    codigo_revista        INTEGER NOT NULL,
    codigo_usuario        INTEGER NOT NULL,
    nombre_revista        VARCHAR2(100) NOT NULL,
    descripcion           VARCHAR2(200),
    codigo_tipo_revista   INTEGER NOT NULL,
    fecha_de_creacion     DATE NOT NULL,
    url_portada           VARCHAR2(300),
    url_revista           VARCHAR2(200)
);

COMMENT ON COLUMN tbl_revistas.codigo_revista IS
    'C�digo revista.';

COMMENT ON COLUMN tbl_revistas.codigo_usuario IS
    'C�digo usuario al que pertenece la revista.';

COMMENT ON COLUMN tbl_revistas.nombre_revista IS
    'Nombre de la revista.';

COMMENT ON COLUMN tbl_revistas.descripcion IS
    'Descripci�n de revista.';

COMMENT ON COLUMN tbl_revistas.codigo_tipo_revista IS
    'C�digo del tipo de revista';

COMMENT ON COLUMN tbl_revistas.fecha_de_creacion IS
    'Fecha de creaci�n de la revista.';

COMMENT ON COLUMN tbl_revistas.url_revista IS
    'Direcci�n de la revista.';

ALTER TABLE tbl_revistas ADD CONSTRAINT tbl_revistas_pk PRIMARY KEY ( codigo_revista );

CREATE TABLE tbl_revistas_seguidas (
    codigo_seguidor   INTEGER NOT NULL,
    codigo_revista    INTEGER NOT NULL
);

COMMENT ON COLUMN tbl_revistas_seguidas.codigo_seguidor IS
    'El c�digo del usuario que sigue la revista.';

COMMENT ON COLUMN tbl_revistas_seguidas.codigo_revista IS
    'El c�digo de la revista que esta siendo seguida.';

ALTER TABLE tbl_revistas_seguidas ADD CONSTRAINT tbl_revistas_seguidas_pk PRIMARY KEY ( codigo_seguidor,codigo_revista );

CREATE TABLE tbl_seguidores (
    codigo_usuario_seguidor   INTEGER NOT NULL,
    codigo_usuario_seguido    INTEGER NOT NULL
);

COMMENT ON COLUMN tbl_seguidores.codigo_usuario_seguidor IS
    'C�digo del usuario que sigue.';

COMMENT ON COLUMN tbl_seguidores.codigo_usuario_seguido IS
    'C�digo del usuario que es seguido.';

ALTER TABLE tbl_seguidores ADD CONSTRAINT tlb_seguidores_pk PRIMARY KEY ( codigo_usuario_seguidor,codigo_usuario_seguido );

CREATE TABLE tbl_tipo_lugar (
    codigo_tipo_lugar   INTEGER NOT NULL,
    tipo_lugar          VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN tbl_tipo_lugar.codigo_tipo_lugar IS
    'C�digo tipo de lugar.';

COMMENT ON COLUMN tbl_tipo_lugar.tipo_lugar IS
    'Tipo de lugar,como ser: pa�s,municipio,aldea,estado,etc.';

ALTER TABLE tbl_tipo_lugar ADD CONSTRAINT tbl_tipo_lugar_pk PRIMARY KEY ( codigo_tipo_lugar );

CREATE TABLE tbl_tipo_notificacion (
    codigo_tipo_notificacion   INTEGER NOT NULL,
    tipo_notificacion          VARCHAR2(50) NOT NULL
);

ALTER TABLE tbl_tipo_notificacion ADD CONSTRAINT tbl_tipo_notificacion_pk PRIMARY KEY ( codigo_tipo_notificacion );

CREATE TABLE tbl_tipo_revistas (
    codigo_tipo_revista   INTEGER NOT NULL,
    tipo_revista          VARCHAR2(200) NOT NULL
);

COMMENT ON COLUMN tbl_tipo_revistas.codigo_tipo_revista IS
    'C�digo tipo de revista.
';

COMMENT ON COLUMN tbl_tipo_revistas.tipo_revista IS
    'Puede ser:  revista publica o privada';

ALTER TABLE tbl_tipo_revistas ADD CONSTRAINT tbl_tipo_revistas_pk PRIMARY KEY ( codigo_tipo_revista );

CREATE TABLE tbl_tipos_usuario (
    codigo_tipo_usuario   INTEGER NOT NULL,
    tipo_usuario          VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN tbl_tipos_usuario.codigo_tipo_usuario IS
    'C�digo tipo de usuario.';

COMMENT ON COLUMN tbl_tipos_usuario.tipo_usuario IS
    'Por ejemplo: usuario normal,administrador,proveedor de noticias,etc.';

ALTER TABLE tbl_tipos_usuario ADD CONSTRAINT tbl_tipos_usuario_pk PRIMARY KEY ( codigo_tipo_usuario );

CREATE TABLE tbl_usuarios (
    codigo_usuario            INTEGER NOT NULL,
    codigo_tipo_usuario       INTEGER NOT NULL,
    codigo_lugar_residencia   INTEGER NOT NULL,
    codigo_estado_usuario     INTEGER NOT NULL,
    nombre_usuario            VARCHAR2(200) NOT NULL,
    alias_usuario             VARCHAR2(200) NOT NULL,
    correo                    VARCHAR2(100) NOT NULL,
    contrasenia               VARCHAR2(100) NOT NULL,
    url_foto_perfil           VARCHAR2(300),
    descripcion               VARCHAR2(200)
);

COMMENT ON COLUMN tbl_usuarios.codigo_usuario IS
    'C�digo de usuario.';

COMMENT ON COLUMN tbl_usuarios.codigo_tipo_usuario IS
    'C�digo del tipo de usuario,�ste podr�a ser un usuario normal,administrador o source.';

COMMENT ON COLUMN tbl_usuarios.codigo_lugar_residencia IS
    'Lugar de residencia,espec�ficamente podr�a ser el pa�s para hacer un mejor filtrado de noticias.';

COMMENT ON COLUMN tbl_usuarios.codigo_estado_usuario IS
    'Indica si el usuario es una cuenta verificada.';

COMMENT ON COLUMN tbl_usuarios.nombre_usuario IS
    'Nombre,alias o nombre corporativo del usuario.';

COMMENT ON COLUMN tbl_usuarios.correo IS
    'Correo del usuario';

COMMENT ON COLUMN tbl_usuarios.contrasenia IS
    'Contrase�a del usuario.';

COMMENT ON COLUMN tbl_usuarios.url_foto_perfil IS
    'Foto de perfil que el usuario selecciona.';

COMMENT ON COLUMN tbl_usuarios.descripcion IS
    'Espacio nombrado "Escribe algo sobre ti".';

ALTER TABLE tbl_usuarios ADD CONSTRAINT tbl_usuarios_pk PRIMARY KEY ( codigo_usuario );

ALTER TABLE tbl_colaboradores ADD CONSTRAINT col_rev_fk FOREIGN KEY ( codigo_revista )
    REFERENCES tbl_revistas ( codigo_revista );

ALTER TABLE tbl_colaboradores ADD CONSTRAINT col_usu_fk FOREIGN KEY ( codigo_colaborador )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_comentarios ADD CONSTRAINT com_com_fk FOREIGN KEY ( codigo_comentario_sup )
    REFERENCES tbl_comentarios ( codigo_comentario );

ALTER TABLE tbl_comentarios ADD CONSTRAINT com_fli_fk FOREIGN KEY ( codigo_flip )
    REFERENCES tbl_flips ( codigo_flip );

ALTER TABLE tbl_comentarios ADD CONSTRAINT com_not_fk FOREIGN KEY ( codigo_noticia )
    REFERENCES tbl_noticias ( codigo_noticia );

ALTER TABLE tbl_comentarios ADD CONSTRAINT com_usu_fk FOREIGN KEY ( codigo_usuario )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_flips ADD CONSTRAINT fli_x_usu_not_fk FOREIGN KEY ( codigo_noticia )
    REFERENCES tbl_noticias ( codigo_noticia );

ALTER TABLE tbl_flips ADD CONSTRAINT fli_x_usu_usu_fk FOREIGN KEY ( codigo_usuario_flip )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_intereses_x_usuario ADD CONSTRAINT int_x_usu_cat_fk FOREIGN KEY ( codigo_categoria_interes )
    REFERENCES tbl_categoria ( codigo_categoria );

ALTER TABLE tbl_intereses_x_usuario ADD CONSTRAINT int_x_usu_usu_fk FOREIGN KEY ( codigo_usuario )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_lugares ADD CONSTRAINT lug_lug_fk FOREIGN KEY ( codigo_lugar_padre )
    REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_lugares ADD CONSTRAINT lug_tip_lug_fk FOREIGN KEY ( codigo_tipo_lugar )
    REFERENCES tbl_tipo_lugar ( codigo_tipo_lugar );

ALTER TABLE tbl_noticias ADD CONSTRAINT not_cat_fk FOREIGN KEY ( codigo_categoria )
    REFERENCES tbl_categoria ( codigo_categoria );

ALTER TABLE tbl_notificaciones ADD CONSTRAINT not_est_not_fk FOREIGN KEY ( codgio_estado_notificacion )
    REFERENCES tbl_estado_notificacion ( codigo_estado_notificacion );

ALTER TABLE tbl_notificaciones ADD CONSTRAINT not_rea_fk FOREIGN KEY ( codigo_reaccion )
    REFERENCES tbl_reacciones ( codigo_reaccion );

ALTER TABLE tbl_notificaciones ADD CONSTRAINT not_tip_not_fk FOREIGN KEY ( codigo_tipo_notificacion )
    REFERENCES tbl_tipo_notificacion ( codigo_tipo_notificacion );

ALTER TABLE tbl_notificaciones ADD CONSTRAINT not_usu_fk FOREIGN KEY ( codigo_usuario_receptor )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_noticias ADD CONSTRAINT not_usu_fkv2 FOREIGN KEY ( codigo_usuario )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_reacciones_x_comentarios ADD CONSTRAINT rea_x_com_usu_fk FOREIGN KEY ( codigo_usuario )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_reacciones_x_noticias ADD CONSTRAINT rea_x_not_fli_fk FOREIGN KEY ( codigo_flip )
    REFERENCES tbl_flips ( codigo_flip );

ALTER TABLE tbl_reacciones_x_noticias ADD CONSTRAINT reac_x_not_usu_fk FOREIGN KEY ( codigo_usuario )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_revistas_seguidas ADD CONSTRAINT table_24_tbl_revistas_fk FOREIGN KEY ( codigo_revista )
    REFERENCES tbl_revistas ( codigo_revista );

ALTER TABLE tbl_revistas_seguidas ADD CONSTRAINT table_24_tbl_usuarios_fk FOREIGN KEY ( codigo_seguidor )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_reacciones_x_comentarios ADD CONSTRAINT table_27_com_fk FOREIGN KEY ( codigo_comentario )
    REFERENCES tbl_comentarios ( codigo_comentario );

ALTER TABLE tbl_reacciones_x_comentarios ADD CONSTRAINT table_27_rea_fk FOREIGN KEY ( codigo_reaccion )
    REFERENCES tbl_reacciones ( codigo_reaccion );

ALTER TABLE tbl_reacciones_x_noticias ADD CONSTRAINT table_28_rea_fk FOREIGN KEY ( codigo_reaccion )
    REFERENCES tbl_reacciones ( codigo_reaccion );

ALTER TABLE tbl_reacciones_x_noticias ADD CONSTRAINT table_28_tbl_noticias_fk FOREIGN KEY ( codigo_noticia )
    REFERENCES tbl_noticias ( codigo_noticia );

ALTER TABLE tbl_flips ADD CONSTRAINT tbl_flips_tbl_revistas_fk FOREIGN KEY ( codigo_revista )
    REFERENCES tbl_revistas ( codigo_revista );

ALTER TABLE tbl_notificaciones ADD CONSTRAINT tbl_noti_tbl_noti_fk FOREIGN KEY ( codigo_noticia )
    REFERENCES tbl_noticias ( codigo_noticia );

ALTER TABLE tbl_noticias ADD CONSTRAINT tbl_noti_tbl_revi_fk FOREIGN KEY ( codigo_revista )
    REFERENCES tbl_revistas ( codigo_revista );

ALTER TABLE tbl_notificaciones ADD CONSTRAINT tbl_noti_tbl_revis_fk FOREIGN KEY ( codigo_revista )
    REFERENCES tbl_revistas ( codigo_revista );

ALTER TABLE tbl_notificaciones ADD CONSTRAINT tbl_noti_tbl_usu_fk FOREIGN KEY ( codigo_usuario_emisor )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_revistas ADD CONSTRAINT tbl_tipo_revistas_fk FOREIGN KEY ( codigo_tipo_revista )
    REFERENCES tbl_tipo_revistas ( codigo_tipo_revista );

ALTER TABLE tbl_revistas ADD CONSTRAINT tbl_usuarios_fk FOREIGN KEY ( codigo_usuario )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_seguidores ADD CONSTRAINT tbl_usuarios_fkv2 FOREIGN KEY ( codigo_usuario_seguidor )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_seguidores ADD CONSTRAINT tbl_usuarios_fkv3 FOREIGN KEY ( codigo_usuario_seguido )
    REFERENCES tbl_usuarios ( codigo_usuario );

ALTER TABLE tbl_usuarios ADD CONSTRAINT usu_est_usu_fk FOREIGN KEY ( codigo_estado_usuario )
    REFERENCES tbl_estado_usuario ( codigo_estado );

ALTER TABLE tbl_usuarios ADD CONSTRAINT usu_lug_fk FOREIGN KEY ( codigo_lugar_residencia )
    REFERENCES tbl_lugares ( codigo_lugar );

ALTER TABLE tbl_usuarios ADD CONSTRAINT usu_tip_usu_fk FOREIGN KEY ( codigo_tipo_usuario )
    REFERENCES tbl_tipos_usuario ( codigo_tipo_usuario );

CREATE SEQUENCE tbl_categoria_codigo_categoria START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_categoria_codigo_categoria BEFORE
    INSERT ON tbl_categoria
    FOR EACH ROW
    WHEN (
        new.codigo_categoria IS NULL
    )
BEGIN
    :new.codigo_categoria := tbl_categoria_codigo_categoria.nextval;
END;
/

CREATE SEQUENCE tbl_comentarios_codigo_comenta START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_comentarios_codigo_comenta BEFORE
    INSERT ON tbl_comentarios
    FOR EACH ROW
    WHEN (
        new.codigo_comentario IS NULL
    )
BEGIN
    :new.codigo_comentario := tbl_comentarios_codigo_comenta.nextval;
END;
/

CREATE SEQUENCE tbl_estado_notificacion_codigo START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_estado_notificacion_codigo BEFORE
    INSERT ON tbl_estado_notificacion
    FOR EACH ROW
    WHEN (
        new.codigo_estado_notificacion IS NULL
    )
BEGIN
    :new.codigo_estado_notificacion := tbl_estado_notificacion_codigo.nextval;
END;
/

CREATE SEQUENCE tbl_estado_usuario_codigo_esta START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_estado_usuario_codigo_esta BEFORE
    INSERT ON tbl_estado_usuario
    FOR EACH ROW
    WHEN (
        new.codigo_estado IS NULL
    )
BEGIN
    :new.codigo_estado := tbl_estado_usuario_codigo_esta.nextval;
END;
/

CREATE SEQUENCE tbl_lugares_codigo_lugar_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_lugares_codigo_lugar_trg BEFORE
    INSERT ON tbl_lugares
    FOR EACH ROW
    WHEN (
        new.codigo_lugar IS NULL
    )
BEGIN
    :new.codigo_lugar := tbl_lugares_codigo_lugar_seq.nextval;
END;
/

CREATE SEQUENCE tbl_noticias_codigo_noticia START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_noticias_codigo_noticia BEFORE
    INSERT ON tbl_noticias
    FOR EACH ROW
    WHEN (
        new.codigo_noticia IS NULL
    )
BEGIN
    :new.codigo_noticia := tbl_noticias_codigo_noticia.nextval;
END;
/

CREATE OR REPLACE TRIGGER tbl_flips_codigo_flip BEFORE
    INSERT ON tbl_flips
    FOR EACH ROW
    WHEN (
        new.codigo_flip IS NULL
    )
BEGIN
    :new.codigo_flip := tbl_noticias_codigo_noticia.nextval;
END;
/

CREATE SEQUENCE tbl_notificaciones_codigo_noti START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_notificaciones_codigo_noti BEFORE
    INSERT ON tbl_notificaciones
    FOR EACH ROW
    WHEN (
        new.codigo_notificacion IS NULL
    )
BEGIN
    :new.codigo_notificacion := tbl_notificaciones_codigo_noti.nextval;
END;
/

CREATE SEQUENCE tbl_reacciones_codigo_reaccion START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_reacciones_codigo_reaccion BEFORE
    INSERT ON tbl_reacciones
    FOR EACH ROW
    WHEN (
        new.codigo_reaccion IS NULL
    )
BEGIN
    :new.codigo_reaccion := tbl_reacciones_codigo_reaccion.nextval;
END;
/

CREATE SEQUENCE tbl_revistas_codigo_revista START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_revistas_codigo_revista BEFORE
    INSERT ON tbl_revistas
    FOR EACH ROW
    WHEN (
        new.codigo_revista IS NULL
    )
BEGIN
    :new.codigo_revista := tbl_revistas_codigo_revista.nextval;
END;
/

CREATE SEQUENCE tbl_tipo_lugar_codigo_tipo_lug START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipo_lugar_codigo_tipo_lug BEFORE
    INSERT ON tbl_tipo_lugar
    FOR EACH ROW
    WHEN (
        new.codigo_tipo_lugar IS NULL
    )
BEGIN
    :new.codigo_tipo_lugar := tbl_tipo_lugar_codigo_tipo_lug.nextval;
END;
/

CREATE SEQUENCE tbl_tipo_notificacion_codigo_t START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipo_notificacion_codigo_t BEFORE
    INSERT ON tbl_tipo_notificacion
    FOR EACH ROW
    WHEN (
        new.codigo_tipo_notificacion IS NULL
    )
BEGIN
    :new.codigo_tipo_notificacion := tbl_tipo_notificacion_codigo_t.nextval;
END;
/

CREATE SEQUENCE tbl_tipo_revistas_codigo_tipo_ START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipo_revistas_codigo_tipo_ BEFORE
    INSERT ON tbl_tipo_revistas
    FOR EACH ROW
    WHEN (
        new.codigo_tipo_revista IS NULL
    )
BEGIN
    :new.codigo_tipo_revista := tbl_tipo_revistas_codigo_tipo_.nextval;
END;
/

CREATE SEQUENCE tbl_tipos_usuario_codigo_tipo_ START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_tipos_usuario_codigo_tipo_ BEFORE
    INSERT ON tbl_tipos_usuario
    FOR EACH ROW
    WHEN (
        new.codigo_tipo_usuario IS NULL
    )
BEGIN
    :new.codigo_tipo_usuario := tbl_tipos_usuario_codigo_tipo_.nextval;
END;
/

CREATE SEQUENCE tbl_usuarios_codigo_usuario START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tbl_usuarios_codigo_usuario BEFORE
    INSERT ON tbl_usuarios
    FOR EACH ROW
    WHEN (
        new.codigo_usuario IS NULL
    )
BEGIN
    :new.codigo_usuario := tbl_usuarios_codigo_usuario.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            21
-- CREATE INDEX                             0
-- ALTER TABLE                             59
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          14
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         14
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

