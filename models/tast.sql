select *
from {{ ref('Second_Model') }}

limit 10