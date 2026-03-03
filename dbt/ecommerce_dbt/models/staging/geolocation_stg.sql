{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per geolocation observation
-- Purpose: Clean and Standardize raw geolocation data for downstream analysis

with source as (

    select *
    from {{ source('RAW', 'geolocation_raw') }}

),

cleaned as (
    select
        lpad(trim(geolocation_zip_code_prefix), 5, '0') as zip_code_prefix,
        geolocation_lat as latitude,
        geolocation_lng as longitude,
        lower(trim(geolocation_city)) as city,
        upper(trim(geolocation_state)) as state
    from source
)

select * from cleaned