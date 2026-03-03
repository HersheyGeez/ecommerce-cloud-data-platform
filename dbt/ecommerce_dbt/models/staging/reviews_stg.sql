{{
  config(
    materialized = 'view'
    )
}}

-- Grain: 1 row per (review_id, order_id)
-- Purpose: Clean and Standardize raw reviews data for downstream analysis

with source as (
    select *
    from {{ source('RAW', 'order_reviews_raw') }}
),

cleaned as (
    select
        review_id,
        order_id,
        review_score as score,
        review_comment_title as comment_title,
        review_comment_message as comment_message,
        cast(review_creation_date as timestamp) as review_creation_ts,
        cast(review_answer_timestamp as timestamp) as review_answer_ts
    from source
)

select *
from cleaned