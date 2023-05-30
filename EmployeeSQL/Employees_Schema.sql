-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/DUuJPi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE "titles" (
    "title_id" VARCHAR(10) PRIMARY KEY NOT NULL,
    "title" VARCHAR(20) NOT NULL
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(10) PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR(20) NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT PRIMARY KEY NOT NULL,
    "emp_title_id" VARCHAR(10) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name" VARCHAR(20) NOT NULL,
    "sex" CHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    FOREIGN KEY ("emp_title_id") REFERENCES "titles" ("title_id")
);

CREATE TABLE "salaries" (
    "emp_no" INT PRIMARY KEY NOT NULL,
    "salary" INT NOT NULL,
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "dept_emp" (
    "dept_no" VARCHAR(20) NOT NULL,
    "emp_no" INT NOT NULL,
    PRIMARY KEY ("dept_no", "emp_no"),
    FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "dept_manager" (
    "emp_no" INT PRIMARY KEY NOT NULL,
    "dept_no" VARCHAR(20) NOT NULL,
    FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);