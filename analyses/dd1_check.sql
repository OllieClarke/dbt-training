{%- set old_query %}
select * from {{ ref('legacy') }}
{%- endset %}

{%- set new_query %}
select * from {{ ref('updated') }}
{%- endset %}

{{ audit_helper.quick_are_queries_identical(
    old_query,
    new_query,
    columns=['frequent_flyer_id','customer_id','loyalty_year','total_mileage','total_loyalty_spend','total_flights','current_status']
  ) 
}}
