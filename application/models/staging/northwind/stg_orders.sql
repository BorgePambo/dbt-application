with orders as (
    select
        o.ORDER_ID,
        o.CUSTOMER_ID,
        o.EMPLOYEE_ID,
        o.ORDER_DATE,
        o.REQUIRED_DATE,
        o.SHIPPED_DATE,
        o.SHIP_VIA,
        o.FREIGHT,
        o.SHIP_NAME,
        o.SHIP_ADDRESS,
        o.SHIP_CITY,
        o.SHIP_REGION,
        o.SHIP_POSTAL_CODE,
        o.SHIP_COUNTRY,  -- vírgula aqui
        case
            when o.SHIPPED_DATE is null then 'Pending'
            else 'Shipped'
        end as order_status
    from {{ source('northwind','orders') }} o
)
select * from orders
