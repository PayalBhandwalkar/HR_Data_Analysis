select * from hr;

alter table hr
change column ï»¿id emp_id VARCHAR(20) null;

describe hr;

set sql_safe_updates = 0;

update hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
    END;
    
  alter table hr
  modify column birthdate date;
  
    update hr
    SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
    END;
    
  alter table hr
  modify column hire_date date;

alter table hr add column age int;

update hr
set age = timestampdiff(year, birthdate, curdate());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;

SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();

SELECT COUNT(*)
FROM hr
WHERE termdate = null;
  
 select birthdate, age from hr;
 
 SELECT location FROM hr;
  
 