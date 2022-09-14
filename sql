--- CREAMOS UN BASE DE DATOS  DE dbConferenceVG 
 
 CREATE DATABASE dbConferenceVG
 GO 
 USE dbConferenceVG
 --- CREAR LA TABLA PARTICIPANTE
CREATE TABLE Participante
(
	IDPAR int not null identity(1,1),
	FECREGPAR datetime DEFAULT GETDATE(),
	NOMPAR varchar(60)not null,
	APEPAR varchar(80)not null,
	DNIPAR char(8)not null,
	TIPPAR char(1)not null,
	CELPAR char(9)not null,
	EMAPAR varchar(90)not null,
	DIRPAR varchar(90)not null,
	ESTPAR char(1)not null,
	CONSTRAINT IDPAR_PK PRIMARY KEY(IDPAR)
)
GO
--- CREAR LA TABLA  PONENTE
CREATE TABLE Ponente
(
	CODPON char(5) not null ,
	NOMPON varchar(60)not null,
	APEPON varchar(80)not null,
	CELPON char(9)not null,
	DNIPON char(8)not null,
	EMAPON varchar(90)not null,
	DIRPON varchar(90)not null,
	CONSTRAINT CODPON_PK PRIMARY KEY(CODPON)
)
GO
----- CREAR LA TABLA CONFERENCIA
CREATE TABLE Conferencia
(
	CODCONF char(5)not null,
	TEMCONF varchar(90)not null,
	FECCONF date not null,
	PONCONF char(5) not null,
	CONSTRAINT CODCONF_PK PRIMARY KEY(CODCONF)
)
GO
----CREAR LA TABLA REGISTRO
CREATE TABLE Registro
(
	CODREG char(5) not null,
	CODPAR int not null,
	FECREG datetime DEFAULT GETDATE(),
	CERTREG char(1) not null,
	CONSTRAINT CODREG_PK PRIMARY KEY (CODREG)
)
GO
--- CREAR LA TABLA REGISTRO
CREATE TABLE Registro_Detalle
(
	IDREGDET int identity(1,1)not null,
	CODREG char(5) not null,
	CODCONF char(5) not null,
	CANTPART int not null,
	CONSTRAINT IDREGDET_PK PRIMARY KEY(IDREGDET)
)
GO

--creamos las relaciones

ALTER TABLE Registro
ADD CONSTRAINT Participante_Registro
FOREIGN KEY (CODPAR)
REFERENCES Participante(IDPAR)
GO

ALTER TABLE Registro_Detalle
ADD CONSTRAINT Registro_Detalle_Registro
FOREIGN KEY (CODREG)
REFERENCES Registro(CODREG)
GO

ALTER TABLE Registro_Detalle
ADD CONSTRAINT Registro_Detalle_Conferencia
FOREIGN KEY (CODCONF)
REFERENCES Conferencia(CODCONF)
GO

ALTER TABLE Conferencia
ADD CONSTRAINT Conferencia_Ponente
FOREIGN KEY (PONCONF)
REFERENCES Ponente(CODPON)
GO

--INSERTAMOS  LOS REGISTROS A LA  TABLA PARTICIPANTE

INSERT INTO Participante
(NOMPAR,APEPAR,DNIPAR,TIPPAR,CELPAR,EMAPAR,DIRPAR,ESTPAR)
VALUES
('Juan','Campos Perez','40255133','1','986512478','juan.campos@vallegrande.edu.pe','Av.Miraflores','A'),
('sofia','Solano Avila','64978531','1','974815258','sofia.solano@vallegrande.edu.pe','Jr.Huallaga','A'),
('Maria','Rosales Guerra','15925874','1','986532147','maria.rosales@vallegrande.edu.pe','Calle Girasoles','A'),
('Marcos','Alarcon Hermosa','48781512','2','','marcos.alarcon@vallegrande.edu.pe','','A'),
('Martin','Saman Arata','84152631','2','','martin.saman@vallegrande.edu.pe','Jr.La Unión n','A'),
('José ','Quispe Luyo','48161937','2','978415321','jose.quispe@vallegrande.edu.pe','Calle Abancay','A'),
('Claudia','Barraza Carrasco','78452596','3','','cbarraza@gmail.com','Jr.Las Gardenias','A'),
('Jhohana','Bendezu Anccasi','74321564','3','','jbendezu@yahoo.com','','A'),
('Mario','Acosta Palomino','15326499','3','931764521','mario.acosta@outlook.com','Av.Miraflores','A')
GO
--SELECCIONAMOS LA TABLA PARTICIPANTE
SELECT * FROM Participante
GO
--INSERTAMOS   LOS REGISTROS  A LA TABLA  PONENTE

INSERT INTO Ponente
(CODPON,NOMPON,APEPON,CELPON,DNIPON,EMAPON,DIRPON)
VALUES
('P0001','Alberto','Corrales Lozada','','15363798','alberto.corrales@yahoo.com','Calle Los Portales'),
('P0002','Juana','Sanchez Ortega','974815258','13256497','juana.sanchez@yahoo.com','Av.La Libertad'),
('P0003','Javier','Nakasone Villa','995236147','15953575','javier.nakasone@yahoo.com','Jr.San Mart�n'),
('P0004','Sonia','Huayta Medina','','12657814','sonia.huayta@yahoo.com','Av.Las Gardenias'),
('P0005','Fabiano','Carrion Avila','','12233647','','Jr.Huancayo')
GO
--SELECCIONAMOS LA TABLA PONENTE

SELECT * FROM Ponente
GO
--INSERTAMOS  LOS REGISTROS  A LA TABLA  CONFERENCIA
INSERT INTO Conferencia
(CODCONF,TEMCONF,FECCONF,PONCONF)
VALUES
('C0001','Gestion de datos con MySQL','2022/07/15','P0001'),
('C0002','Joins paso a paso','2022/07/16','P0002'),
('C0003','Consultas con paramentros','2022/07/17','P0003'),
('C0004','Administracion base de datos MySQL','2022/07/16','P0002'),
('C0005','Gestion de backups de Base de Datos','2022/07/15','P0004')
GO

SELECT * FROM Conferencia
GO
--INSERTAMOS LOS REGISTROS A LA TABLA REGISTROS
INSERT INTO Registro
(CODREG,CODPAR,CERTREG)
VALUES
('R0001','1','S'),
('R0002','3','S'),
('R0003','4','S'),
('R0004','7','S'),
('R0005','2','N'),
('R0006','5','N'),
('R0007','6','N'),
('R0008','9','N')
GO
--SELECCIONAMOS LA TABLA REGISTRO
SELECT * FROM Registro
GO
--INSERTAMOS LOS REGISTROS A LA TABLA REGISTRO A DETALLE
INSERT INTO Registro_Detalle
(CODREG,CODCONF,CANTPART)
VALUES
('R0001','C0001','2'),
('R0001','C0002','1'),
('R0002','C0001','4'),
('R0002','C0003','1'),
('R0003','C0004','1'),
('R0004','C0005','2'),
('R0005','C0005','3'),
('R0005','C0003','2'),
('R0006','C0002','3'),
('R0006','C0003','4'),
('R0007','C0005','2'),
('R0007','C0003','6'),
('R0008','C0005','1')
GO
--SELECCIONAMOS LA TABLA REGISTRO A DETALLE
SELECT * FROM Registro_Detalle
GO