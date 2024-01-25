-- Query 5:

-- From the login_details table, fetch the users who logged in consecutively 3 or more times.


--Table Structure:

drop table login_details;
create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

delete from login_details;
insert into login_details values
(101, 'Michael', current_date),
(102, 'James', current_date),
(103, 'Stewart', current_date+1),
(104, 'Stewart', current_date+1),
(105, 'Stewart', current_date+1),
(106, 'Michael', current_date+2),
(107, 'Michael', current_date+2),
(108, 'Stewart', current_date+3),
(109, 'Stewart', current_date+3),
(110, 'James', current_date+4),
(111, 'James', current_date+4),
(112, 'James', current_date+5),
(113, 'James', current_date+6);



-- Solution
SELECT DISTINCT repeated_names
from(
SELECT case 
    when user_name = lead(user_name) over(order by login_date) AND
    user_name = lead(user_name, 2) over(order by login_date)
    then user_name
    else null 
    end as repeated_names
from login_details) x 
where repeated_names is not null

