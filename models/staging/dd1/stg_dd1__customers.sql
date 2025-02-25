with 

source as (

    select * from {{ source('dd1', 'customers') }}

),

renamed as (

    select
        customer_id,
        frequent_flyer_id,
        customer_name

    from source

)

select * from renamed
