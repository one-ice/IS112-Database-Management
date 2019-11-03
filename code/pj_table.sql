create table department
(deptid int not null,
name varchar(90) not null,
url varchar(170) not null,
address varchar(200) not null,
startdate date not null,
enddate date not null,
parentdept int ,
constraint department_pk primary key (deptid),
constraint department_fk1 foreign key (parentdept) references department(deptid)
);

create table dept_transit
(origdeptid int  not null,
newdeptid int  not null,
constraint dept_transit_pk primary key (origdeptid,newdeptid),
constraint dept_transit_fk1 foreign key (origdeptid) references department(deptid),
constraint dept_transit_fk2 foreign key (newdeptid) references department(deptid));

create table job
(jobid int not null,
title varchar(100) not null,
phone varchar(20) not null,
joblevel int not null,
deptid int not null,
reportto int not null,
jobtype char(2) not null,
constraint jobpk primary key(jobid),
constraint jobfk1 foreign key (reportto) references job(jobid),
constraint jobfk2 foreign key (deptid) references department(deptid));

create table non_political_job
(jobid int not null primary key);

create table non_political_job_skills
(jobid int not null,
skill varchar(100) not null,
constraint table_pk primary key(jobid),
constraint table_fk foreign key(jobid) references non_political_job(jobid));

create table political_job
(jobid int not null,
minyears int not null,
constraint political_job_pk primary key (jobid),
constraint political_job_fk foreign key (jobid) references job(jobid)
);

create table staff(
staffid int not null,
staffname varchar(80) not null,
email varchar(100) not null,
stafftype char(2) not null,
constraint staff_pk primary key(staffid)
);

create table same_staff(
staffid1 int not null,
staffid2 int not null,
constraint same_staff_pk primary key (staffid1,staffid2),
constraint same_staff_fk1 foreign key (staffid1) references staff(staffid),
constraint same_staff_fk2 foreign key (staffid2) references staff(staffid)
);

create table non_political_staff
(staffid int not null primary key);

create table non_political_staff_skills 
(staffid int not null,
skill varchar(100) not null,
constraint non_political_staff_skills_pk primary key(staffid),
constraint non_political_staff_skills_fk foreign key(staffid) references non_political_staff(staffid));

create table political_staff(
staffid int not null,
joindate date not null,
constraint political_staff_pk primary key(staffid),
constraint political_staff_fk foreign key (staffid) references staff(staffid)
);

create table political_assignment
(staffid int not null,
jobid int not null,
postdate date not null,
enddate date not null,
constraint political_assignment_pk primary key(staffid,jobid,postdate),
constraint political_assignment_fk1 foreign key(staffid) references non_political_staff(staffid),
constraint political_assignment_fk2 foreign key(jobid) references non_political_job(jobid));

create table non_political_assignment
(staffid int not null,
jobid int not null,
postdate date not null,
enddate date not null,
constraint non_political_assignment_pk primary key(staffid,jobid,postdate),
constraint non_political_assignment_fk1 foreign key (staffid) references staff(staffid),
constraint non_political_assignment_fk2 foreign key (jobid) references non_political_job(jobid));

create table event 
(eventname varchar(100) not null,
eventdate date not null,
eventtime time not null,
loaction varchar(100) not null,
constraint event_pk primary key (eventname,eventdate));

create table speech(
eventname varchar(100) not null,
eventdate date not null,
ordernum int not null,
contentabst varchar(250) not null,
contact int not null ,
presenter int not null,
jobid int not null,
postdate date not null,
constraint speech_pk primary key (eventname,eventdate,ordernum),
constraint speech_fk1 foreign key (eventname) references event (eventname),
constraint speech_fk2 foreign key (eventdate) references event (eventdate),
constraint speech_fk3 foreign key (contact) references non_political_staff (staffid),
constraint speech_fk4 foreign key (presenter) references political_assignment (staffid),
constraint speech_fk5 foreign key (jobid) references political_assignment (jobid),
constraint speech_fk6 foreign key (postdate) references political_assignment (postdate)
);
