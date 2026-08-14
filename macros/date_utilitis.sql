{% macro get_time_season(column_name) %}
case
    when month(to_timestamp({{ column_name }})) in (12, 1, 2) then 'WINTER'
    when month(to_timestamp({{ column_name }})) in (3, 4, 5) then 'SPRING'
    when month(to_timestamp({{ column_name }})) in (6, 7, 8) then 'SUMMER'
    else 'AUTUMN'
end
{% endmacro %}

{% macro get_day_type(column_name) %}
case
    when dayname(to_timestamp({{ column_name }})) in ('Sat', 'Sun') then 'WEEKEND'
    else 'BUSINESSDAY'
end
{% endmacro %}
