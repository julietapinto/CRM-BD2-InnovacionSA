# Sistema CRM — Gestión Comercial Innovación S.A.
## Proyecto Final — Base de Datos II

**Universidad Mariano Gálvez de Guatemala**  
**Curso:** Base de Datos II  
**Catedrático:** Ing. Julio Gomez  
**Fecha de entrega:** 04 de junio de 2026  

---

## Integrantes

| Nombre | Carné | Rol |
|---|---|---|
| Dalila Nineth Zacarías de León | 7690-22-18678 | Diseño y Modelado de Base de Datos |
| Julieta Ester Pinto Garcia | 7690-24-742 | Programación SQL (Stored Procedures + Triggers) |
| Edson Rafael Gill Cardona | 7690-24-742 | ETL, Data Warehouse y Alta Disponibilidad |
| Angelina Victoria Pinto Garcia | 7690-24-499 | Documentación, GitHub y Presentación |

---

## Descripción del Proyecto

Sistema de gestión comercial (CRM) para la empresa Innovación S.A., desarrollado
como proyecto final del curso Base de Datos II. El sistema permite al departamento
comercial gestionar clientes, dar seguimiento a oportunidades de venta y registrar
actividades, con reportes para la toma de decisiones gerenciales.

---

## Estructura del Repositorio
CRM-BD2-InnovacionSA/
├── 01_CreacionBD.sql           — Creación de la base de datos
├── 02_CreacionTablas.sql       — Creación de tablas, PK, FK y constraints
├── 03_DatosIniciales.sql       — Datos base del sistema
├── 04_StoredProcedures.sql     — Procedimientos almacenados CRUD
├── 05_Triggers.sql             — Triggers de auditoría y validación
├── 06_Pruebas.sql              — Scripts de prueba
├── 07_DataWarehouse.sql        — Modelo Data Warehouse
├── 08_ETL.sql                  — Proceso ETL
├── 09_Reportes.sql             — Consultas avanzadas y reportes
├── 10_Backup.sql               — Configuración de backup
├── 11_Optimizacion.sql         — Optimización de consultas
└── README.md                   — Documentación del proyecto

---

## Tablas del Sistema

| Tabla | Descripción |
|---|---|
| Roles | Roles de acceso del sistema |
| Usuarios | Personal comercial y gerentes |
| Clientes | Empresas clientes (potencial o final) |
| Contactos | Personas de contacto dentro del cliente |
| EtapasOportunidad | Catálogo de etapas con porcentaje de avance |
| Oportunidades | Negociaciones activas con seguimiento por etapas |
| Actividades | Llamadas, reuniones, tareas y notas de seguimiento |
| Auditoria | Registro automático de todas las operaciones |

---

## Cómo ejecutar el proyecto

1. Abrir **SQL Server Management Studio (SSMS)**
2. Ejecutar los scripts en orden numérico:
   - Primero `01_CreacionBD.sql`
   - Luego `02_CreacionTablas.sql`
   - Continuar hasta `11_Optimizacion.sql`
3. Verificar la creación con:

```sql
USE InnovacionCRM;
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';
```

---

## Tecnologías utilizadas

- **Motor de base de datos:** Microsoft SQL Server
- **Herramienta:** SQL Server Management Studio (SSMS)
- **Control de versiones:** GitHub
- **Documentación:** Microsoft Word

---

## Módulos del sistema

- Gestión de Contactos y Cuentas
- Seguimiento de Oportunidades por etapas
- Gestión de Actividades (llamadas, reuniones, tareas, notas)
- Reportes gerenciales

---

## Etapas de Oportunidad

| Etapa | Porcentaje |
|---|---|
| Toma de Decisión | 20% |
| Proceso Toma de Decisión | 30% |
| Análisis de Proyecto | 50% |
| Presentación de Cotización | 80% |
| Validación de Cotización | 95% |
| Acuerdo de Cierre | 100% |



