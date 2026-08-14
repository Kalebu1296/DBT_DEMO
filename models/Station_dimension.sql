with bike as(
    select START_STATION_ID,
    START_STATION_NAME,
    round(START_LAT,2) as start_latitude,
    Round(START_LNG,2) as start_longitude
    from {{ source('Kalebu', 'CYCLE_RIDE_1') }}
    limit 10
)

select * from bike