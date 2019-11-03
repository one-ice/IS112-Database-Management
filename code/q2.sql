select s1.staffid as main_staff_id,s1.staffname as main_staff_name,s1.email as main_email,
s2.staffid as match_staff_id,s2.staffname as match_staff_name,s2.email as match_email from staff s1,staff s2 
where 
  s1.staffid in
    (select staffid from staff s where  staffname like '%vincent ho%' order by staffid asc)
  and s2.staffid in
    (select staffid from staff s where  staffname like '%vincent ho%' order by staffid asc)
  and s1.staffid<s2.staffid
  and s1.staffid = 
    (select min(staffid) from staff where staffid in
      (select staffid from staff s where  staffname like '%vincent ho%'
            )
    )
order by s2.staffid asc;