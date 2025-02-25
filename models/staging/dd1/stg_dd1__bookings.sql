with 

source as (

    select * from {{ source('dd1', 'bookings') }}

),

renamed as (

    select
        booking_id,
        flight_ids,
        booking_price,
        frequent_flyer_id

    from source

)

select * from renamed
