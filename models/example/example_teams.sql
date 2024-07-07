{{ config(
		materialized='table', tags=["special"]
) }}

with teams as
(
select 'Lakers' as team
union all
select 'Clippers' as team
union all
select '76eers' as team
union all
select 'Heat' as team
union all
select 'Spurs' as team
)

select * from teams where team is not null