--Tables Structure:

drop table users;
create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

-- Using CTID
delete
from users
where ctid not in
(select min(ctid) as ctid
from users
group by user_name
order by 1)

SELECT *
from users


-- Using Window Functions 

SELECT user_id, user_name, email
from(
SELECT *,
    rank() over(partition by user_name order by user_id asc) as rn 
from users ) x 
where x.rn <> 1
