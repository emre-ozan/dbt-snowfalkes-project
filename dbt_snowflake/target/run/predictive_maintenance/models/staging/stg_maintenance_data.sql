
  create or replace   view PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_maintenance_data
  
   as (
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
  );

