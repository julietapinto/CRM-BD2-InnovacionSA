SELECT
    estado,
    COUNT(*) AS total
FROM FACT_OPORTUNIDADES
GROUP BY estado;
