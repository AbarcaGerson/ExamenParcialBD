CREATE TABLE TIPO_COMIDA(
    ID_TipoComida number PRIMARY KEY,
    NombreTipoComida varchar(25),
    Estado varchar2(1)
);

CREATE SEQUENCE SQ_TIPO_COMIDA
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

CREATE TABLE COMIDA(
    ID_Comida number PRIMARY KEY,
    NombreComida varchar(30),
    DescripcionComida VARCHAR2(40),
    PrecioComida number,
    ID_TipoComida number REFERENCES TIPO_COMIDA,
    Estado varchar2(1)
);

CREATE SEQUENCE SQ_COMIDA
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

CREATE TABLE TIPO_EMPLEADO(
    ID_CodigoTipoEmpleado   NUMBER PRIMARY KEY,
    NombreTipoEmpleado      VARCHAR2(20),
    Estado    		 VARCHAR2(1)
);

CREATE SEQUENCE SQ_TIPO_EMPLEADO
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;


CREATE TABLE EMPLEADO(
    ID_CodigoEmpleado   	NUMBER PRIMARY KEY,
    NombreEmpleado          VARCHAR2(20),
    ApellidoEmpleado        VARCHAR2(20),
    DNI                     NUMBER UNIQUE,
    SexoEmpleado            VARCHAR2(10),
    DireccionEmpleado       VARCHAR2(30),
    TelefonoEmpleado        NUMBER,
    ClaveEmpleado           VARCHAR2(15),
    ID_CodigoTipoEmpleado   NUMBER REFERENCES TIPO_EMPLEADO,
    Estado    		 VARCHAR2(1)
);

CREATE SEQUENCE SQ_EMPLEADO
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

CREATE TABLE TIPO_CLIENTE(
    ID_CodigoTipoCliente	 NUMBER PRIMARY KEY,
    NombreTipoCliente      VARCHAR2(30),
    Estado			VARCHAR2(1)
    );

CREATE SEQUENCE SQ_TIPO_CLIENTE
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;


CREATE TABLE CLIENTE(
    ID_NumeroCliente  NUMBER PRIMARY KEY,
    NombreCliente     VARCHAR2(30),
    ApellidoCliente   VARCHAR2(30),
    DNI		  NUMBER UNIQUE,
    SexoCliente 	  VARCHAR2(10),
    DireccionCliente  VARCHAR2(80),
    TelefonoCliente   NUMBER,
    ID_CodigoTipoCliente  NUMBER REFERENCES TIPO_CLIENTE,
    Estado		   VARCHAR2(1)
);

CREATE SEQUENCE SQ_CLIENTE
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

CREATE TABLE VENTA(
    ID_NumeroVenta	    NUMBER PRIMARY KEY,
    FechaVenta          DATE,
    TotalVenta          NUMBER,
    ID_CodigoEmpleado 	NUMBER REFERENCES EMPLEADO,
    ID_NumeroCliente    NUMBER REFERENCES CLIENTE,
    Estado			VARCHAR2(1)
);

CREATE SEQUENCE SQ_VENTA
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

CREATE TABLE DETALLE_VENTA(
    ID_DetalleVenta number PRIMARY KEY,
    CantidadVenta number,
    ImporteVenta number,
    ID_NumeroVenta number REFERENCES VENTA,
    ID_Comida number REFERENCES COMIDA,
    Estado VARCHAR2(1)
);

CREATE SEQUENCE SQ_DETALLE_VENTA
START WITH 1
INCREMENT BY 1
MINVALUE 1
NOCYCLE;

INSERT INTO TIPO_COMIDA VALUES(
    SQ_TIPO_COMIDA.NEXTVAL,
    'Entrada',
    'A'
);

INSERT INTO TIPO_COMIDA VALUES(
    SQ_TIPO_COMIDA.NEXTVAL,
    'Segundo',
    'A'
);

INSERT INTO TIPO_COMIDA VALUES(
    SQ_TIPO_COMIDA.NEXTVAL,
    'Postre',
    'A'
);

INSERT INTO TIPO_CLIENTE VALUES(
    SQ_TIPO_CLIENTE.NEXTVAL,
    'Regular',
    'A'
);

INSERT INTO TIPO_CLIENTE VALUES(
    SQ_TIPO_CLIENTE.NEXTVAL,
    'VIP',
    'A'
);

INSERT INTO TIPO_EMPLEADO VALUES(
    SQ_TIPO_EMPLEADO.NEXTVAL,
    'TP',
    'A'
);

INSERT INTO TIPO_EMPLEADO VALUES(
    SQ_TIPO_EMPLEADO.NEXTVAL,
    'TC',
    'A'
);

INSERT INTO EMPLEADO VALUES(
    SQ_EMPLEADO.NEXTVAL,
    'Dylan',
    'Gonzales',
    76567339,
    'Masculino',
    'Jr. Ariadna 180',
    918507697,
    'Peru2010',
    1,
    'A'
);

INSERT INTO EMPLEADO VALUES(
    SQ_EMPLEADO.NEXTVAL,
    'Roberto',
    'Aguilar',
    40404491,
    'Masculino',
    'Jr. Pezos 110',
    993507697,
    'Robby17',
    2,
    'A'
);

INSERT INTO EMPLEADO VALUES (
    SQ_EMPLEADO.NEXTVAL,
    'Frank',
	'Levano',
	76451200,
	'Masculino',
	'Av. Circunvalacion 4555',
	283085584,
	'Frank2020',
	1,
    'A'
);
INSERT INTO EMPLEADO VALUES (
    SQ_EMPLEADO.NEXTVAL,
    'Tom',
	'Rojas',
	72031005,
	'Masculino',
	'Jiron Progreso 777',
	280551494,
    'Tom2019',
	2,
    'A'
);
INSERT INTO EMPLEADO VALUES (
    SQ_EMPLEADO.NEXTVAL,
    'Paolo',
	'Farfan',
	75185522,
	'Masculino',
	'Av. Javier Prado Este 251',
	450561034,
    'Paolo09',
	1,
    'A'
);

INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Alexander',
	'Alarcon',
	76124219,
	'Masculino',
	'Jiron miguel grau 461',
	2838160,
	2,
    'A'
);
 
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Paul',
	'Gutierrez',
	09719388,
	'Masculino',
	'Av. Pachacutec 231',
	2830848,
            1,
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Juan',
	'Peña',
	76124859,
	'Masculino',
	'Av. Central 2515',
	4707610,
	2,
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Luis',
	'Figueroa',
	10152846,
	'Masculino',
	'Av. Peru 542',
	2964531,
    1,	
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Alfredo',
	'Silva',
	77841523,
	'Masculino',
	'Av. Salvador Allende',
	2512302,
	2,
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Kevin',
	'Cruz',
	75356542,
	'Masculino',
	'Av. Villa Maria 451',
	2485153,
	1,
    'A'
);
 
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Selena',
	'Mendocilla',
	10155682,
	'Femenino',
	'Av. San Felipe 555',
	2831155,
	2,
    'A'
);
 
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Alejandra',
	'Lopez',
	76125584,
	'Femenino',
	'Av. el Sol 45',
	2838160,
	1,
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    	'Andrea',
	'Ramos',
	77481526,
	'Femenino',
	'Jiron Bolognesi 222',
	2851248,
	2,
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Maria',
	'Rhodes',
	09718533,
	'Femenino',
	'Av. San Juan 234',
	2584600,
	1,
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'George',
	'Quispe',
	76125546,
	'Masculino',
	'Av. Los Lirios 159',
	2001586,
	2,
    'A'
);
INSERT INTO CLIENTE VALUES (
    SQ_CLIENTE.NEXTVAL,
    'Junior',
	'Hurtado',
    85642589,
    'Masculino',
	'Av. Santa Cruz 009',
	2951863,
	1,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Ceviche Mixto',
	'C. de pescado con Chicharron de Pota',
	25,
	2,
    'A'
);
INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Carapulcra Mode::Cuto',
	'Sopa seca a la chinchana',
	20,
	2,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Mazamorra Morada',
	'Mazamorra con frutas secas',
	25,
	3,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Crema de Rocoto',
	'Crema picante con papas',
	12,
	1,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Aji de pollo',
	'Aji de pollo criollo',
	15,
	2,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Arroz con leche',
	'Crema de arroz condensada',
	12,
	3,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
             'Sopa de Casa',
	'Sopa de sustancia de pollo',
	8,
	1,
            'A'
);
INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Huancaina',
	'Crema huancaina con papas',
	7,
	1,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Seco de Res',
	'Seco a la norteña',
	18,
	2,
    'A'
);

INSERT INTO COMIDA VALUES (
    SQ_COMIDA.NEXTVAL,
    'Tequeños rellenos',
	'Tequeños con crema',
	9,
	1,
    'A'
);

INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate-22,
	50,
	4,
	5,
    'A'
);

INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate+15,
	150,
	3,
	6,
    'A'
);

INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate+5,
    200,
	1,
	9,
    'A'
);
INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate,
	60,
	5,
	8,
    'A'
);
INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate+5,
	150,
	4,
	7,
    'A'
);

INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate+6,
    80,
	2,
	4,
    'A'
);

INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate-14,
	90,
    5,
	10,
    'A'
);

INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate+3,
    40,
	4,
	6,
    'A'
);

INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate-9,
    80,
	3,
	5,
    'A'
);


INSERT INTO VENTA VALUES (
    SQ_VENTA.NEXTVAL,
    sysdate+1,
    50,
	5,
	2,
    'A'
);


INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    2,
    100,
    5,
    4,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    3,
    78,
    3,
    9,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    1,
    20,
    2,
    7,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    4,    
    150,
    6,
    3,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    2,
    60,
    7,
    2,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    6,
    250,
    6,
    8,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    1,
    12,
    7,
    4,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    5,
    88,
    8,
    6,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    6,
    175,
    9,
    4,
    'A'
);

INSERT INTO DETALLE_VENTA VALUES(
    SQ_DETALLE_VENTA.NEXTVAL,
    1,
    35,
    1,
    7,
    'A'
);

DELETE FROM COMIDA WHERE
   ID_Comida= 3;
 
DELETE FROM COMIDA WHERE
   ID_Comida= 5;
 
DELETE FROM EMPLEADO WHERE
   ID_CodigoEmpleado= 4;

DELETE FROM EMPLEADO WHERE
   ID_CodigoEmpleado= 1;
 
DELETE FROM CLIENTE WHERE
   ID_NumeroCliente= 5;
 
DELETE FROM CLIENTE WHERE
   ID_NumeroCliente= 8;
   
UPDATE CLIENTE
SET
NombreCliente =     'Lisa'
WHERE
ID_NumeroCliente = 10;
 
UPDATE CLIENTE
SET
ApellidoCliente =     'Kennedy'
WHERE
ID_NumeroCliente = 11;
 
UPDATE COMIDA
SET
PrecioComida =   22
 WHERE
ID_Comida = 6;

UPDATE COMIDA
SET
NombreComida =     'Carapulcra a lo Chincha'
WHERE
ID_Comida = 2;

UPDATE EMPLEADO
SET
NombreEmpleado=     'Facundo'
 WHERE
ID_CodigoEmpleado = 3;
 
UPDATE EMPLEADO
SET
ClaveEmpleado= 'Aguilar17'
 WHERE
ID_CodigoEmpleado = 2;

SELECT * FROM COMIDA;
ROLLBACK;
 
COMMIT;


SELECT 
    Q.ID_TipoComida,
    A.ID_TipoComida,
    E.ID_CodigoTipoEmpleado,
    I.ID_CodigoTipoEmpleado,
    C.ID_CodigoTipoCliente,
    K.ID_CodigoTipoCliente,
    V.ID_NumeroCliente,
    C.ID_NumeroCliente,
    V.ID_CodigoEmpleado,
    E.ID_CodigoEmpleado
    
FROM TIPO_COMIDA A,
     COMIDA Q,
     TIPO_EMPLEADO I,
     EMPLEADO E,
     TIPO_CLIENTE K,
     CLIENTE C,
     VENTA V
WHERE
    Q.ID_TipoComida=A.ID_TipoComida AND
    E.ID_CodigoTipoEmpleado=I.ID_CodigoTipoEmpleado AND
    C.ID_CodigoTipoCliente=K.ID_CodigoTipoCliente AND
    V.ID_NumeroCliente=C.ID_NumeroCliente AND
    V.ID_CodigoEmpleado=E.ID_CodigoEmpleado
ORDER BY V.ID_NUMEROVENTA;

DELETE CLIENTE;
DROP SEQUENCE SQ_DETALLE_VENTA;

COMMIT;


