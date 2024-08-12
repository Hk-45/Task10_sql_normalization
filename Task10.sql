select * from employee
	
select * from project
	
select * from department	

--This is 1NF
create table employee_proj_dept as select e.employee_id, e.first_name, e.last_name, e.age, e.experience, 
e.hire_date, e.salary, e.department_id, e.project_id, p.project_name from employee as e
inner join project as p
on e.project_id = p.project_id
	
select employee_id, first_name, last_name, age, experience, 
hire_date, salary, department_id, project_id from employee_proj_dept order by employee_id

create table emp_info as select employee_id, first_name, last_name, age, experience, 
hire_date, salary, department_id, project_id from employee order by employee_id

select * from emp_info

--This is 2NF
select employee_id, first_name, last_name, age, department_id from emp_info

create table emp_department_info as select e.employee_id, e.first_name, d.department_name, 
d.manager_name, d.department_id, e.project_id from emp_info as e
inner join department as d
on e.department_id = d.department_id

create table emp_department as select employee_id, first_name, department_name, 
department_id from emp_department_info	

select * from emp_department 
	
select distinct department_id, department_name, manager_name from emp_department_info order by department_id
	
create table dept_id_name as select distinct department_id, department_name, manager_name 
from emp_department_info order by department_id
	
select * from dept_id_name	 
	
--This is 3NF
select * from emp_department_info 

create table emp_project_info as select e.employee_id, e.first_name, e.department_name, p.project_name, p.project_id from emp_department_info as e
inner join project as p
on e.project_id = p.project_id	

select * from emp_project_info	
	
select employee_id, first_name from emp_project_info

create table emp as select employee_id, first_name from emp_project_info 

select * from emp

create table project_info as select distinct project_id, project_name from emp_project_info order by project_id

select * from project_info

create table emp_project as select employee_id, first_name, project_name from emp_project_info

select * from emp_project
