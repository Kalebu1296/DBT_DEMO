with weather_daily as(

    select * 
    from {{ source('Kalebu', 'WEATHER_DAILY') }}

)

select * from weather_daily