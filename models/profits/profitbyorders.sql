{{
    config(
        materialized='table'
    )
}}

select p.productid,
p.productname,
p.category,
p.subcategory,
sum(profit) as totalprofit
from {{ ref('stage_model') }} as P
GROUP BY 
p.productid,
p.productname,
p.category,
p.subcategory
