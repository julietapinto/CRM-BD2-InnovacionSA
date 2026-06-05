/* CLIENTES */

INSERT INTO DIM_CLIENTE
SELECT
    id_cliente,
    nombre_comercial,
    tipo_cliente
FROM CLIENTES;


/* USUARIOS */

INSERT INTO DIM_USUARIO
SELECT
    id_usuario,
    nombre_completo,
    correo
FROM USUARIOS;


/* ETAPAS */

INSERT INTO DIM_ETAPA
SELECT
    id_etapa,
    nombre_etapa,
    porcentaje
FROM ETAPAS_OPORTUNIDAD;


/* OPORTUNIDADES */

INSERT INTO FACT_OPORTUNIDADES
(
    id_oportunidad,
    cliente_key,
    usuario_key,
    etapa_key,
    estado,
    fecha_inicio,
    fecha_cierre,
    monto_potencial,
    monto_ponderado
)
SELECT
    id_oportunidad,
    id_cliente,
    id_gerente,
    id_etapa,
    estado,
    fecha_inicio,
    fecha_cierre,
    monto_potencial,
    monto_ponderado
FROM OPORTUNIDADES;
