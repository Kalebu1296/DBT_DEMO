select *
from {{ ref('{{ ref('my_second_dbt_model') }}') }}

linit 10