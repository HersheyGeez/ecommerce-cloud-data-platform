{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per (order_id, order_item_id)
-- Purpose: Clean and Standardize raw order items data for downstream analysis

with source as (
    
    select *
    from {{ source('RAW', 'order_items_raw') }}

),

cleaned as (
    
    select 
        order_id,
        order_item_id,
        product_id,
        seller_id,
        cast(shipping_limit_date as timestamp) as shipping_limit_ts,
        price,
        freight_value

    from source
)

select *
from cleaned