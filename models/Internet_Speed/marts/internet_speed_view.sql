{{
    config(
        materialized='view'
    )
}}
select
    ROUND(Download, 2) as Download_Mb
    , ROUND(Upload, 2) as Upload_Mb
    , ROUND(Ping, 2) as Ping
    , DATE_TRUNC('second', Timestamp) as Timestamp
FROM {{ ref('parsed_internet_speed_testing') }}
