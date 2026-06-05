CREATE TABLE DIM_CLIENTE
(
    cliente_key INT PRIMARY KEY,
    nombre_comercial VARCHAR(150),
    tipo_cliente CHAR(1)
);
GO

CREATE TABLE DIM_USUARIO
(
    usuario_key INT PRIMARY KEY,
    nombre_completo VARCHAR(150),
    correo VARCHAR(150)
);
GO

CREATE TABLE DIM_ETAPA
(
    etapa_key INT PRIMARY KEY,
    nombre_etapa VARCHAR(100),
    porcentaje INT
);
GO

CREATE TABLE FACT_OPORTUNIDADES
(
    id_fact INT IDENTITY(1,1) PRIMARY KEY,

    id_oportunidad INT,

    cliente_key INT,

    usuario_key INT,

    etapa_key INT,

    estado VARCHAR(20),

    fecha_inicio DATE,

    fecha_cierre DATE,

    monto_potencial DECIMAL(18,2),

    monto_ponderado DECIMAL(18,2)
);
GO
