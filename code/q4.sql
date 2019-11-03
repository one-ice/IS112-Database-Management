delimiter $$
create trigger before_speech_insert 
before insert on speech for each row
  begin
        declare postdate_of_presenter date;
        declare enddate_of_presenter date;
  
        set postdate_of_presenter=(
        select postdate from p_assignment where new.presenter=staffid and new.jobid=jobid);
        
        set enddate_of_presenter=(
        select enddate from p_assignment where new.presenter=staffid and new.jobid=jobid);
        
        if new.eventdate<postdate_of_presenter
        then 
        signal sqlstate '45000'
        set message_text='Event occurs outside job valid period';
        end if;
        
        if new.eventdate>enddate_of_presenter
        then 
        signal sqlstate '45000'
        set message_text='Event occurs outside job valid period';
        end if;
  end$$
delimiter ;

insert into speech values('APAIE Conference and Exhibition','2016-10-11', 7 ,'abst',26024,374588,92124,'2016-08-07');

delete from speech where eventname='APAIE Conference and Exhibition' and eventdate='2016-10-11' and ordernum=7;
