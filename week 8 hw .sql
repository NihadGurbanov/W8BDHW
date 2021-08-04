'''1. According to the given diagram create STUDENTS , ACTIVITIES and SCHEDULE tables. (PK – PRIMARY KEY, FK – FOREIGN KEY, * - NOT NULL )'''

CREATE TABLE HR.STUDENTS 
(
  S_ID NUMBER NOT NULL 
, FIRST_NAME VARCHAR2(60 BYTE) 
, LAST_NAME VARCHAR2(60 BYTE) 
, PHONE_NUMBER VARCHAR2(20 BYTE) 
, EMAIL VARCHAR2(60 BYTE) 
, CONSTRAINT STUDENTS_PK PRIMARY KEY 
  (
    S_ID 
  )
  ENABLE
  );
  
  
CREATE TABLE HR.ACTIVITIES 
(
  A_ID NUMBER NOT NULL 
, COLUMN2 VARCHAR2(20) NOT NULL 
, COLUMN3 NUMBER 
, CONSTRAINT ACTIVITIES_PK PRIMARY KEY 
  (
    A_ID 
  )
  ENABLE 
);

--------------------------------------------------------
--  DDL for Table SCHEDULE
--------------------------------------------------------

  CREATE TABLE "HR"."SCHEDULE" 
   (	"S_ID" NUMBER, 
	"A_ID" NUMBER, 
	"S_DATE" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Ref Constraints for Table SCHEDULE
--------------------------------------------------------

  ALTER TABLE "HR"."SCHEDULE" ADD CONSTRAINT "SCHEDULE_FK1" FOREIGN KEY ("S_ID")
	  REFERENCES "HR"."STUDENTS" ("S_ID") ENABLE;
 
  ALTER TABLE "HR"."SCHEDULE" ADD CONSTRAINT "SCHEDULE_FK2" FOREIGN KEY ("A_ID")
	  REFERENCES "HR"."ACTIVITIES" ("A_ID") ENABLE;


'''2. Insert data into students table from employees table.'''

insert into hr.students (s_id, first_name, last_name, phone_number, email) select employee_id, first_name, last_name, phone_number,
email from hr.employees;
select * from hr.students

'''3. Change phone number to ‘***’ for students with s_id > 200.'''

update hr.students set phone_number = '***' where s_id>200;
select * from hr.students where s_id>200;

'''4. Update first name and last names of students in Upper cases.'''
update hr.students set  first_name = upper(first_name), last_name = upper(last_name);
select * from hr.students;

'''5. Based on the students table populated with the following data, update the email to DSA
for all records whose s_id is greater than 150.'''

update hr.students set email = 'DSA' where s_id>150;

select email from hr.students where s_id > 150;

'''6. Create PROGRAMMERS table using records from EMPLOYEES where job_id contains ‘PROG’ substring'''
create table hr.programmers as (select * from hr.employees where job_id like '%PROG%');
select * from hr.programmers;


'''7. Delete records from students table where s_id is between 150 and 160.'''

delete from hr.students where s_id between 150 and 160;
select * from hr.students where s_id between 150 and 160;

'''8. a) Insert some date into SCHEDULE, then truncate and see results.'''

insert into hr.schedule (s_date) select hire_date from hr.employees;

'''b) Drop schedule table'''
drop table hr.schedule;

'''9. For any date given, write a script to find:
a) The first and the last days of the next year;'''

select add_months(trunc(sysdate, 'y'), 12) as last_day_next_year, 
add_months(trunc(sysdate, 'y'), 24) - 1 as last_day_next_year from dual;


'''b) The first and the last days of the next month;'''

select last_day(add_months(sysdate,+0))+1 AS first_day,
last_day(add_months(sysdate,+1)) as last_day from dual;

'''c) The first and the last days of the previous month.'''

select last_day(ADD_MONTHS(sysdate,-2))+1 AS first_day,
last_day(add_months(sysdate,-1)) as last_day from dual;


'''10. Create a table named “Participants” which consists of first_name, last_name and salary (have to more than 10000).'''

create table hr.participants as select first_name, last_name, salary from hr.employees where salary>10000;

select * from hr.participants;