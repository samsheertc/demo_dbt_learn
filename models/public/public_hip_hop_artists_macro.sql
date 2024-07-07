{{ config(materialized='table') }}
with source_model as (
{{ 
    flatten_json
    ( 
        model_name = source('DEMO_DB', 'HIP_HOP_ARTISTS'), 
        json_column= 'artist_data'
    )
}}
),
final as 
(

    select 
        artist_data,
        artist_name,
        birth_name,
        home_city,
        home_state  
     from source_model

)

select * from final
