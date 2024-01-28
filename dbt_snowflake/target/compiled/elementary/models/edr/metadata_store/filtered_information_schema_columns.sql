



with filtered_information_schema_columns as (
    
    
        (
    
    select
        upper(table_catalog || '.' || table_schema || '.' || table_name) as full_table_name,
        upper(table_catalog) as database_name,
        upper(table_schema) as schema_name,
        upper(table_name) as table_name,
        upper(column_name) as column_name,
        data_type
    from PREDICTIVE_MAINTENANCE.INFORMATION_SCHEMA.COLUMNS
    where upper(table_schema) = upper('DBT_WITH_SNOWFLAKE_final_table')
)
        
            union all
        
    
        (
    
    select
        upper(table_catalog || '.' || table_schema || '.' || table_name) as full_table_name,
        upper(table_catalog) as database_name,
        upper(table_schema) as schema_name,
        upper(table_name) as table_name,
        upper(column_name) as column_name,
        data_type
    from PREDICTIVE_MAINTENANCE.INFORMATION_SCHEMA.COLUMNS
    where upper(table_schema) = upper('DBT_WITH_SNOWFLAKE_staging')
)
        
            union all
        
    
        (
    
    select
        upper(table_catalog || '.' || table_schema || '.' || table_name) as full_table_name,
        upper(table_catalog) as database_name,
        upper(table_schema) as schema_name,
        upper(table_name) as table_name,
        upper(column_name) as column_name,
        data_type
    from PREDICTIVE_MAINTENANCE.INFORMATION_SCHEMA.COLUMNS
    where upper(table_schema) = upper('DBT_WITH_SNOWFLAKE')
)
        
    


)

select *
from filtered_information_schema_columns
where full_table_name is not null