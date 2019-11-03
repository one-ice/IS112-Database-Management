select NPA.staffid as 'Staff ID',St.staffname as 'Staff Name',NPA.jobid as 'Job ID',
NPA.postdate as 'Post date',NPA.enddate as'End date',D.name as 'Dept Name' ,
count(speech.contact) as 'Contact count'

from np_assignment NPA left outer join speech on speech.contact=NPA.staffid
,  staff St, job J,department D

where St.staffid=NPA.staffid and J.jobid=NPA.jobid and J.deptid=D.deptid and
NPA.postdate<='2015-08-30' and (NPA.enddate>='2015-08-30' or NPA.enddate is null)
group by NPA.staffid,NPA.jobid
order by NPA.postdate desc,NPA.staffid asc;