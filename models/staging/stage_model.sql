{{
    config(
        materialized='table'
    )
}}

select o.orderid,
o.orderdate,
o.shipdate,
o.ordercostprice,
o.ordersellprice,
ordersellprice-ordercostprice AS profit,
c.customerid,
c.customername,
c.segment,
c.country,
c.state,
p.category,
p.productid,
p.productname,
p.subcategory,
from {{ ref('raw_orders') }} AS o
left join
{{ ref('raw_customer') }} AS c
on o.customerid=c.customerid
left join 
{{ ref('raw_product') }} As p
on o.productid=p.productid














