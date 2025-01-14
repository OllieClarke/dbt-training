{{
    config(
        materialized='table'
    )
}}

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2020-01-01' as date)",
    end_date="dateadd(week, 1, current_date)"
   )
}}