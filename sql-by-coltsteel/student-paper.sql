

CREATE TABLE Students(
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100)
);

CREATE TABLE Papers(
  title VARCHAR(100),
  grade INT,
  student_id INT,
  FOREIGN KEY(student_id)
        REFERENCES Students(id)
);

SELECT first_name,title,grade 
FROM Students
JOIN Papers ON  Students.id = Papers.student_id
ORDER BY grade DESC;


CREATE TABLE Employee(
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  salary DECIMAL
);


CREATE TABLE Incentive(
  incentive_date Date,
  incentive_amount INT,
  emp_id INT ,
   FOREIGN KEY(emp_id) REFERENCES Employee(emp_id)
);

INSERT INTO Employee(first_name,last_name,salary) VALUES
('John','Abraham',8000),
('Michael','Clarke',8000),
('Roy','Thomas',5000),
('Roy','Suryo',5000);

INSERT INTO incentive(emp_id,incentive_date,incentive_amount) VALUES
(1,'2014-01-01',500),
(1,'2014-01-05',300),
(2,'2014-01-01',500),
(3,'2014-01-01',500);



SELECT 
     Employee.emp_id,
     ANY_VALUE(first_name) AS first_name,
     IFNULL(SUM(incentive_amount),0) As  total_incentive
FROM Employee
LEFT JOIN Incentive 
  ON Employee.emp_id = Incentive.emp_id
GROUP BY Employee.emp_id
ORDER BY  Employee.emp_id;
