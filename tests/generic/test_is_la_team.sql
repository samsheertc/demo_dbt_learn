{% test is_la_team1(model, column_name) %}

with validation as (

    select
        {{ column_name }} as city, team

    from {{ model }}

),

validation_errors as (

    select
        city
    from validation
    where city='Los Angeles' 
    and team not in ('Lakers','Clippers')

)

select *
from validation_errors


{% endtest %}
