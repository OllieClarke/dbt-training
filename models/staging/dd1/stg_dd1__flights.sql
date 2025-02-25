with 

source as (

    select * from {{ source('dd1', 'flights') }}

),

renamed as (

    select
        flight_id,
        flight_date,
        mileage

    from source

)

select * from renamed
