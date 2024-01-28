
  
    

        create or replace transient table PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_final_table.comprehensiveInsights
         as
        (-- Combine telemetry data with machine features

-- This is to define the data storage to be in table not in view
 

WITH TelemetryFeatures AS (
    SELECT * FROM PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_telemetry_features
)

-- Calculate average telemetry values per machine
, AvgTelemetry AS (
    SELECT * FROM PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_avg_telemetry
)

-- Combine with error data
, ErrorData AS (
    SELECT * FROM PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_error_data
)

-- Combine with maintenance data
, MaintenanceData AS (
    SELECT * FROM PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_maintenance_data
)

-- Combine with failure data
, FailureData AS (
    SELECT * FROM PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_staging.stg_failure_data
),

-- Combine all data for comprehensive insights
ComprehensiveInsights AS (
    SELECT
        tf.DATETIME,
        tf.MACHINEID,
        tf.MODEL,
        tf.AGE,
        at.AVG_VOLT,
        at.AVG_ROTATE,
        at.AVG_PRESSURE,
        at.AVG_VIBRATION,
        ed.ERRORID,
        md.COMP,
        fd.FAILURE
    FROM
        TelemetryFeatures tf
    LEFT JOIN AvgTelemetry AS at ON tf.MACHINEID = at.MACHINEID
    LEFT JOIN ErrorData AS ed ON tf.MACHINEID = ed.MACHINEID AND tf.DATETIME = ed.DATETIME
    LEFT JOIN MaintenanceData AS md ON tf.MACHINEID = md.MACHINEID AND tf.DATETIME = md.DATETIME
    LEFT JOIN FailureData AS fd ON tf.MACHINEID = fd.MACHINEID AND tf.DATETIME = fd.DATETIME
)

select * from ComprehensiveInsights
        );
      
  