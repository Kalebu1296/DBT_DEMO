{{
    config(
        materialized='table'
    )
}}

with cte as (
    select 1 as id
    union all
    select null as id
)

select * from cte