with stg_sales as (
    select
        O.ORDERID,
        O.CUSTOMERID,
        O.EMPLOYEEID,
        O.ORDERDATE,
        OD.PRODUCTID,
        OD.QUANTITY,
        OD.UNITPRICE,
        OD.DISCOUNT
    from {{ source('northwind', 'Orders') }} O
    join {{ source('northwind', 'Order_Details') }} OD
    on O.ORDERID = OD.ORDERID
)
select
    s.orderid as orderid,
    {{ ref('dim_customer') }}.customerkey as customerkey,
    {{ ref('dim_employee') }}.employeekey as  employeekey,
    {{ ref('dim_date') }}.datekey as orderdatekey,
    {{ ref('dim_product') }}.productkey as productkey,
    s.quantity as quantity,
    s.quantity * s.unitprice as extendedpriceamount,
    (s.quantity * s.unitprice * s.discount) as discountamount,
    (s.quantity * s.unitprice) - (s.quantity * s.unitprice * s.discount) as soldamount
from stg_sales s
left join {{ ref('dim_customer') }} on s.customerid = {{ ref('dim_customer') }}.customerid
left join {{ ref('dim_employee') }} on s.employeeid = {{ ref('dim_employee') }}.employeeid
left join {{ ref('dim_date') }} on s.orderdate = {{ ref('dim_date') }}.date
left join {{ ref('dim_product') }} on s.productid = {{ ref('dim_product') }}.productid
