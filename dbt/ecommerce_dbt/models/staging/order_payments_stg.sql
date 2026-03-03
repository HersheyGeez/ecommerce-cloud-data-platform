{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per (order_id, payment_sequential)
-- Purpose: Clean and Standardize raw payments data for downstream analysis


with source as (

    select *
    from {{ source('RAW', 'order_payments_raw') }}

),

cleaned as (

    select 
        order_id,
        payment_sequential,
        lower(trim(payment_type)) as payment_type,
        payment_installment as installment,
        payment_value
    from source
)

select *
from cleaned