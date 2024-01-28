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