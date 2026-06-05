/* =====================================
   REPORTE 1
   OPORTUNIDADES GANADAS Y PERDIDAS
===================================== */

SELECT
    estado,
    COUNT(*) AS total
FROM FACT_OPORTUNIDADES
GROUP BY estado;
GO


/* =====================================
   REPORTE 2
   RENDIMIENTO POR GERENTE
===================================== */

SELECT
    u.nombre_completo,
    COUNT(*) AS oportunidades,
    SUM(f.monto_potencial) AS monto_total
FROM FACT_OPORTUNIDADES f
INNER JOIN DIM_USUARIO u
ON f.usuario_key = u.usuario_key
GROUP BY u.nombre_completo;
GO


/* =====================================
   REPORTE 3
   OPORTUNIDADES POR ETAPA
===================================== */

SELECT
    e.nombre_etapa,
    COUNT(*) total
FROM FACT_OPORTUNIDADES f
INNER JOIN DIM_ETAPA e
ON f.etapa_key = e.etapa_key
GROUP BY e.nombre_etapa;
GO


/* =====================================
   REPORTE 4
   OPORTUNIDADES POR FECHA
===================================== */

SELECT
    YEAR(fecha_inicio) anio,
    MONTH(fecha_inicio) mes,
    COUNT(*) total
FROM FACT_OPORTUNIDADES
GROUP BY
    YEAR(fecha_inicio),
    MONTH(fecha_inicio);
GO


/* =====================================
   REPORTE 5
   ACTIVIDADES PENDIENTES
===================================== */

SELECT
    id_responsable,
    COUNT(*) pendientes
FROM ACTIVIDADES
WHERE estado_actividad='PENDIENTE'
GROUP BY id_responsable;
GO
