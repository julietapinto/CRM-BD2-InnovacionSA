
EXEC sp_InsertarCliente
    @nombre_comercial='Empresa ABC',
    @direccion='Zona 10',
    @telefono='22223333',
    @celular='55556666',
    @correo='contacto@abc.com',
    @tipo_cliente='P',
    @id_usuario_asignado=3;

SELECT * FROM CLIENTES;

EXEC sp_ActualizarCliente
    @id_cliente=1,
    @telefono='99998888',
    @correo='nuevo@abc.com';

SELECT * FROM CLIENTES;

INSERT INTO CONTACTOS
(
    id_cliente,
    nombre_contacto,
    telefono_contacto,
    correo_contacto,
    cargo
)
VALUES
(
    1,
    'Pedro Garcia',
    '44445555',
    'pedro@abc.com',
    'Gerente Compras'
);

SELECT * FROM CONTACTOS;

EXEC sp_CrearOportunidad
    @numero_oportunidad='OP-001',
    @nombre_oportunidad='Venta Software ERP',
    @tipo_oportunidad='V',
    @id_cliente=1,
    @id_contacto=1,
    @id_asistente=3,
    @id_gerente=2,
    @monto_potencial=50000,
    @cierre_planificado=30;


SELECT * FROM OPORTUNIDADES;

EXEC sp_CerrarOportunidad
    @id_oportunidad=1,
    @estado_final='GANADA',
    @comentario='Cliente aceptó propuesta';


SELECT
    o.id_oportunidad,
    o.estado,
    o.id_etapa,
    e.nombre_etapa,
    e.porcentaje
FROM OPORTUNIDADES o
INNER JOIN ETAPAS_OPORTUNIDAD e
    ON o.id_etapa = e.id_etapa;


EXEC sp_CerrarOportunidad
    @id_oportunidad=1,
    @estado_final='GANADA',
    @comentario='Cliente aceptó';


SELECT
    o.id_oportunidad,
    o.estado,
    o.id_etapa,
    e.nombre_etapa,
    e.porcentaje
FROM OPORTUNIDADES o
INNER JOIN ETAPAS_OPORTUNIDAD e
    ON o.id_etapa = e.id_etapa
WHERE o.id_oportunidad = 1;

UPDATE OPORTUNIDADES
SET
    id_etapa = 6,
    updated_at = GETDATE()
WHERE id_oportunidad = 1;



SELECT
    o.id_oportunidad,
    e.nombre_etapa,
    e.porcentaje
FROM OPORTUNIDADES o
INNER JOIN ETAPAS_OPORTUNIDAD e
    ON o.id_etapa = e.id_etapa
WHERE o.id_oportunidad = 1;


EXEC sp_CerrarOportunidad
    @id_oportunidad = 1,
    @estado_final = 'GANADA',
    @comentario = 'Cliente aceptó la propuesta';


SELECT
    id_oportunidad,
    estado,
    fecha_cierre,
    comentario_resultado
FROM OPORTUNIDADES
WHERE id_oportunidad = 1;


SELECT * FROM AUDITORIA;
SELECT * FROM HISTORIAL_OPORTUNIDADES;

SELECT name
FROM sys.procedures
ORDER BY name;

SELECT name
FROM sys.triggers
ORDER BY name;

SELECT * FROM AUDITORIA;
SELECT * FROM HISTORIAL_OPORTUNIDADES;
SELECT * FROM HISTORIAL_ACTIVIDADES;
EXEC sp_ReporteOportunidades;