CREATE TRIGGER trg_AuditoriaOportunidades
ON OPORTUNIDADES
AFTER UPDATE
AS
BEGIN

    INSERT INTO AUDITORIA
    (
        tabla_afectada,
        operacion,
        id_registro,
        datos_anteriores,
        datos_nuevos,
        id_usuario,
        fecha_hora
    )
    SELECT
        'OPORTUNIDADES',
        'U',
        d.id_oportunidad,
        d.estado,
        i.estado,
        1,
        GETDATE()
    FROM deleted d
    INNER JOIN inserted i
        ON d.id_oportunidad=i.id_oportunidad;

END;
GO


CREATE TRIGGER trg_HistorialOportunidades
ON OPORTUNIDADES
AFTER UPDATE
AS
BEGIN

    INSERT INTO HISTORIAL_OPORTUNIDADES
    (
        id_oportunidad,
        estado_anterior,
        estado_nuevo
    )
    SELECT
        d.id_oportunidad,
        d.estado,
        i.estado
    FROM deleted d
    INNER JOIN inserted i
        ON d.id_oportunidad=i.id_oportunidad
    WHERE d.estado <> i.estado;

END;
GO

SELECT name
FROM sys.triggers;

