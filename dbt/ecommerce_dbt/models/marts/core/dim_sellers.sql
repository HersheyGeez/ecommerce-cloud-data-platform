{{
  config(
    materialized = 'table'
    )
}}

with sellers as (
    select
        seller_id,
        zip_code_prefix,
        city,
        state
    from {{ ref('sellers_stg') }}
),

geolocation as (
    select
        zip_code_prefix,
        latitude,
        longitude
    from {{ ref('geolocation_stg') }}
),

geolocation_agg as (
    select
        zip_code_prefix,
        avg(latitude) as latitude,
        avg(longitude) as longitude
    from geolocation
    group by zip_code_prefix
),

joined as (
    select
        s.seller_id,
        s.zip_code_prefix,
        s.city,
        s.state,
        g.latitude,
        g.longitude
    from sellers as s
    left join geolocation_agg as g
        on s.zip_code_prefix = g.zip_code_prefix
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['seller_id']) }} as seller_key,
        seller_id,
        zip_code_prefix,
        city,
        state,
        latitude,
        longitude
    from joined
)

select *
from final