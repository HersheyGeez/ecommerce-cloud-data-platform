{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per seller_id
-- Purpose: Clean and Standardize raw sellers data for downstream analysis

with source as (

    select *
    from {{ source('RAW', 'sellers_raw') }}

),

cleaned as (

    select
        seller_id,
        lpad(trim(seller_zip_code_prefix), 5, '0') as zip_code_prefix,
        lower(trim(seller_city)) as city,
        upper(trim(seller_state)) as state
    from source

)

select *
from cleaned