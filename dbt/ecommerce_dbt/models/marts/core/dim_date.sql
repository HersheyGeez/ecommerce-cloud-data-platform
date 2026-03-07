{{
  config(
    materialized = 'table'
    )
}}

with date_spine as (
    {{
        dbt_utils.date_spine(
            datepart = "day",
            start_date = "to_date('2015-01-01')",
            end_date = "to_date('2030-12-31')"
        )
    }}
),

calendar as (
    select
        date_day,
        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        extract(quarter from date_day) as quarter,
        to_char(date_day, 'MON') as month_name,
        to_char(date_day, 'DY') as day_name
    from date_spine
),

final as (
    select 
        to_number(to_char(date_day, 'YYYYMMDD')) as date_key,
        date_day as date,
        year,
        quarter,
        month,
        day,
        month_name,
        day_name
    from calendar
)

select *
from final