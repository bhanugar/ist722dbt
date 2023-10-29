select
   f.orderid,
    d_customer.*,
    d_employee.*,
    d_date.*,
    d_product.* ,
    f.quantity,
    f.extendedpriceamount,
    f.discountamount,
    f.soldamount
from {{ ref('fact_sales') }} as f
left join {{ ref('dim_customer') }} as d_customer on f.customerkey = d_customer.customerkey
left join {{ ref('dim_employee') }} as d_employee on f.employeekey = d_employee.employeekey
left join {{ ref('dim_date') }} as d_date on f.orderdatekey = d_date.datekey
left join {{ ref('dim_product') }} as d_product on f.productkey = d_product.productkey
