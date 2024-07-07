-- Use the `ref` function to select from other models
with source_store_sales as (
select * from {{ source('SNOWFLAKE_SAMPLE_DATA', 'STORE') }}
),

final as (
select * from source_store_sales
)

select * from final
