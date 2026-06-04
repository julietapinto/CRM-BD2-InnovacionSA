CREATE PROCEDURE sp_InsertarCliente
(
    @nombre_comercial VARCHAR(150),
    @direccion VARCHAR(250),
    @telefono VARCHAR(20),
    @celular VARCHAR(20),
    @correo VARCHAR(150),
    @tipo_cliente CHAR(1),
    @id_usuario_asignado INT
)
AS
BEGIN

    INSERT INTO CLIENTES
    (
        nombre_comercial,
        direccion,
        telefono,
        celular,
        correo,
        tipo_cliente,
        id_usuario_asignado
    )
    VALUES
    (
        @nombre_comercial,
        @direccion,
        @telefono,
        @celular,
        @correo,
        @tipo_cliente,
        @id_usuario_asignado
    );

END;
GO





CREATE PROCEDURE sp_ActualizarCliente
(
    @id_cliente INT,
    @telefono VARCHAR(20),
    @correo VARCHAR(150)
)
AS
BEGIN

    UPDATE CLIENTES
    SET
        telefono = @telefono,
        correo = @correo
    WHERE id_cliente = @id_cliente;

END;
GO




CREATE PROCEDURE sp_CrearOportunidad
(
    @numero_oportunidad VARCHAR(50),
    @nombre_oportunidad VARCHAR(150),
    @tipo_oportunidad CHAR(1),
    @id_cliente INT,
    @id_contacto INT,
    @id_asistente INT,
    @id_gerente INT,
    @monto_potencial DECIMAL(18,2),
    @cierre_planificado INT
)
AS
BEGIN

    BEGIN TRY

        BEGIN TRANSACTION;

        INSERT INTO OPORTUNIDADES
        (
            numero_oportunidad,
            nombre_oportunidad,
            tipo_oportunidad,
            id_cliente,
            id_contacto,
            id_asistente,
            id_gerente,
            id_etapa,
            estado,
            fecha_inicio,
            cierre_planificado,
            fecha_cierre_prevista,
            monto_potencial,
            monto_ponderado
        )
        VALUES
        (
            @numero_oportunidad,
            @nombre_oportunidad,
            @tipo_oportunidad,
            @id_cliente,
            @id_contacto,
            @id_asistente,
            @id_gerente,
            1,
            'ABIERTO',
            GETDATE(),
            @cierre_planificado,
            DATEADD(DAY,@cierre_planificado,GETDATE()),
            @monto_potencial,
            @monto_potencial * 0.20
        );

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        THROW;

    END CATCH

END;
GO


CREATE PROCEDURE sp_CerrarOportunidad
(
    @id_oportunidad INT,
    @estado_final VARCHAR(20),
    @comentario VARCHAR(500)
)
AS
BEGIN

    DECLARE @porcentaje INT;

    SELECT
        @porcentaje = e.porcentaje
    FROM OPORTUNIDADES o
    INNER JOIN ETAPAS_OPORTUNIDAD e
        ON o.id_etapa = e.id_etapa
    WHERE o.id_oportunidad = @id_oportunidad;

    IF @porcentaje < 100
    BEGIN
        RAISERROR(
        'La oportunidad no puede cerrarse porque no está al 100',
        16,
        1);
        RETURN;
    END;

    IF LEN(ISNULL(@comentario,'')) = 0
    BEGIN
        RAISERROR(
        'Debe ingresar un comentario de cierre',
        16,
        1);
        RETURN;
    END;

    UPDATE OPORTUNIDADES
    SET
        estado = @estado_final,
        comentario_resultado = @comentario,
        fecha_cierre = GETDATE(),
        updated_at = GETDATE()
    WHERE id_oportunidad = @id_oportunidad;

END;
GO



CREATE PROCEDURE sp_InsertarActividad
(
    @numero_actividad VARCHAR(50),
    @id_oportunidad INT,
    @id_cliente INT,
    @id_contacto INT,
    @id_responsable INT,
    @tipo_actividad VARCHAR(50),
    @asunto VARCHAR(200),
    @prioridad VARCHAR(20)
)
AS
BEGIN

    INSERT INTO ACTIVIDADES
    (
        numero_actividad,
        id_oportunidad,
        id_cliente,
        id_contacto,
        id_responsable,
        tipo_actividad,
        asunto,
        prioridad,
        fecha
    )
    VALUES
    (
        @numero_actividad,
        @id_oportunidad,
        @id_cliente,
        @id_contacto,
        @id_responsable,
        @tipo_actividad,
        @asunto,
        @prioridad,
        GETDATE()
    );

END;
GO


CREATE PROCEDURE sp_ReporteOportunidades
AS
BEGIN

    SELECT

        o.numero_oportunidad,
        o.nombre_oportunidad,
        c.nombre_comercial,
        e.nombre_etapa,
        e.porcentaje,
        o.estado,
        o.monto_potencial,
        o.monto_ponderado,
        o.fecha_inicio

    FROM OPORTUNIDADES o

    INNER JOIN CLIENTES c
        ON o.id_cliente = c.id_cliente

    INNER JOIN ETAPAS_OPORTUNIDAD e
        ON o.id_etapa = e.id_etapa

    ORDER BY o.fecha_inicio DESC;

END;
GO


SELECT name
FROM sys.procedures
ORDER BY name;

SELECT * FROM ROLES;
SELECT * FROM USUARIOS;
SELECT * FROM ETAPAS_OPORTUNIDAD;