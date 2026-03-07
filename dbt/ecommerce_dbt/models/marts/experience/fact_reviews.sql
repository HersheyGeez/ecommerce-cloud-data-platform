{{
  config(
    materialized = 'table'
  )
}}

with reviews as (

    select
        review_id,
        order_id,
        score as review_score,
        review_creation_ts
    from {{ ref('reviews_stg') }}

),

orders as (

    select
        order_id,
        customer_id
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
        r.review_id,
        r.order_id,

        c.customer_key,
        review_date.date_key as review_date_key,

        r.review_score

    from reviews as r

    left join orders as o
        on r.order_id = o.order_id

    left join customers as c
        on o.customer_id = c.customer_id
        and c.is_current = true

    left join dates as review_date
        on date(r.review_creation_ts) = review_date.date

),

final as (

    select
        review_id,
        order_id,
        customer_key,
        review_date_key,
        review_score
    from joined

)

select *
from final