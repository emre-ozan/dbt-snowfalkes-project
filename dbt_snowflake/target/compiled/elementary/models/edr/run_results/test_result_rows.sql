

-- depends_on: PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.elementary_test_results
with empty_table as (
            select
            
                
        cast('this_is_just_a_long_dummy_string' as varchar) as elementary_test_results_id

,
                
        cast('this_is_just_a_long_dummy_string' as varchar) as result_row

,
                cast('2091-02-17' as timestamp) as detected_at

,
                cast('2091-02-17' as timestamp) as created_at


            )
        select * from empty_table
        where 1 = 0