with cte as(

    select * 
    from {{ source('Kalebu', 'WEATHER_DAILY') }}

),
daily_weather_agg as (
    select
    *,
    to_date(date_time) standardized_Date
  

    from cte

),
Standard_Metrics as (
    select standardized_Date,location
    ,round(avg(Temperature_C),2) as Stand_Temparature,
    round(avg(Humidity_pct),2) as Stand_Humidity,
    round(avg(Precipitation_mm),2) as Stand_Precipitation,
    round(avg(Wind_Speed_kmh),2) as Stand_windspeed,
    row_number() over (partition by standardized_Date order by Stand_Temparature desc) as row_number
    from daily_weather_agg
    group by standardized_Date,location
)


select * from Standard_Metrics where row_number = 1