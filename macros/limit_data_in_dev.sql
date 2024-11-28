{%- macro limit_data_in_dev(column, days=3) -%}
{%- if target.name == 'dev' -%}
where {{ column }} >= dateadd('day', - {{ days }}, current_timestamp)
{%- endif -%}
{%- endmacro-%}