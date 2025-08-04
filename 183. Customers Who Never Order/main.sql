
select c.name as Customers from Customers c 
where not exists (
    select 1 
    from Orders
    where c.id = customerId
)