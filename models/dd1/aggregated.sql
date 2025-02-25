SELECT
frequent_flyer_id,
customer_id,
sum(mileage) AS total_mileage,
count(flight_id) AS total_flights,
YEAR(date(flight_date, 'dd/mm/yyyy')) AS year_of_flight,
sum(loyalty_spend) AS total_loyalty_spend
FROM {{ ref('all_merge') }}
GROUP BY customer_id, YEAR(date(flight_date, 'dd/mm/yyyy')), frequent_flyer_id