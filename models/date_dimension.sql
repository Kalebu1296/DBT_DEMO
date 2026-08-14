with cte as (
    select
        started_at,
        to_timestamp(started_at) as start_date,
        hour(to_timestamp(started_at)) as hour_start_at,
       {{get_day_type('started_at')}} as day_type, -- Comma is needed here

{{ get_time_season('STARTED_AT') }} as station_of_year  -- Added a comma here

from {{ source('Kalebu', 'CYCLE_RIDE_1') }}
)

select * from cte
