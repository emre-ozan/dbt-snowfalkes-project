-- Combine with maintenance data
with MaintenanceData AS (
    SELECT
        m.DATETIME,
        m.MACHINEID,
        m.COMP
    FROM
        PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE.PDM_MAINT AS m
)

select * from MaintenanceData