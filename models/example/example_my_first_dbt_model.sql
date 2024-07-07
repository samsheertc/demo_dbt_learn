/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below

*/

{{ config(
    query_tag = 'dbt_special_override'
) }}

with source_data as (

    select 1 as id
    union all
    select 2 as id
    union all
    select 3 as id
    union all
    select 4 as id
    union all
    select 5 as id
    union all
    select 6 as id
    union all
    select null as id
    
)

select *
from source_data where id is not null

{% if target.name == 'dev' %}
and 'dev'='dev'
{% endif %}

{% if target.name == 'test' %}
and 'test'='test'
{% endif %}

{% if target.name == 'prod' %}
and 'prod'='prod'
{% endif %}

{% if target.name == 'demo_db' %}
and 'demo_db'='demo_db'
{% endif %}

/*
    Uncomment the line below to remove records with null `id` values
*/
-- where id is not null
