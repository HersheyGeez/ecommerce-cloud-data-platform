{{
  config(
    materialized = 'table'
    )
}}

with order_items as (
    select
        order_id,
        order_item_id,
        product_id,
        seller_id,
        shipping_limit_ts,
        price,
        freight_value
    from {{ ref('order_items_stg') }}
),

orders as (
    select
        order_id,
        customer_id,
        order_status,
        order_purchase_ts,
        order_approved_ts,
        order_delivered_carrier_ts,
        order_delivered_customer_ts,
        estimated_delivery_dt
    from {{ ref('orders_stg') }}
),

products as (
    select 
        product_key,
        product_id,
        category_name,
        category_name_english,
        weight_g,
        length_cm,
        height_cm,
        width_cm
    from {{ ref('dim_products') }}
),

sellers as (
    select
        seller_key,
        seller_id,
        zip_code_prefix,
        city,
        state,
        latitude,
        longitude
    from {{ ref('dim_sellers') }}
),

customers as (
    select
        customer_key,
        customer_id,
        customer_unique_id,
        zip_code_prefix,
        city,
        state,
        effective_from,
        effective_to,
        is_current
    from {{ ref('dim_customers') }}
),

dates as (
    select
        date_key,
        date,
        year,
        quarter,
        month,
        day,
        month_name,
        day_name
    from {{ ref('dim_date') }}
),

joined as (
    select
        oi.order_id,
        oi.order_item_id,
        p.product_key,
        s.seller_key,
        c.customer_key,
        purchase_date.date_key as purchase_date_key,
        carrier_date.date_key as carrier_date_key,
        delivery_date.date_key as delivery_date_key,
        oi.price,
        oi.freight_value
    from order_items as oi
    left join orders as o
        on oi.order_id = o.order_id
    left join products as p
        on oi.product_id = p.product_id
    left join sellers as s
        on oi.seller_id = s.seller_id
    left join customers as c
        on o.customer_id = c.customer_id
        and c.is_current = true
    left join dates as purchase_date
        on DATE(o.order_purchase_ts) = purchase_date.date
    left join dates as carrier_date
        on DATE(o.order_delivered_carrier_ts) = carrier_date.date
    left join dates as delivery_date
        on DATE(o.order_delivered_customer_ts) = delivery_date.date
),

final as (
    select
        order_id,
        order_item_id,
        product_key,
        seller_key,
        customer_key,
        purchase_date_key,
        carrier_date_key,
        delivery_date_key,
        price,
        freight_value,
        current_timestamp() as created_at
    from joined
)

select *
from final