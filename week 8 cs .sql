'''1. Return the name of the employee with the lowest salary in department 90.'''

select first_name, salary from hr.employees where salary = (select min(salary) from hr.employees where department_id = 90);

'''try with dense rank too'''

'''2 Select the department name, employee name, and salary of all employees who work in the
human resources or purchasing departments. Compute a rank for each unique salary in both
departments.'''

select department_name, first_name, salary , dense_rank() over(order by salary) rnk from hr.employees e 
left join hr.departments d on e.department_id = d.department_id where e.department_id in (30,40); 

'''3. Select the 3 employees with minimum salary for department id 50.'''
dense_rank rank in (1,2,3) '''

select first_name, salary from hr.employees where department_id = 50 and rownum<=3 order by salary; '''rownum use'''


select* from(select first_name, salary , dense_rank() over(order by salary) rnk from hr.employees e 
left join hr.departments d on e.department_id = d.department_id where e.department_id = 50)
where rnk in (1,2,3) and rownum<=3; 

'''4. Show first name, last name, salary and previously listed employee’s salary who works in “IT_PROG” over hire date.'''
select first_name, last_name, salary, lag(salary) over(order by hire_date) from hr.employees where job_id = 'IT_PROG';

'''5'''
select e.first_name, j.* from hr.employees e inner join hr.jobs j on e.job_id = j.job_id
inner join hr.job_history jh on e.employee_id = jh.employee_id and jh.job_id = 'IT_PROG'; 


'''6. Make a copy of the employees table and update the salaries of the employees in the new table 
with the maximum salary in their departments.'''

create table emp_cop as (select * from hr.employees)
commit;

select * from emp_cop;

update emp_cop c set salary = (select max(salary) from emp_cop e where e.department_id = c.department_id);



'''7. Make a copy of the employees table and update the salaries of the employees in the new table with a 30 percent increase.'''
create table emp_c as (select* from hr.employees);

select * from emp_c;

update emp_c cl set salary = salary*1.30;
