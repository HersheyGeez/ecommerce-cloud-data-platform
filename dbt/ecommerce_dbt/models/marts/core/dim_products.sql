{{
  config(
    materialized = 'table'
    )
}}

with products as (
    select 
        product_id,
        category_name,
        weight_g,
        length_cm,
        height_cm,
        width_cm
    from {{ ref('products_stg') }}
),

category_translation as (
    select
        category_name,
        category_name_english
    from {{ ref('category_translation_stg') }}
),

joined as (
    select
        p.product_id,
        p.category_name,
        ct.category_name_english,
        p.weight_g,
        p.length_cm,
        p.height_cm,
        p.width_cm
    from products as p
    left join category_translation as ct
        on p.category_name = ct.category_name
),

final as (
    select 
        {{dbt_utils.generate_surrogate_key(['product_id'])}} as product_key,
        product_id,
        category_name,
        category_name_english,
        weight_g,
        length_cm,
        height_cm,
        width_cm
    from joined
)

select *
from final