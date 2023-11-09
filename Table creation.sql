CREATE TABLE "departments" (
    "dept_num" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_num"
     )
);

CREATE TABLE "department_employees" (
    "emp_num" int   NOT NULL,
    "dept_num" VARCHAR(4)   NOT NULL
);

CREATE TABLE "department_managers" (
    "dept_num" VARCHAR(4)   NOT NULL,
    "emp_num" int   NOT NULL,
    CONSTRAINT "pk_department_managers" PRIMARY KEY (
        "emp_num"
     )
);


CREATE TABLE "employees" (
    "emp_num" int   NOT NULL,
    "emp_title" VARCHAR(5)   NOT NULL,
    "birth_date" VARCHAR(10)   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "salary" (
    "emp_num" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "title" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_dept_num" FOREIGN KEY("dept_num")
REFERENCES "departments" ("dept_num");

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_dept_num" FOREIGN KEY("dept_num")
REFERENCES "departments" ("dept_num");

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "title" ("title_id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

