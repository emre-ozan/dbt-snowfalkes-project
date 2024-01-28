
  create or replace   view PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_telemetry_features
  
   as (
    -- Combine telemetry data with machine features
WITH TelemetryFeatures AS (
    SELECT
        t.DATETIME,
        t.MACHINEID,
        t.VOLT,
        t.ROTATE,
        t.PRESSURE,
        t.VIBRATION,
        m.MODEL,
        m.AGE
    FROM
        PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE.PDM_TELEMETRY AS t
    JOIN PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE.PDM_MACHINES AS m ON t.MACHINEID = m.MACHINEID
)

select * from TelemetryFeatures
  );

