/*
2016-03-01 4 20703 Angela
2016-03-02 2 79722 Michael
2016-03-03 2 20703 Angela
2016-03-04 2 20703 Angela
2016-03-05 1 36396 Frank
2016-03-06 1 20703 Angela
*/





with recursive cte as
(
select distinct submission_date, hacker_id
from submissions
where submission_date = (SELECT min(submission_date) from submissions)

union 

select distinct s.submission_date, s.hacker_id 
from submissions s 
join cte c 
on s.hacker_id = c.hacker_id
where s.submission_date = (SELECT min(submission_date) from submissions 
                            where submission_date > c.submission_date)
),

out1 AS
(SELECT submission_date, count(hacker_id) 
from cte
group by submission_date
order by 1),

count as 
(SELECT s.submission_date, s.hacker_id, count(hacker_id) as no_of_submissions
from submissions s
group by s.submission_date, s.hacker_id
order by 1),

max_count as
(SELECT submission_date, max(no_of_submissions) as max_submissions
from count 
group by submission_date),

final as
(SELECT c.submission_date, min(c.hacker_id) as hacker_id
from count c 
join max_count m 
on c.submission_date = m.submission_date 
and max_submissions = no_of_submissions
group by c.submission_date),

out2 as
(SELECT f.submission_date, f.hacker_id, name
from final f 
join hackers h
on f.hacker_id = h.hacker_id
order by 1)

SELECT out1.*, hacker_id, name
from out1 
join out2
on out1.submission_date = out2.submission_date