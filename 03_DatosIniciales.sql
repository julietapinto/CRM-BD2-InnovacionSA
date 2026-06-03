INSERT INTO ROLES
(nombre_rol, descripcion, activo)
VALUES
('Administrador','Acceso total al sistema',1),
('Gerente Comercial','Gestion comercial',1),
('Asistente Comercial','Seguimiento comercial',1);
GO

SELECT*FROM ROLES;

INSERT INTO USUARIOS
(
nombre_completo,
correo,
contrasena_hash,
id_rol,
activo
)
VALUES
(
'Juan Perez',
'admin@innovacion.com',
'123456',
1,
1
),
(
'Maria Lopez',
'gerente@innovacion.com',
'123456',
2,
1
),
(
'Carlos Ramirez',
'asistente@innovacion.com',
'123456',
3,
1
);
GO

INSERT INTO ETAPAS_OPORTUNIDAD
(
nombre_etapa,
porcentaje,
orden,
activo
)
VALUES
('Toma de Decision',20,1,1),
('Proceso Toma de Decision',30,2,1),
('Analisis Proyecto',50,3,1),
('Presentacion Cotizacion',80,4,1),
('Validacion Cotizacion',95,5,1),
('Acuerdo de Cierre',100,6,1);
GO

SELECT*FROM ETAPAS_OPORTUNIDAD;

CREATE TABLE HISTORIAL_OPORTUNIDADES
(
    id_historial INT IDENTITY(1,1) PRIMARY KEY,

    id_oportunidad INT NOT NULL,

    estado_anterior VARCHAR(50),

    estado_nuevo VARCHAR(50),

    fecha_cambio DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE HISTORIAL_ACTIVIDADES
(
    id_historial INT IDENTITY(1,1) PRIMARY KEY,

    id_actividad INT NOT NULL,

    accion VARCHAR(50),

    fecha DATETIME DEFAULT GETDATE()
);
GO
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_NAME;