with temp as (
    select email,
    row_number() over(partition by email) as mk
    from Person
)

select distinct email from temp where mk > 1