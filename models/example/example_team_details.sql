with teams as
(
select * from {{ ref('example_teams') }}

),

team_locations as
(
select * from {{ ref('team_locations') }}

),

final as(
select
teams.team,
team_locations.city,
team_locations.state,
teams.team = '{{ var("current_champion") }}'  as is_champion
from teams left join team_locations on teams.team=team_locations.name
) 

select *, '{{ invocation_id }}' invocation_id from final
