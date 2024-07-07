select *
from {{ ref('example_my_first_dbt_model') }}
where id > 1