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

CALL Insertar_Carrera('Prueba',@Salida);
SELECT @Salida;
SELECT * FROM Carrera;
-- ////////////////////////////////////////////REGISTRAR ESTUDIANTE
DROP PROCEDURE IF EXISTS Insertar_Estudiante;
DELIMITER ||
CREATE PROCEDURE Insertar_Estudiante(
	CarnetE BIGINT,
	NombreE VARCHAR(50),
	ApellidoE VARCHAR(50), 
	Fecha_NacimientoE DATE,
	CorreoE VARCHAR(100),
	TelefonoE INT,
	DireccionE VARCHAR(100),
	DPIE INT,
	Id_CarreraE INT,
    OUT sms VARCHAR(100)
) 
lbl_insertar_estudiante:BEGIN
	DECLARE busquedaE INT;
    DECLARE CarnetVeri INT;
    DECLARE CorreoVeri INT;
    DECLARE TelefonoV CHAR(12);
    DECLARE TelefonoI INT;
    SET TelefonoV = CAST(TelefonoE AS CHAR(12));
    SET TelefonoI = CAST(SUBSTRING(TelefonoV,4-12)AS INT);
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
		SET sms = 'Verifique que su Carnet o Correo sean Validos';
		LEAVE lbl_insertar_estudiante;
	END IF;
END; ||
DELIMITER ;

CALL Insertar_Estudiante(20160281,'Luis2','Rivera2','1996-11-23','luis.najera@gmail.com',5025829,'4ta calle',30485589,1,@Salida);
SELECT @Salida;
SELECT * FROM Estudiante;


