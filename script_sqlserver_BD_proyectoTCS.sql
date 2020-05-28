CREATE DATABASE BDproyectoTCS

USE BDproyectoTCS

CREATE TABLE Delegacion (
  nom_deleg VARCHAR(45) NOT NULL,
  calle_deleg VARCHAR(45) NOT NULL,
  num_deleg INT NOT NULL,
  colonia_deleg VARCHAR(45) NOT NULL,
  codpostal VARCHAR(10) NOT NULL,
  municipio_deleg VARCHAR(45) NOT NULL,
  tel_deleg VARCHAR(12) NULL,
  correo_deleg VARCHAR(45) NULL,
  PRIMARY KEY (nom_deleg))

CREATE TABLE Cargo(
  nom_cargo VARCHAR(20) NOT NULL,
  PRIMARY KEY (nom_cargo)) 

CREATE TABLE Usuario(
  nombre_usuario VARCHAR(20) NOT NULL,
  contrasena VARCHAR(20) NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  ap_paterno VARCHAR(20) NOT NULL,
  ap_materno VARCHAR(20) NULL,
  cargo VARCHAR(16) NOT NULL,
  Delegacion_nom_deleg VARCHAR(45) NOT NULL,
  PRIMARY KEY (nombre_usuario, Delegacion_nom_deleg, Cargo_nom_cargo),
  CONSTRAINT fk_Usuario_Delegacion1
    FOREIGN KEY (Delegacion_nom_deleg)
    REFERENCES Delegacion (nom_deleg),
  CONSTRAINT fk_Usuario_Cargo1
    FOREIGN KEY (Cargo_nom_cargo)
    REFERENCES Cargo (nom_cargo))

CREATE INDEX fk_Usuario_Delegacion1_idx ON Usuario (Delegacion_nom_deleg ASC)
CREATE INDEX fk_Usuario_Cargo1_idx ON Usuario (Cargo_nom_cargo ASC)

CREATE TABLE Conductor (
  num_licencia VARCHAR(15) NOT NULL,
  nom_conductor VARCHAR(30) NOT NULL,
  ap_paterno VARCHAR(20) NOT NULL,
  ap_materno VARCHAR(20) NULL,
  fecha_nacim DATE NOT NULL,
  num_celular VARCHAR(12) NULL,
  contrasena_conduct VARCHAR(20) NULL,
  PRIMARY KEY (num_licencia))


CREATE TABLE Vehiculo (
  num_placa VARCHAR(20) NOT NULL,
  marca VARCHAR(45) NULL,
  modelo VARCHAR(45) NULL,
  anio INT NULL,
  color VARCHAR(15) NULL,
  nom_aseguradora VARCHAR(45) NULL,
  num_poliza_seguro VARCHAR(20) NULL,
  Conductor_num_licencia VARCHAR(15) NOT NULL,
  PRIMARY KEY (num_placa,Conductor_num_licencia)
  CONSTRAINT fk_Vehiculo_Conductor1
    FOREIGN KEY (Conductor_num_licencia)
    REFERENCES Conductor (num_licencia))

CREATE INDEX fk_Vehiculo_Conductor1_idx ON Vehiculo (Conductor_num_licencia ASC)

CREATE TABLE Siniestro (
  idSiniestro INT NOT NULL IDENTITY(1,1),
  direccion VARCHAR(100) NULL,
  estado VARCHAR(12) NULL,
  Usuario_nombre_usuario VARCHAR(20) NOT NULL,
  Usuario_Delegacion_nom_deleg VARCHAR(45) NOT NULL,
  PRIMARY KEY (idSiniestro),
  CONSTRAINT fk_Siniestro_Usuario1
    FOREIGN KEY (Usuario_nombre_usuario , Usuario_Delegacion_nom_deleg)
    REFERENCES Usuario (nombre_usuario , Delegacion_nom_deleg))

CREATE INDEX fk_Siniestro_Usuario1_idx ON Siniestro (Usuario_nombre_usuario ASC, Usuario_Delegacion_nom_deleg ASC)


CREATE TABLE Dictamen (
  folio INT NOT NULL,
  descrip_dict VARCHAR(250) NULL,
  fecha_dict DATE NOT NULL,
  hora_dict TIME NOT NULL,
  nom_perito VARCHAR(100) NOT NULL,
  Siniestro_idSiniestro INT NOT NULL,
  PRIMARY KEY (folio, Siniestro_idSiniestro),
  CONSTRAINT fk_Dictamen_Siniestro1
    FOREIGN KEY (Siniestro_idSiniestro)
    REFERENCES Siniestro (idSiniestro))

CREATE INDEX fk_Dictamen_Siniestro1_idx ON Dictamen (Siniestro_idSiniestro ASC)


CREATE TABLE Foto (
  idFoto INT NOT NULL IDENTITY(1,1),
  dir_foto VARCHAR(100) NULL,
  Siniestro_idSiniestro INT NOT NULL,
  PRIMARY KEY (idFoto, Siniestro_idSiniestro),
  CONSTRAINT fk_Foto_Siniestro1
    FOREIGN KEY (Siniestro_idSiniestro)
    REFERENCES Siniestro (idSiniestro))

CREATE INDEX fk_Foto_Siniestro1_idx ON Foto (Siniestro_idSiniestro ASC)


CREATE TABLE Participante (
  Vehículo_num_placa VARCHAR(20) NOT NULL,
  Siniestro_idSiniestro INT NOT NULL,
  PRIMARY KEY (Vehículo_num_placa, Siniestro_idSiniestro),
  CONSTRAINT fk_Conductor_has_Vehiculo1
    FOREIGN KEY (Vehiculo_num_placa)
    REFERENCES Vehiculo (num_placa),
  CONSTRAINT fk_Participante_Siniestro1
    FOREIGN KEY (Siniestro_idSiniestro)
    REFERENCES Siniestro (idSiniestro))

CREATE INDEX fk_Conductor_has_Vehiculo1_idx ON Participante (Vehiculo_num_placa ASC)
CREATE INDEX fk_Participante_Siniestro1_idx ON Participante (Siniestro_idSiniestro ASC)
