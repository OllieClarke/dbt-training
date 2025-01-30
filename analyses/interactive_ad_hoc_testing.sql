-- an example specific test which checks that there are no duplicate customers in the customers model
select 
    customer_id
from {{ ref('customers') }}
group by 1
having count(*)>1