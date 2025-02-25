WITH all_merge AS (
    SELECT *
    FROM {{ ref('all_merge') }}
)
,

aggregated AS (
    SELECT *
    FROM {{ ref('aggregated') }}
)

SELECT
    frequent_flyer_id,
    customer_id,
    year_of_flight AS loyalty_year,
    total_mileage,
    total_loyalty_spend,
    total_flights,
    CASE
        WHEN
            total_mileage >= 10000
            AND total_loyalty_spend >= 5000
            AND total_flights >= 5
            THEN 'Platinum'
        WHEN
            total_mileage >= 5000
            AND total_loyalty_spend >= 3000
            AND total_flights >= 3
            THEN 'Gold'
        WHEN
            total_mileage >= 1000
            AND total_loyalty_spend >= 1000
            AND total_flights >= 1
            THEN 'Silver'
        ELSE 'Bronze'
    END AS current_status

FROM
    aggregated
ORDER BY 2 ASC
