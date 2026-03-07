{{
  config(
    materialized = 'table'
  )
}}

with order_payments as (

    select
        order_id,
        payment_sequential,
        payment_type,
        installment as payment_installments,
        payment_value
    from {{ ref('order_payments_stg') }}

),

orders as (

    select
        order_id,
        customer_id,
        order_purchase_ts
    from {{ ref('orders_stg') }}

),

customers as (

    select
        customer_id,
        customer_key,
        is_current
    from {{ ref('dim_customers') }}

),

dates as (

    select
        date_key,
        date
    from {{ ref('dim_date') }}

),

joined as (

    select
        op.order_id,
        op.payment_sequential,

        c.customer_key,
        payment_date.date_key as payment_date_key,

        op.payment_type,
        op.payment_installments,
        op.payment_value

    from order_payments as op

    left join orders as o
        on op.order_id = o.order_id

    left join customers as c
        on o.customer_id = c.customer_id
        and c.is_current = true

    left join dates as payment_date
        on date(o.order_purchase_ts) = payment_date.date

),

final as (

    select
        order_id,
        payment_sequential,
        customer_key,
        payment_date_key,
        payment_type,
        payment_installments,
        payment_value
    from joined

)

select *
from final