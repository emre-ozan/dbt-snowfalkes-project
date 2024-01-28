
  create or replace   view PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_failure_data
  
   as (
    -- Combine with failure data
with FailureData AS (
    SELECT
        f.DATETIME,
        f.MACHINEID,
        f.FAILURE
    FROM
        PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE.PDM_FAILURES AS f
)

select * from FailureData
  );

