-- SHOW VARIABLES LIKE 'local_infile';
-- SET GLOBAL local_infile = 1;
load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/department.txt' into table department 
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/dept_transit.txt' into table dept_transit 
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/job.txt' into table job 
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/non_political_job.txt' into table non_political_job
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/non_political_job_skills.txt' into table non_political_job_skills
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/non_political_assignment.txt' into table non_political_assignment
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/political_job.txt' into table political_job
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/staff.txt' into table staff
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/same_staff.txt' into table same_staff
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/non_political_staff.txt' into table non_political_staff
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/non_political_staff_skills.txt' into table non_political_staff_skills
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/political_staff.txt' into table political_staff
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/political_assignment.txt' into table political_assignment
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/event.txt' into table event
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

load data local infile 'C:/Users/chen yibing/Downloads/112/112/after/data/speech.txt' into table speech
fields terminated by '\t' lines terminated by '\r\n' ignore 1 lines;

#speech,event,non_political_assignment,political_assignment,political_staff,
#non_political_staff_skills,non_political_staff,same_staff,staff,political_job,
#non_political_job_skills,non_political_job,job,dept_transit,department;