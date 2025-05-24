{{ 
  config(
    tags=['comercial']

  ) 
}}

with orders as (
    select
        extract(month from order_date) as order_month,
        extract(year from order_date) as order_year,
        freight as total_freight
    from {{ ref('stg_orders') }}
),
vendas as (
    select
        order_month,
        order_year,
        sum(total_freight) as total_freight
    from orders
    group by 1, 2
)

select * from vendas
