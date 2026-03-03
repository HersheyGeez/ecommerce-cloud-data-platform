{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per category_name
-- Purpose: Clean and Standardize raw translation data for downstream analysis

with source as (
    select *
    from {{ source('RAW', 'category_name_translation_raw') }}
),

cleaned as (
    select
        trim(lower(product_category_name)) as category_name,
        trim(lower(product_category_name_english)) as category_name_english
    from source
)

select *
from cleaned
