{{ config(materialized='table') }}

{% set json_column_query %}
select
distinct
json.Key as column_name
from
{{ source('DEMO_DB', 'HIP_HOP_ARTISTS') }},
lateral flatten(input => artist_data) json;
{% endset %}

{% set results = run_query(json_column_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

select
artist_data,
{% for column_name in results_list %}
artist_data:{{ column_name }}::varchar as  {{ column_name }}  {% if not loop.last %},{% endif %}
{% endfor %}
from {{ source('DEMO_DB', 'HIP_HOP_ARTISTS') }}
