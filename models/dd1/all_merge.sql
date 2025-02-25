select
    bf.booking_id,
    bf.flight_id,
    bf.booking_price,
    bf.frequent_flyer_id
    flights.flight_date,
    flights.mileage,
    customers.customer_id,
    customers.customer_name,
    CASE WHEN RANK() OVER (partition by booking_id ORDER BY flight_date ASC) = 1 THEN booking_price END AS loyalty_spend
FROM {{ ref('bookings_and_flights') }} bf
LEFT JOIN {{ ref('stg_dd1__flights') }} flights ON bf.flight_id = flights.flight_id
LEFT JOIN {{ ref('stg_dd1__customers') }} customers ON bf.frequent_flyer_id = customers.frequent_flyer_id