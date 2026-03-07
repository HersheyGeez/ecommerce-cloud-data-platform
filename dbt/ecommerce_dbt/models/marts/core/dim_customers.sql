{{
  config(
    materialized = 'incremental',
    unique_key = 'customer_key',
    incremental_strategy = 'merge'
    )
}}

with customers_source as (
    select 
        customer_id,
        customer_unique_id,
        zip_code_prefix,
        city,
        state
    from {{ ref('customers_stg') }}
),

current_dim as (
    {% if is_incremental() %}

    select *
    from {{this}}
    where is_current = true

    {% else %}

    select
        null as customer_key,
        null as customer_id,
        null as customer_unique_id,
        null as zip_code_prefix,
        null as city,
        null as state,
        null as effective_from,
        null as effective_to,
        null as is_current
    where false

    {% endif %}
),

change_detection as (
    select
        s.customer_id,
        s.customer_unique_id,
        s.zip_code_prefix,
        s.city,
        s.state,

        d.customer_key as existing_customer_key,

        case
            when d.customer_id is null then 'NEW'
            when
                s.zip_code_prefix <> d.zip_code_prefix
                or s.city <> d.city
                or s.state <> d.state
            then 'CHANGED'
            else 'UNCHANGED'
        end as change_type

    from customers_source s
    left join current_dim d
        on d.customer_id = s.customer_id
),

records_to_insert as (
    select
        customer_id,
        customer_unique_id,
        zip_code_prefix,
        city,
        state,
        current_timestamp() as effective_from,
        null as effective_to,
        true as is_current
    from change_detection
    where change_type in ('NEW', 'CHANGED')
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key([
            'customer_id',
            'effective_from'
        ]) }} as customer_key,

        customer_id,
        customer_unique_id,
        zip_code_prefix,
        city,
        state,
        effective_from,
        effective_to,
        is_current
    from records_to_insert
)

select *
from final