USE PROYECTO2DB1;

-- ////////////////////////////////////////////REGISTRAR CARRERA
DROP PROCEDURE IF EXISTS Insertar_Carrera;
DELIMITER ||
CREATE PROCEDURE Insertar_Carrera(
	IN NombreC VARCHAR(45),
    OUT sms VARCHAR(100)
) 
lbl_insertar_carrera:BEGIN
	DECLARE busquedaC INT;
    DECLARE CarreraVeri INT;
    SET CarreraVeri = REGEXP_LIKE(NombreC,'^[A-Z]+$|^[a-z]+$','i');
    IF CarreraVeri = 1 THEN
		SET busquedaC = (SELECT COUNT(id_Carrera) FROM Carrera WHERE Nombre = NombreC);
		IF busquedaC > 0 THEN
			SET sms = 'No se puede insertar la Carrera ya esta Registrada';
			LEAVE lbl_insertar_carrera;
		ELSE
			INSERT INTO Carrera(Nombre) VALUES(NombreC);
			SET sms = 'Carrera Registrada';
			LEAVE lbl_insertar_carrera;
		END IF;
	ELSE
		SET sms = 'La Carrera solo puede contener Letras';
		LEAVE lbl_insertar_carrera;
	END IF;
END; ||
DELIMITER ;

-- //////////////TRIGERS
DROP TRIGGER insertCarrera;
DELIMITER ||
CREATE TRIGGER insertCarrera BEFORE INSERT ON Carrera
FOR EACH ROW BEGIN
    INSERT INTO Transaccion(Tipo, Descripcion, Fecha)
    VALUES('INSERT', 'Se ha realizado una accion en la tabla Carrera', NOW());
END ||
DELIMITER ;

-- ////////////////////////////////////////////REGISTRAR ESTUDIANTE
DROP PROCEDURE IF EXISTS Insertar_Estudiante;
DELIMITER ||
CREATE PROCEDURE Insertar_Estudiante(
	CarnetE BIGINT,
	NombreE VARCHAR(50),
	ApellidoE VARCHAR(50), 
	Fecha_NacimientoE DATE,
	CorreoE VARCHAR(100),
	TelefonoE BIGINT,
	DireccionE VARCHAR(100),
	DPIE BIGINT,
	Id_CarreraE INT,
    OUT sms VARCHAR(100)
) 
lbl_insertar_estudiante:BEGIN
	DECLARE busquedaE INT;
    DECLARE CarnetVeri INT;
    DECLARE CorreoVeri INT;
    DECLARE TelefonoV CHAR(12);
    DECLARE TelefonoI BIGINT;
    SET TelefonoV = CAST(TelefonoE AS CHAR(12));
    SET TelefonoI = (SUBSTRING(TelefonoV,4,12))*1;
    SET CarnetVeri = REGEXP_LIKE(CarnetE,'^[0-9]+$');
    SET CorreoVeri = REGEXP_LIKE(CorreoE,'^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$');
    IF CarnetVeri = 1 AND CorreoVeri = 1 THEN
        SET busquedaE = (SELECT COUNT(Carnet) FROM Estudiante WHERE Carnet = CarnetE);
		IF busquedaE > 0 THEN
			SET sms = 'No se puede insertar al Estudiante ya esta Registrado';
			LEAVE lbl_insertar_estudiante;
		ELSE
			INSERT INTO Estudiante(Carnet,Nombre,Apellido,Fecha_Nacimiento,Correo,Telefono,Direccion,DPI,Id_Carrera,Creditos,Fecha_Creacion) 
            VALUES(CarnetE,NombreE,ApellidoE,Fecha_NacimientoE,CorreoE,TelefonoI,DireccionE,DPIE,Id_CarreraE,0,CURDATE());
			SET sms = 'Estudiante Registrado';
			LEAVE lbl_insertar_estudiante;
		END IF;
		LEAVE lbl_insertar_estudiante;
	ELSE
		SET sms = 'Verifique que el Carnet o Correo sean Validos';
		LEAVE lbl_insertar_estudiante;
	END IF;
END; ||
DELIMITER ;

-- //////////////TRIGERS
DROP TRIGGER insertEstudiante;
DELIMITER ||
CREATE TRIGGER insertEstudiante BEFORE INSERT ON Estudiante
FOR EACH ROW BEGIN
    INSERT INTO Transaccion(Tipo, Descripcion, Fecha)
    VALUES('INSERT', 'Se ha realizado una accion en la tabla Estudiante', NOW());
END ||
DELIMITER ;

-- ////////////////////////////////////////////REGISTRAR DOCENTE
DROP PROCEDURE IF EXISTS Insertar_Docente;
DELIMITER ||
CREATE PROCEDURE Insertar_Docente(
	DPID BIGINT,
	NombreD VARCHAR(50),
	ApellidoD VARCHAR(50), 
	Fecha_NacimientoD DATE,
	CorreoD VARCHAR(100),
	TelefonoD BIGINT,
	DireccionD VARCHAR(100),
    OUT sms VARCHAR(100)
) 
lbl_insertar_docente:BEGIN
	DECLARE busquedaD INT;
    DECLARE DPIVeri INT;
    DECLARE CorreoVeri INT;
    DECLARE TelefonoV CHAR(15);
    DECLARE TelefonoI BIGINT;
    SET TelefonoV = CAST(TelefonoD AS CHAR(15));
    SET TelefonoI = (SUBSTRING(TelefonoV,4,12))*1; 
    SET DPIVeri = REGEXP_LIKE(DPID,'^[0-9]+$');
    SET CorreoVeri = REGEXP_LIKE(CorreoD,'^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$');
    IF DPIVeri = 1 AND CorreoVeri = 1 THEN
        SET busquedaD = (SELECT COUNT(Registro_SIIF) FROM Docente WHERE DPI = DPID);
		IF busquedaD > 0 THEN
			SET sms = 'No se puede insertar al Docente ya esta Registrado';
			LEAVE lbl_insertar_docente;
		ELSE
			INSERT INTO Docente(DPI,Nombre,Apellido,Fecha_Nacimiento,Correo,Telefono,Direccion,Fecha_Registro) 
            VALUES(DPID,NombreD,ApellidoD,Fecha_NacimientoD,CorreoD,TelefonoI,DireccionD,NOW());
			SET sms = 'Docente Registrado';
			LEAVE lbl_insertar_docente;
		END IF;
		LEAVE lbl_insertar_docente;
	ELSE
		SET sms = 'Verifique que el DPI o Correo sean Validos';
		LEAVE lbl_insertar_docente;
	END IF;
END; ||
DELIMITER ;

-- //////////////TRIGERS
DROP TRIGGER insertDocente;
DELIMITER ||
CREATE TRIGGER insertDocente BEFORE INSERT ON Docente
FOR EACH ROW BEGIN
    INSERT INTO Transaccion(Tipo, Descripcion, Fecha)
    VALUES('INSERT', 'Se ha realizado una accion en la tabla Docente', NOW());
END ||
DELIMITER ;

-- ////////////////////////////////////////////REGISTRAR CURSO
DROP PROCEDURE IF EXISTS Crear_Curso;
DELIMITER ||
CREATE PROCEDURE Crear_Curso(
	NombreC VARCHAR(50),
	Creditos_NecesariosC INT,
	Creditos_OtorgaC INT, 
	ObligatorioC BOOL,
	Id_CarreraC INT,
    OUT sms VARCHAR(100)
) 
lbl_crear_curso:BEGIN
	DECLARE busquedaC INT;
    DECLARE CNV INT;
    DECLARE COV INT;
    SET CNV = REGEXP_LIKE(Creditos_NecesariosC,'^[0-9]+$');
    SET COV = REGEXP_LIKE(Creditos_OtorgaC,'^[0-9]+$');
    IF CNV = 1 AND COV = 1 THEN
        SET busquedaC = (SELECT COUNT(Codigo) FROM Curso WHERE Nombre = NombreC);
		IF busquedaC > 0 THEN
			SET sms = 'No se puede crear el Curso ya esta Registrado';
			LEAVE lbl_crear_curso;
		ELSE
			IF Id_CarreraC = 0 THEN
				INSERT INTO Curso(Nombre,Creditos_Necesarios,Creditos_Otorga,Obligatorio,Id_Carrera) 
				VALUES(NombreC,Creditos_NecesariosC,Creditos_OtorgaC,ObligatorioC,1);
				SET sms = 'Curso Creado';
				LEAVE lbl_crear_curso;
            ELSE
				INSERT INTO Curso(Nombre,Creditos_Necesarios,Creditos_Otorga,Obligatorio,Id_Carrera) 
				VALUES(NombreC,Creditos_NecesariosC,Creditos_OtorgaC,ObligatorioC,Id_CarreraC);
				SET sms = 'Curso Creado';
				LEAVE lbl_crear_curso;
            END IF;
		END IF;
		LEAVE lbl_crear_curso;
	ELSE
		SET sms = 'Los creditos deben Ser numeros enteros Positivos';
		LEAVE lbl_crear_curso;
	END IF;
END; ||
DELIMITER ;

-- //////////////TRIGERS
DROP TRIGGER insertCurso;
DELIMITER ||
CREATE TRIGGER insertCurso BEFORE INSERT ON Curso
FOR EACH ROW BEGIN
    INSERT INTO Transaccion(Tipo, Descripcion, Fecha)
    VALUES('INSERT', 'Se ha realizado una accion en la tabla Curso', NOW());
END ||
DELIMITER ;

-- ////////////////////////////////////////////HABILITAR CURSO
DROP PROCEDURE IF EXISTS Habilitar_Curso;
DELIMITER ||
CREATE PROCEDURE Habilitar_Curso(
	CicloC VARCHAR(2),
	Registro_SIIFC INT,
	Cupo_MaximoC INT, 
	SeccionC VARCHAR(1),
	CodigoC INT,
    OUT sms VARCHAR(100)
) 
lbl_habilitar_curso:BEGIN
	DECLARE busquedaC INT;
    DECLARE busquedaS INT;
    DECLARE CupoV INT;
    DECLARE CicloV INT;
    DECLARE SeccionV INT;
    SET CupoV = REGEXP_LIKE(Cupo_MaximoC,'^[0-9]+$');
    SET CicloV = REGEXP_LIKE(CicloC,'^1S$|^2S$|VJ$|^VD$');
    SET SeccionV = REGEXP_LIKE(SeccionC,'^[A-Z]$|^[a-z]$','i');
    
    IF CicloV = 1 THEN
		IF Cupov = 1 THEN
			IF SeccionV = 1 THEN
				SET busquedaC = (SELECT COUNT(Codigo) FROM Curso WHERE Codigo = CodigoC);
                IF busquedaC > 0 THEN
					SET busquedaS = (SELECT COUNT(No_Habilitacion) FROM Habilitar_Curso WHERE Seccion = UPPER(SeccionC));
                    IF BusquedaS > 0 THEN
						SET sms = 'La seccion ya esta registrada no se Pudo Habilitar el Curso';
						LEAVE lbl_habilitar_curso;
                    ELSE
						INSERT INTO Habilitar_Curso(Ciclo,Cupo_Maximo,Seccion,Year_Curso,Cantidad_Asignados,Registro_SIIF,Codigo)
                        VALUE(CicloC,Cupo_MaximoC,UPPER(SeccionC),CURDATE(),0,Registro_SIIFC,CodigoC);
						SET sms = 'Curso Habilitado';
						LEAVE lbl_habilitar_curso;
                    END IF;
                ELSE
					SET sms = 'El curso que desea habilitar no Existe';
					LEAVE lbl_habilitar_curso;
                END IF;
            ELSE
				SET sms = 'La seccion deber ser una Letra';
				LEAVE lbl_habilitar_curso;
            END IF;
        ELSE
			SET sms = 'El cupo debe ser un numero entero Positivo';
			LEAVE lbl_habilitar_curso;
        END IF;
    ELSE
		SET sms = 'El ciclo debe ser Valido deben ser 1S,2S,VJ o VD';
		LEAVE lbl_habilitar_curso;
    END IF;
END; ||
DELIMITER ;

-- //////////////TRIGERS
DROP TRIGGER insertHabilitacion;
DELIMITER ||
CREATE TRIGGER insertHabilitacion BEFORE INSERT ON Habilitar_Curso
FOR EACH ROW BEGIN
    INSERT INTO Transaccion(Tipo, Descripcion, Fecha)
    VALUES('INSERT', 'Se ha realizado una accion en la tabla Habilitar_Curso', NOW());
END ||
DELIMITER ;

-- ////////////////////////////////////////////HABILITAR HORARIO
DROP PROCEDURE IF EXISTS Habilitar_Horario;
DELIMITER ||
CREATE PROCEDURE Habilitar_Horario(
	DiaH INT(1),
	HorarioH VARCHAR(15),
	No_HabilitacionH INT,
    OUT sms VARCHAR(100)
) 
lbl_habilitar_horario:BEGIN
	DECLARE busquedaC INT;
    DECLARE DiaV INT;
    SET DiaV = REGEXP_LIKE(DiaH,'^[1-7]$');
    
    IF DiaV = 1 THEN
		SET busquedaC = (SELECT COUNT(No_Habilitacion) FROM Habilitar_Curso WHERE No_Habilitacion = No_HabilitacionH);
        IF busquedaC > 0 THEN
			INSERT INTO Horario(Dia,Horario,No_Habilitacion)
            VALUES(DiaH,HorarioH,No_HabilitacionH);
            SET sms = 'Horario Agregado';
			LEAVE lbl_habilitar_horario;
        ELSE
			SET sms = 'ERROR el curso no esta Habilitado';
			LEAVE lbl_habilitar_horario;
        END IF;
    ELSE
		SET sms = 'El dia es Incorrecto debe ser un dia de la semana entre 1-7';
		LEAVE lbl_habilitar_horario;
    END IF;
END; ||
DELIMITER ;

-- //////////////TRIGERS
DROP TRIGGER insertHorario;
DELIMITER ||
CREATE TRIGGER insertHorario BEFORE INSERT ON Horario
FOR EACH ROW BEGIN
    INSERT INTO Transaccion(Tipo, Descripcion, Fecha)
    VALUES('INSERT', 'Se ha realizado una accion en la tabla Horario', NOW());
END ||
DELIMITER ;
