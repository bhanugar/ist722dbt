with f_trackreview as (
    select * from {{ ref('fact_trackreview') }}
),
d_customer as (
    select * from {{ ref('dim_customer') }}
),
d_custtrackreview as (
    select * from {{ ref('dim_customertrackreview') }}
),
d_track as (
    select * from {{ ref('dim_track') }}
)
select  c.*,t.*,f.likes,f.sentiment from f_trackreview f
left join d_custtrackreview ct on ct.customerkey = f.customerkey and ct.trackkey = f.trackkey
left join d_customer c on c.customerkey = f.customerkey
left join d_track t on t.trackkey = f.trackkey