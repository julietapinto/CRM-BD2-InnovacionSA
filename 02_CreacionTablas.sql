CREATE TABLE ROLES
(
    id_rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre_rol VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    activo BIT NOT NULL DEFAULT 1
);
GO

CREATE TABLE USUARIOS
(
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    contrasena_hash VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    activo BIT NOT NULL DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_USUARIOS_ROLES
    FOREIGN KEY(id_rol)
    REFERENCES ROLES(id_rol)
);
GO

CREATE TABLE CLIENTES
(
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre_comercial VARCHAR(150) NOT NULL,
    direccion VARCHAR(250),
    telefono VARCHAR(20),
    celular VARCHAR(20),
    correo VARCHAR(150),

    tipo_cliente CHAR(1) NOT NULL,

    id_usuario_asignado INT NOT NULL,

    activo BIT DEFAULT 1,

    created_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_CLIENTES_USUARIO
    FOREIGN KEY(id_usuario_asignado)
    REFERENCES USUARIOS(id_usuario),

    CONSTRAINT CK_CLIENTE_TIPO
    CHECK(tipo_cliente IN ('P','F'))
);
GO

CREATE TABLE CONTACTOS
(
    id_contacto INT IDENTITY(1,1) PRIMARY KEY,

    id_cliente INT NOT NULL,

    nombre_contacto VARCHAR(150) NOT NULL,

    telefono_contacto VARCHAR(20),

    correo_contacto VARCHAR(150),

    cargo VARCHAR(100),

    activo BIT DEFAULT 1,

    CONSTRAINT FK_CONTACTO_CLIENTE
    FOREIGN KEY(id_cliente)
    REFERENCES CLIENTES(id_cliente)
);
GO

CREATE TABLE ETAPAS_OPORTUNIDAD
(
    id_etapa INT IDENTITY(1,1) PRIMARY KEY,

    nombre_etapa VARCHAR(100) NOT NULL,

    porcentaje INT NOT NULL,

    orden INT NOT NULL,

    activo BIT DEFAULT 1,

    CONSTRAINT CK_ETAPA_PORCENTAJE
    CHECK(porcentaje BETWEEN 0 AND 100)
);
GO

CREATE TABLE OPORTUNIDADES
(
    id_oportunidad INT IDENTITY(1,1) PRIMARY KEY,

    numero_oportunidad VARCHAR(50) UNIQUE,

    nombre_oportunidad VARCHAR(150),

    tipo_oportunidad CHAR(1),

    id_cliente INT NOT NULL,

    id_contacto INT NOT NULL,

    id_asistente INT NOT NULL,

    id_gerente INT NOT NULL,

    id_etapa INT NOT NULL,

    estado VARCHAR(20) NOT NULL,

    fecha_inicio DATE,

    fecha_cierre DATE,

    cierre_planificado INT,

    fecha_cierre_prevista DATE,

    monto_potencial DECIMAL(18,2),

    monto_ponderado DECIMAL(18,2),

    comentario_resultado VARCHAR(500),

    created_at DATETIME DEFAULT GETDATE(),

    updated_at DATETIME,

    CONSTRAINT FK_OP_CLIENTE
        FOREIGN KEY(id_cliente)
        REFERENCES CLIENTES(id_cliente),

    CONSTRAINT FK_OP_CONTACTO
        FOREIGN KEY(id_contacto)
        REFERENCES CONTACTOS(id_contacto),

    CONSTRAINT FK_OP_ASISTENTE
        FOREIGN KEY(id_asistente)
        REFERENCES USUARIOS(id_usuario),

    CONSTRAINT FK_OP_GERENTE
        FOREIGN KEY(id_gerente)
        REFERENCES USUARIOS(id_usuario),

    CONSTRAINT FK_OP_ETAPA
        FOREIGN KEY(id_etapa)
        REFERENCES ETAPAS_OPORTUNIDAD(id_etapa)
);
GO


CREATE TABLE ACTIVIDADES
(
    id_actividad INT IDENTITY(1,1) PRIMARY KEY,

    numero_actividad VARCHAR(50),

    id_oportunidad INT,

    id_cliente INT,

    id_contacto INT,

    id_responsable INT,

    tipo_actividad VARCHAR(50),

    asunto VARCHAR(200),

    prioridad VARCHAR(20),

    hora_inicio TIME,

    hora_final TIME,

    duracion_minutos INT,

    estado_actividad VARCHAR(50),

    comentario VARCHAR(500),

    fecha DATE,

    calle VARCHAR(150),

    ciudad VARCHAR(100),

    sala VARCHAR(100),

    activo BIT DEFAULT 1,

    created_at DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_ACT_OPORTUNIDAD
        FOREIGN KEY(id_oportunidad)
        REFERENCES OPORTUNIDADES(id_oportunidad),

    CONSTRAINT FK_ACT_CLIENTE
        FOREIGN KEY(id_cliente)
        REFERENCES CLIENTES(id_cliente),

    CONSTRAINT FK_ACT_CONTACTO
        FOREIGN KEY(id_contacto)
        REFERENCES CONTACTOS(id_contacto),

    CONSTRAINT FK_ACT_RESPONSABLE
        FOREIGN KEY(id_responsable)
        REFERENCES USUARIOS(id_usuario)
);
GO

CREATE TABLE AUDITORIA
(
    id_auditoria INT IDENTITY(1,1) PRIMARY KEY,

    tabla_afectada VARCHAR(100),

    operacion CHAR(1),

    id_registro INT,

    datos_anteriores NVARCHAR(MAX),

    datos_nuevos NVARCHAR(MAX),

    id_usuario INT,

    fecha_hora DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_AUDITORIA_USUARIO
    FOREIGN KEY(id_usuario)
    REFERENCES USUARIOS(id_usuario)
);
GO