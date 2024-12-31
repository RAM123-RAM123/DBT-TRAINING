{{
    config(
        materialized='table'
    )
}}
select c.customerid,
c.customername,
c.segment,
c.country,
sum(profit) over(partition by customerid,customername,segment,country ) AS totalprofit
from {{ ref('stage_model') }} AS c
