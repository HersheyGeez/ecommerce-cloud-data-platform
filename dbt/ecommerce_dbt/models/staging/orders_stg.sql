{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per order_id
-- Purpose: Clean and Standardize raw order data for downstream analysis

with source as (

    select *
    from {{ source('RAW', 'orders_raw') }}

),

cleaned as (

    select 
        order_id,
        customer_id,
        lower(trim(order_status)) as order_status,
        cast(order_purchase_timestamp as timestamp) as order_purchase_ts,
        cast(order_approved_at as timestamp) as order_approved_ts,
        cast(order_delivered_carrier_date as timestamp) as order_delivered_carrier_ts,
        cast(order_delivered_customer_date as timestamp) as order_delivered_customer_ts,
        cast(order_estimated_delivery_date as date) as estimated_delivery_dt
    from source

)

select *
from cleaned