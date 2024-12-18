{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}
{#
        --if we are in prod then we just want custom_schema_name

        --environment variable approach
        {% elif env_var("DBT_MY_ENV") in ['prod'] %}
            {{custom_schema_name | trim }}
        
        --jinja target.name approach
        {% elif target.name in['prod']%}
            {{custom_schema_name | trim }}
#}
    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}        