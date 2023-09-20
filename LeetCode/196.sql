delete from person
where id NOT IN (
    select min_id
    from (
        select MIN(id) as min_id
        from person
        group by email
    ) as subquery
);