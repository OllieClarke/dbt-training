/*find largest order per month*/
{{
    config(
        materialized='view'
    )
}}

with top1 as(
select 
    date_trunc(month,order_date) as month
    ,max(amount) as largest_sale
from {{ ref('stg_jaffle_shop__orders') }} a
join {{ ref('stg_stripe__payments') }} b
using(order_id)
where a.status = 'completed'
group by 1)
, all1 as
(
    select 
    *
from {{ ref('stg_jaffle_shop__orders') }} a
join {{ ref('stg_stripe__payments') }} b
using(order_id)
)

select
    a.order_id
    , a.customer_id
    , a.order_date
    , a.amount
from all1 a
join top1 b 
on date_trunc(month, a.order_date) = b.month
and a.amount = b.largest_sale