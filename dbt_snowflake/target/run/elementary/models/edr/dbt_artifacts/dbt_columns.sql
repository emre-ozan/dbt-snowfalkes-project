
  create or replace   view PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_columns
  
   as (
    

    
  
    
  

  with dbt_models_data as (
      select
          database_name,
          schema_name,
          alias as table_name
      from PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_models
  ),

  dbt_snapshots_data as (
      select
          database_name,
          schema_name,
          alias as table_name
      from PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_snapshots
  ),

  dbt_sources_data as (
      select
          database_name,
          schema_name,
          name as table_name
      from PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_sources
  ),

  dbt_seeds_data as (
      select
          database_name,
          schema_name,
          name as table_name
      from PREDICTIVE_MAINTENANCE.DBT_WITH_SNOWFLAKE_elementary.dbt_seeds
  ),

  tables_information as (
      select * from dbt_models_data
      union all
      select * from dbt_sources_data
      union all
      select * from dbt_snapshots_data
      union all
      select * from dbt_seeds_data
  ),

  columns_information as (
      
    
    
    
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
        
    



  ),

  dbt_columns as (
      select col_info.*
      from tables_information tbl_info
      join columns_information col_info
          on (lower(tbl_info.database_name) = lower(col_info.database_name) and
              lower(tbl_info.schema_name) = lower(col_info.schema_name) and
              lower(tbl_info.table_name) = lower(col_info.table_name)
          )
  )

  select *
  from dbt_columns


  );

