create table hackers (hacker_id int, name varchar(40));
create table submissions (submission_date date, submission_id int, hacker_id int, score int);


insert into hackers values (15758, 'Rose');
insert into hackers values (20703, 'Angela');
insert into hackers values (36396, 'Frank');
insert into hackers values (38289, 'Patrick');
insert into hackers values (44065, 'Lisa');
insert into hackers values (53473, 'Kimberly');
insert into hackers values (62529, 'Bonnie');
insert into hackers values (79722, 'Michael');
drop table submissions

insert into submissions values (to_date('2016-03-01', 'YYYY-MM-DD'), 8494,      20703,	 0	);
insert into submissions values (to_date('2016-03-01', 'YYYY-MM-DD'), 22403, 	53473,	 15	);
insert into submissions values (to_date('2016-03-01', 'YYYY-MM-DD'), 23965, 	79722,	 60	);
insert into submissions values (to_date('2016-03-01', 'YYYY-MM-DD'), 30173, 	36396,	 70	);
insert into submissions values (to_date('2016-03-02', 'YYYY-MM-DD'), 34928, 	20703,	 0	);
insert into submissions values (to_date('2016-03-02', 'YYYY-MM-DD'), 38740, 	15758,	 60	);
insert into submissions values (to_date('2016-03-02', 'YYYY-MM-DD'), 42769, 	79722,	 25	);
insert into submissions values (to_date('2016-03-02', 'YYYY-MM-DD'), 44364, 	79722,	 60	);
insert into submissions values (to_date('2016-03-03', 'YYYY-MM-DD'), 45440, 	20703,	 0	);
insert into submissions values (to_date('2016-03-03', 'YYYY-MM-DD'), 49050, 	36396,	 70	);
insert into submissions values (to_date('2016-03-03', 'YYYY-MM-DD'), 50273, 	79722,	 5	);
insert into submissions values (to_date('2016-03-04', 'YYYY-MM-DD'), 50344, 	20703,	 0	);
insert into submissions values (to_date('2016-03-04', 'YYYY-MM-DD'), 51360, 	44065,	 90	);
insert into submissions values (to_date('2016-03-04', 'YYYY-MM-DD'), 54404, 	53473,	 65	);
insert into submissions values (to_date('2016-03-04', 'YYYY-MM-DD'), 61533, 	79722,	 45	);
insert into submissions values (to_date('2016-03-05', 'YYYY-MM-DD'), 72852, 	20703,	 0	);
insert into submissions values (to_date('2016-03-05', 'YYYY-MM-DD'), 74546, 	38289,	 0	);
insert into submissions values (to_date('2016-03-05', 'YYYY-MM-DD'), 76487, 	62529,	 0	);
insert into submissions values (to_date('2016-03-05', 'YYYY-MM-DD'), 82439, 	36396,	 10	);
insert into submissions values (to_date('2016-03-05', 'YYYY-MM-DD'), 90006, 	36396,	 40	);
insert into submissions values (to_date('2016-03-06', 'YYYY-MM-DD'), 90404, 	20703,	 0	);


SELECT * from hackers