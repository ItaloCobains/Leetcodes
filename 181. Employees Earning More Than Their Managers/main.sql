select e.name as Employee from Employee e
join Employee manager on manager.id = e.managerId
where e.salary > manager.salary