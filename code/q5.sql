delimiter $$
create procedure sp_get_dept_reorg()
  begin 
    #table1
      
        select DT.newdeptid ,D.name, DT.origdeptid, t1.origname, D.startdate,
        
        if(DT.newdeptid in (select newdeptid 
            from dept_transit group by newdeptid having count(origdeptid)>=2)
        , 'merge',null) as type
        
    from dept_transit DT, department D, 
          (select d.name as origname, d.deptid as did 
            from department d, dept_transit dt
              where d.deptid=dt.origdeptid) as t1
    where DT.newdeptid=D.deptid and t1.did=DT.origdeptid
        group by Dt.newdeptid,DT.origdeptid
        having type='merge'
        
        union
        
        #table2
        select DT.newdeptid ,D.name, DT.origdeptid, t1.origname, D.startdate,
        
        if(DT.newdeptid in (select t2.newdeptid 
                    from
                    (select newdeptid from dept_transit
                    where origdeptid in (
                    select origdeptid
                    from dept_transit
                    group by origdeptid having count(newdeptid)=1)) as t1
                    ,
                    (select newdeptid 
                    from dept_transit 
                    group by newdeptid having count(origdeptid)=1) as t2
                    where t1.newdeptid=t2.newdeptid
                    )
        , 'rename',null) as type
        
    from dept_transit DT, department D, 
          (select d.name as origname, d.deptid as did 
            from department d, dept_transit dt
              where d.deptid=dt.origdeptid) as t1
    where DT.newdeptid=D.deptid and t1.did=DT.origdeptid 
    group by Dt.newdeptid,DT.origdeptid
        having type='rename'
       #table3
     union
       select DT.newdeptid ,D.name, DT.origdeptid, t1.origname, D.startdate,
        
        if(DT.newdeptid in (select t2.newdeptid 
                        from
                        (select newdeptid from dept_transit
                        where origdeptid in (
                        select origdeptid
                        from dept_transit
                        group by origdeptid having count(newdeptid)>1)) as t1
                        ,
                        (select newdeptid 
                        from dept_transit 
                        group by newdeptid having count(origdeptid)=1) as t2
                        where t1.newdeptid=t2.newdeptid)
        , 'split',null) as type
        
    from dept_transit DT, department D, 
          (select d.name as origname, d.deptid as did 
            from department d, dept_transit dt
              where d.deptid=dt.origdeptid) as t1
    where DT.newdeptid=D.deptid and t1.did=DT.origdeptid 
        group by Dt.newdeptid,DT.origdeptid
        having type='split'
        order by type ,newdeptid asc;
end$$
delimiter ;
call  sp_get_dept_reorg();