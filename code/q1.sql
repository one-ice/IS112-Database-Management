select J.jobid,J.title,J.jobtype,t1.deptid, count(t2.staffid) as 'Number of Assignments'
from job J,
(select D2.deptid
from department D1,department D2
where D1.deptid=D2.parentdept  and D1.name="Prime Minister's Office"
union
select deptid
from department D
where  D.name="Prime Minister's Office") as t1,

(select staffid,jobid from np_assignment
union
select staffid ,jobid from p_assignment) as t2

where J.deptid=t1.deptid and t2.jobid=J.jobid 
group by J.jobid
order by count(t2.staffid) desc;