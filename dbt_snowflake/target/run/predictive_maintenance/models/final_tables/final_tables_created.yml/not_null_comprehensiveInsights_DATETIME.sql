select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select DATETIME
from PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_final_table.comprehensiveInsights
where DATETIME is null



      
    ) dbt_internal_test