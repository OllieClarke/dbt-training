select
    --adding double quotes to timestamp where they weren't there. Also converting to json for later parsing  
    parse_json(replace(replace(replace(json,'Timestamp": ','Timestamp": "'),'}','"}'),'""','"')) as json,
    __uploaded
from {{ source('internet_speed_testing', 'INTERNET_SPEED_TEST') }}
