-- Combine with error data
with ErrorData AS (
    SELECT
        e.DATETIME,
        e.MACHINEID,
        e.ERRORID
    FROM
        PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE.PDM_ERRORS AS e
)

SELECT * from ErrorData