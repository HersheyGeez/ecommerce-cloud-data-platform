
{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per customer_id
-- Purpose: Clean and Standardize raw customer data for downstream analysis

with source as (

    select *
    from {{ source('RAW', 'customers_raw') }}

),

cleaned as (

    select 
        customer_id,
        customer_unique_id,

        -- Preservign leading zeros
        lpad(trim(customer_zip_code_prefix), 5, '0') as zip_code_prefix,

        -- Standardizing location fields
        trim(lower(customer_city)) as city,
        trim(upper(customer_state)) as state
    
    from source

)

select *
from cleaned