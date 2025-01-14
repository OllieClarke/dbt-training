select
    json:Download::Float / 1000000 as Download
    , json:Upload::Float / 1000000 as Upload
    , json:Ping::Float as Ping
    , json:Timestamp::Timestamp as Timestamp
from {{ ref('src__internet_speed_testing') }}
