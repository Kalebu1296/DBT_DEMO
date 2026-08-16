select * from {{ ref('First_model') }}
where id is not null