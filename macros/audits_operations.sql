{% macro insert_audits(action_name) -%}

	insert into demo_db.staging.dbt_audits(audit_type)
	values( '{{ action_name }}' ); 
	commit;

{%- endmacro %}