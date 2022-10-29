USE PROYECTO2DB1;
-- CARRERAS

CALL Insertar_Carrera('AreaComun',@Salida);
SELECT @Salida;
CALL Insertar_Carrera('Sistemas',@Salida);
SELECT @Salida;
CALL Insertar_Carrera('Civil',@Salida);
SELECT @Salida;
CALL Insertar_Carrera('Electrica',@Salida);
SELECT @Salida;
CALL Insertar_Carrera('Qumica',@Salida);
SELECT @Salida;
SELECT * FROM Carrera;

-- DOCENTES

CALL Insertar_Docente(30481,'Luis','Rivera','1996-11-23','luisi.najera@gmail.com',50258299041,'4ta calle',@Salida);
SELECT @Salida;
CALL Insertar_Docente(30482,'Randall','Ramos','1996-10-03','randall.ramos@gmail.com',50258291247,'5ta calle',@Salida);
SELECT @Salida;
CALL Insertar_Docente(30483,'Edward','Gomez','1996-01-29','edgom@gmail.com',50258299145,'6ta calle',@Salida);
SELECT @Salida;
CALL Insertar_Docente(30484,'Kevin','Ruiz','1996-06-12','kruiz@gmail.com',5022829914,'7ta calle',@Salida);
SELECT @Salida;
CALL Insertar_Docente(30485,'Bryan','Alvarado','1996-12-31','bryanalvarado@gmail.com',5025898904,'8ta calle',@Salida);
SELECT @Salida;
SELECT * FROM Docente;

-- ESTUDIANTES

CALL Insertar_Estudiante(201602811,'Luis1','Rivera1','1996-11-21','luis.najera1@gmail.com',50258299041,'1ra calle',3048558980111,2,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602812,'Luis2','Rivera2','1996-11-22','luis.najera2@gmail.com',50258299042,'2da calle',3048558980112,2,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602813,'Luis3','Rivera3','1996-11-23','luis.najera3@gmail.com',50258299043,'3ra calle',3048558980113,2,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602814,'Luis4','Rivera4','1996-11-24','luis.najera4@gmail.com',50258299044,'4ta calle',3048558980114,3,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602815,'Luis5','Rivera5','1996-11-25','luis.najera5@gmail.com',50258299045,'5ta calle',3048558980115,3,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602816,'Luis6','Rivera6','1996-11-26','luis.najera6@gmail.com',50258299046,'6ta calle',3048558980116,4,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602817,'Luis7','Rivera7','1996-11-27','luis.najera7@gmail.com',50258299047,'7ma calle',3048558980117,4,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602818,'Luis8','Rivera8','1996-11-28','luis.najera8@gmail.com',50258299048,'8va calle',3048558980118,5,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602819,'Luis9','Rivera9','1996-11-29','luis.najera9@gmail.com',50258299049,'9na calle',3048558980119,5,@Salida);
SELECT @Salida;
CALL Insertar_Estudiante(201602820,'Luis10','Rivera10','1996-11-30','luis.najera10@gmail.com',50258299050,'10ma calle',3048558980110,5,@Salida);
SELECT @Salida;
SELECT * FROM Estudiante;

-- CURSOS

CALL Crear_Curso('Matematica Basica 1',0,3,1,0,@Salida);
SELECT @Salida;
CALL Crear_Curso('Matematica Basica 2',5,9,1,0,@Salida);
SELECT @Salida;
CALL Crear_Curso('Deportes 1',0,2,0,0,@Salida);
SELECT @Salida;
CALL Crear_Curso('Fisica Basica',15,5,1,0,@Salida);
SELECT @Salida;
CALL Crear_Curso('Deportes 2',10,2,0,0,@Salida);
SELECT @Salida;

CALL Crear_Curso('IPC1',20,6,1,2,@Salida);
SELECT @Salida;
CALL Crear_Curso('IPC2 2',30,6,1,2,@Salida);
SELECT @Salida;
CALL Crear_Curso('Estructura de Datos',35,6,1,2,@Salida);
SELECT @Salida;
CALL Crear_Curso('Manejo e Implementacion de Archivos',40,5,1,2,@Salida);
SELECT @Salida;
CALL Crear_Curso('Base de Datos 1',50,6,1,2,@Salida);
SELECT @Salida;

CALL Crear_Curso('Cementos 1',20,6,1,3,@Salida);
SELECT @Salida;
CALL Crear_Curso('Cementos2 2',30,6,1,3,@Salida);
SELECT @Salida;
CALL Crear_Curso('Estructuras',35,6,1,3,@Salida);
SELECT @Salida;
CALL Crear_Curso('Mezclas',40,5,1,3,@Salida);
SELECT @Salida;
CALL Crear_Curso('Puentes Avanzados',50,6,1,3,@Salida);
SELECT @Salida;

CALL Crear_Curso('Electricidad 1',20,6,1,4,@Salida);
SELECT @Salida;
CALL Crear_Curso('Electricidad 2',30,6,1,4,@Salida);
SELECT @Salida;
CALL Crear_Curso('Circuitos',35,6,1,4,@Salida);
SELECT @Salida;
CALL Crear_Curso('Cables',40,5,1,4,@Salida);
SELECT @Salida;
CALL Crear_Curso('Circuitos Avanzados',50,6,1,4,@Salida);
SELECT @Salida;

CALL Crear_Curso('Quimica 1',20,6,1,5,@Salida);
SELECT @Salida;
CALL Crear_Curso('Qumica 2',30,6,1,5,@Salida);
SELECT @Salida;
CALL Crear_Curso('Moles',35,6,1,5,@Salida);
SELECT @Salida;
CALL Crear_Curso('Posiones',40,5,1,5,@Salida);
SELECT @Salida;
CALL Crear_Curso('Posiones Avanzadas',50,6,1,5,@Salida);
SELECT @Salida;
SELECT * FROM Curso;

-- HABILITACIONES

CALL Habilitar_Curso('2S',1,90,'a',1,@Salida);
SELECT @Salida;
SELECT * FROM Habilitar_Curso;

-- HORARIOS

CALL Habilitar_Horario(2,'9:00-10:40',1,@Salida);
SELECT @Salida;
SELECT * FROM Horario;

-- TRANSACCIONES
SELECT * FROM Transaccion;