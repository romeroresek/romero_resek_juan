-- CREATE
CREATE TABLE `silicon`.`alumno` (
  `idalumno` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idalumno`));

CREATE TABLE `silicon`.`curso` (
  `idcurso` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcurso`));

-- RELACIONAR TABLA CON FK
ALTER TABLE `silicon`.`curso` 
ADD COLUMN `alumno` INT NULL AFTER `nombre`,
ADD INDEX `alumno_idx` (`alumno` ASC) VISIBLE;
;
ALTER TABLE `silicon`.`curso` 
ADD CONSTRAINT `alumno`
  FOREIGN KEY (`alumno`)
  REFERENCES `silicon`.`alumno` (`idalumno`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Cargué tabla alumnos
INSERT INTO `silicon`.`alumno` (`nombre`, `apellido`, `dni`) VALUES ('Juan', 'Perez', '22222222');
INSERT INTO `silicon`.`alumno` (`nombre`, `apellido`, `dni`) VALUES ('Lucas', 'Rodriguez', '33333333');
INSERT INTO `silicon`.`alumno` (`nombre`, `apellido`, `dni`) VALUES ('Andres', 'Ortega', '44444444');


-- cargé tabla curso
INSERT INTO `silicon`.`curso` (`nombre`) VALUES ('Introducción Programación');
INSERT INTO `silicon`.`curso` (`nombre`) VALUES ('Programación Javascript');
INSERT INTO `silicon`.`curso` (`nombre`) VALUES ('Curso React');

-- cargé tabla curso alumno
INSERT INTO `silicon`.`curso_has_alumno` (`curso_idcurso`, `alumno_idalumno`) VALUES ('3', '4');
INSERT INTO `silicon`.`curso_has_alumno` (`curso_idcurso`, `alumno_idalumno`) VALUES ('4', '4');
INSERT INTO `silicon`.`curso_has_alumno` (`curso_idcurso`, `alumno_idalumno`) VALUES ('5', '5');
INSERT INTO `silicon`.`curso_has_alumno` (`curso_idcurso`, `alumno_idalumno`) VALUES ('5', '6');


