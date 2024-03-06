-- Create Table Schemas --

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(6)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(2)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-----------------------------------
CREATE TABLE "departments" (
    "dept_no" VARCHAR (5)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

------------------------------------
CREATE TABLE "dept_employee" (
    "employee_no" INT   NOT NULL,
    "dept_no" VARCHAR(5)   NOT NULL
);

-------------------------------------
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "emp_no" INT   NOT NULL
);

--------------------------------------
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

--------------------------------------
CREATE TABLE "title" (
    "title_id" VARCHAR(6)   NOT NULL,
    "title" VARCHAR(50)  NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

----- ADD FOREIGN KEY CONSTRAINTS TO TABLES ------------

ALTER TABLE salaries ADD CONSTRAINT "fk_salaries" FOREIGN KEY ("emp_no")
REFERENCES employees(emp_no);

ALTER TABLE employees ADD CONSTRAINT "fk_emp_title" FOREIGN KEY("emp_title")
REFERENCES title ("title_id");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_no" FOREIGN KEY("dept_no")
REFERENCES departments ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");
