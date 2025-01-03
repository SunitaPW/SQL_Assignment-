# SQL Assigments Question and Answers :-


## ANSWER 1 :- 
 create database SQL_Assigment;
 use SQL_Assigment;
 
CREATE TABLE Employees (
    Emp_ID INT NOT NULL PRIMARY KEY,
    Emp_Name TEXT NOT NULL,
    Age INT CHECK (Age >= 18),
    Email VARCHAR(30) UNIQUE,
    Salary DECIMAL DEFAULT 30000
);
  
## ANSWER 2 :- 

# Constraints in a database are rules or conditions applied to table columns to ensure the accuracy, validity, and integrity of the data.
-- They are used to limit the types of data that can be inserted, updated, or deleted, preventing data anomalies, and ensuring consistency in the database. 
-- Constraints help maintain data integrity, which is the accuracy and consistency of data stored in a database over its lifecycle.

# The main purposes of constraints include:-
-- 1) Data Validity:- Ensuring that data meets certain conditions or rules, such as age being a positive number or a salary not being negative.
-- 2) Data Uniqueness:- Ensuring that no two rows of data are identical in certain key fields, such as emails or product IDs.
-- 3) Referential Integrity:- Ensuring that relationships between tables are maintained, i.e., data in one table must correspond to valid data in another table.
-- 4) Non-Null Data:- Ensuring that important fields always contain a value and are not left empty or null.

# How Constraints Help Maintain Data Integrity :-
-- 1) Prevents Invalid Data:- By enforcing rules like "age must be at least 18," constraints ensure that only valid data is entered, preventing issues such as entering an invalid age for an employee.
-- 2) Ensures Uniqueness:- Using the PRIMARY KEY or UNIQUE constraints ensures that there are no duplicates, such as multiple employees having the same email address or ID, which could lead to inconsistencies.
-- 3) Maintains Relationships:- FOREIGN KEY constraints help maintain relationships between tables. For instance, by ensuring that an order is only placed by an existing employee, referential integrity is maintained, preventing orphaned records.
-- 4) Enforces Business Logic:- Constraints like CHECK can enforce business rules directly in the database schema (e.g., ensuring that an employee’s salary is never negative).
-- 5) Protects against Data Corruption:- By defining rules that prevent invalid or conflicting data, constraints safeguard the database from corruption, which can occur through human error or faulty application logic.
 
# Common Types of Constraints :-
# 1) Primary key Constraints :- It is the combination of Unique and Not Null constraints.
-- It ensures that each row in a table has a unique identifier. A primary key constraint ensures that the column or combination of columns designated as the primary key contains unique, non-null values.
-- Example :-
CREATE TABLE Student (
    stud_id INTEGER PRIMARY KEY,
    stud_name TEXT
);

# 2) Foreign Key Constraint :- It enforces referential integrity by ensuring that a value in one table corresponds to an existing value in another table. 
-- It creates a relationship between two tables and ensures that updates or deletions in the referenced table are consistent with the data in the referencing table.
-- Example :- 
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    emp_id INTEGER,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

# 3) Unique Constraint :- In this no duplicate values are allowed for entries restricted by a unique constraint. For ex :- Barcode, employee id, product code should be in unique value.
-- Example :-
CREATE TABLE Sr_Employees (
    Emp_ID INT NOT NULL PRIMARY KEY,
    Email VARCHAR(30) UNIQUE);

# 4) Not Null Constraint :- It ensure that you do not enter any empty data/ you cannot leave that column blank, It is useful in that situation where there must always be data within selected columns.
-- Examples :-
CREATE TABLE New_Employees (
    Emp_ID INT NOT NULL PRIMARY KEY,
    Emp_Name TEXT NOT NULL);

# 5) Check Constraint :- It means that you have to ensure that proper values/requirments entered/given to the columns.
-- Example :-
CREATE TABLE Jr_Employees (
    Emp_ID INT NOT NULL PRIMARY KEY,
    Emp_Name TEXT NOT NULL,
    Age INT CHECK (Age >= 18));

# 6) DEFAULT Constraint :- It means if a user fails to enter any data information/value, Then the it will automatically fill the default value there.
-- Example :-
CREATE TABLE Teacher (
    Teacher_ID INT NOT NULL PRIMARY KEY,
    Teacher_Name TEXT NOT NULL,
    Age INT CHECK (Age >= 18),
    Email VARCHAR(30),
    Subjects varchar(20),
    Salary DECIMAL DEFAULT 30000
);


## ANSWER 3 :-

# The NOT NULL constraint is applied to a column to ensure that the column always contains a value — it cannot have a NULL value. The primary purpose of this constraint is to guarantee that certain important data is always available when rows are inserted or updated in the table.
# The NOT NULL constraint ensures that critical columns always contain valid data.
# Key reasons are :-
-- 1) Data Integrity.
-- 2) Business Rules.
-- 3) Data Consistency.
-- 4) Avoiding Errors in Operations.

# NO, a primary key cannot contain NULL values because it is designed to uniquely identify rows, and NULL would break this requirement by making it impossible to distinguish between rows.
# A Primary Key cannot contain NULL values, because of its:-
-- 1) Uniqueness :- A primary key is meant to uniquely identify each row in a table. If a column in a primary key contained NULL values, it would violate the uniqueness requirement because NULL is considered 'unknown' and multiple NULL values could be treated as identical, which breaks the uniqueness rule.
-- 2) Non-Null Requirement :- A primary key column must be non-null. This ensures that every row has a unique identifier. The database will not allow any row to have a NULL value in the primary key column because it would not be able to uniquely identify that row.
-- 3) Logical Integrity :- If a primary key column allowed NULL, there could be ambiguity in identifying records. For example, if there are multiple rows with NULL in the primary key column, the system would not be able to distinguish between those rows, which is fundamentally problematic for relational integrity.
# Example :-
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,  -- Emp_ID cannot be NULL and must be unique
    Emp_Name TEXT NOT NULL    -- Emp_Name must also not be NULL
);


## ANSWER 4 :-

# The steps are involved in SQL commands used to add or remove constraints on an existing table :-
-- For Adding a Constraint to an Existing Table :- To add a constraint, use ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint_type (column_name).
-- Example :-
ALTER TABLE Teacher
ADD CONSTRAINT Teacher_Id UNIQUE (Teacher_id);

select * from teacher;

-- For Removing a Constraint from an Existing Table :- To remove a constraint, use ALTER TABLE table_name DROP CONSTRAINT constraint_name.
-- Example :-
ALTER TABLE Teacher
DROP CONSTRAINT Teacher_Id;

select * from teacher;


## ANSWER 5 :-

# When we performing sql command (insert, update, or delete) operations on a table, 
-- if the data violates any constraints that are defined on the table, the operation will fail, and an error message will be returned. 
-- These constraints are defined to ensure data integrity and consistency in the database, and violating them can lead to inconsistent or invalid data being inserted or modified.

-- Example Errors When Violating Constraints :-
-- 1) Primary Key Constraint :- Primary key ensures that each row in a table has a unique identifier.
INSERT INTO Employees VALUES 
(1, 'John Doe', 35, "john123@gmail.com", 45000),
(2, 'Jane Doe', 30, "jane145@gmail.com", 70000),
(1, 'Sunita', 30, "sunita123@gmail.com", 95000);
select * from employees;
-- Here Violation :- Attempting to insert a duplicate value into a column with a PRIMARY KEY or trying to update the primary key to an existing value will result in an error.

-- 2) Foreign Key Constraint :- Foreign key ensures that values in a column match values in another table (to maintain referential integrity).
INSERT INTO orders (order_id, emp_id) VALUES (1001, 999);
-- Here Violation :- Trying to insert a value in a foreign key column that does not exist in the referenced table, or deleting a record in the referenced table that has related records in the foreign key table, will result in an error.

-- 3) Unique Constraint (UNIQUE) :- It ensures that all values in a column are unique (no duplicates).
INSERT INTO Employees VALUES 
(3, 'Anita', 30, "anita123@gmail.com", 45000),
(4, 'Asha', 29, "asha145@gmail.com", 70000),
(5, 'Sunita', 30, "asha145@gmail.com", 95000);
select * from employees;
-- Here Violation :- Attempting to insert or update a value that already exists in a column with a UNIQUE constraint will lead to an error.

-- 4) Check Constraint :- It ensures that the values in a column meet a specific condition (e.g., a value must be within a certain range).
INSERT INTO Employees (Emp_id, Emp_Name, Age) VALUES (6,'sangeet', 15);
-- Here Violation :- Inserting or updating data that does not satisfy the CHECK condition will raise an error.

-- 5) Not Null Constraint :- It ensures that a column cannot have NULL values.
INSERT INTO jr_employees VALUES (2, 'null' ,39), (3, 57);
select * from jr_employees;
-- Here Violation :- Attempting to insert or update a row with a NULL value into a NOT NULL column will result in an error.

-- 6) Default Constraint :- It ensures that a column gets a default value if no value is provided during an INSERT.
INSERT INTO Employees VALUES (10, "Ram", 56, "ram129@gmail.com");
-- Here Violation :- Violations are rare for the DEFAULT constraint, but if a column with a DEFAULT value is explicitly set to NULL (when NOT NULL constraint is not applied), it can cause an error.

# Consequences of Violating Constraints :-
-- 1) Data Integrity :- Constraints ensure that data remains consistent and valid across the database. Violating them can lead to inconsistent data, which could cause errors or unexpected behavior in applications using the database.
-- 2) Transaction Rollback :- In many databases, if a constraint violation occurs, the current transaction (the INSERT, UPDATE, or DELETE) is rolled back, and no changes are made to the table.
-- 3) Performance Issues :- Constant violations might indicate a deeper issue with the design of the table or how data is being managed, possibly affecting performance or the ability to maintain data integrity.


## ANSWER 6 :-

# Created a products table without constraints as given in the question:

CREATE TABLE product
(product_id INT, 
product_name VARCHAR(50), 
price DECIMAL(10, 2));

-- Add primary key constraint to product_id :-
Alter table products 
add constraint product_id primary key (product_id);

-- Set default value 50.00 for price column :-
alter table products
alter column price set default 50.00;

## ANSWER 7 :-
-- Creating the Students and Classes :-

create table Students (
Student_Id int unique,
Student_Name text,
Class_Id int);

insert into students values 
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101);
select * from students;

create table Classes (
Class_Id int,
Class_Name text);

insert into Classes values
(101, 'Maths'),
(102, 'Science'),
(103, 'History');
select * from classes;

-- SQL Query to fetch the student_name and class_name for each student using an INNER JOIN :-
SELECT 
    students.student_name, classes.class_name
FROM
    students
        INNER JOIN
    classes ON students.class_id = classes.class_id;

## ANSWER 8 :-
-- Creating the Orders, Customers and Product table to perform query :-

create table Orders 
(Order_Id int, 
Order_Date date,
Customer_Id int);
insert into Orders values
(1, '2024-1-1', 101), 
(2, '2024-1-03', 102);
select * from Orders;

create table Customers 
(Customer_Id int, 
Customer_Name text);
insert into Customers values
(101, 'Alice'), 
(102, 'Bob');
select * from Customers;

create table Products
(Product_Id int, 
Product_Name varchar(30), 
Order_Id int);
insert into Products values
(1, 'Laptop', 1), 
(2, 'Phone', Null);
select * from products;

-- SQL  query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order 
Select orders.order_id, customers.customer_name, products.product_name from products 
left join orders on products.order_id = orders.order_id
left join customers on orders.customer_Id = customers.customer_Id;


## ANSWER 9 :-

-- Creating Sales, Product table :-

create table Sales
(Sale_Id int, Product_Id int, Amount int);
insert into Sales values (1, 101, 500),
(2, 102, 300), (3, 101, 700);
select * from Sales;

create table Products
(Product_Id int, Product_Name varchar(30));
insert into Products values 
(101, 'Laptop'), (102, 'Phone');
select * from products;

-- SQL query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
select products.product_name, sum(sales.amount) as total_sales from sales
inner join products on sales.product_id = products.product_id
group by products.product_name;


## ANSWER 10 :-

-- Creating Orders, Customers, Order_Details tables :-

create table Orders 
(Order_Id int, 
Order_Date date,
Customer_Id int);
insert into Orders values
(1, '2024-1-02', 1), 
(2, '2024-1-05', 2);
select * from Orders;

create table Customers 
(Customer_Id int, 
Customer_Name text);
insert into Customers values
(1, 'Alice'), 
(2, 'Bob');
select * from Customers;

create table Order_Details
(Order_Id int,
Product_Id int, 
Quantity int);
insert into Order_Details values
(1, 101, 2),
(1, 102, 1), 
(2, 101, 3);
select * from Order_Details;

-- SQL query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.
SELECT Orders.Order_Id, 
       Customers.Customer_Name, 
       Order_Details.Quantity
FROM Orders
INNER JOIN Customers on Orders.Customer_Id = Customers.Customer_Id
INNER JOIN Order_Details on Orders.Order_Id = Order_Details.Order_Id;



### SQL COMMAND :- ###

## ANSWER 1 :-

use mavenmovies;
select * from actor;
# To identify the Primary Keys (PKs) and Foreign Keys (FKs), let's break down the general structure and relationship between the tables.

# Primary Key (PK) :-
-- Primary Key is a unique identifier for each record in a table.
-- It ensures that each row in a table is uniquely identifiable.
-- A table can only have one primary key, but that primary key can consist of one or more columns (composite primary key).

# Foreign Key (FK) :-
-- Foreign Key is a column or a set of columns that is used to establish a link between two tables.
-- It refers to the Primary Key in another table, ensuring referential integrity between the tables.
-- A foreign key allows values from one table to appear in another table, ensuring relationships are properly established.

# Identifying Primary and Foreign Keys:
# Primary Keys:-
-- Actor_Award Table:- Actor_awardfilm_Id is the primary key, uniquely identifying each movie award in the table.
-- Actors Table:- Actor_Id is the primary key, uniquely identifying each actor.
-- Film Table: Film_Id is the primary key, uniquely identifying each film.customer
-- Customers Table: Customer_Id is the primary key, uniquely identifying each customer.
# Foreign Keys:-
-- 1) Movies Table:
-- Genre_Id is a foreign key that references Genre_Id in the Genres table.
-- Director_Id is a foreign key that references Director_Id in the Directors table.
-- 2) Orders Table:
-- Customer_Id is a foreign key that references Customer_Id in the Customers table.
-- Movie_Id is a foreign key that references Movie_Id in the Movies table.


## ANSWER 2 :-
-- List all details of actors
select * from actor;

## ANSWER 3 :-
-- List all customer information from DB.
select * from customer;

## ANSWER 4 :-
-- List different countries 
select distinct country from country;

## ANSWER 5 :-
-- Display all active customers
select * from customer where active = 1;

## ANSWER 6 :-
-- List of all rental IDs for customer with ID 1
select rental_id from rental where customer_id = 1;

## ANSWER 7 :-
-- Display all the films whose rental duration is greater than 5 .
select * from film where rental_duration > 5;

## ANSWER 8 :-
-- List the total number of films whose replacement cost is greater than $15 and less than $20.
select count(*) as Total_No_films from film where replacement_cost > 15 and replacement_cost < 20;

## ANSWER 9 :-
-- Display the count of unique first names of actors.
select count(Distinct first_name) as unique_first_name_count from actor;  

## ANSWER 10 :-
-- Display the first 10 records from the customer table .
select * from customer limit 10;

## ANSWER 11 :-
-- Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer where first_name like 'b%' limit 3;

## ANSWER 12 :-
-- Display the names of the first 5 movies which are rated as ‘G’.
select * from film where rating = 'G' limit 5; 

## ANSWER 13 :-
-- Find all customers whose first name starts with "a".
select * from customer where first_name like 'a%';

## ANSWER 14 :-
-- Find all customers whose first name ends with "a".
select * from customer where first_name like '%a';

## ANSWER 15 :-
-- Display the list of first 4 cities which start and end with ‘a’ .
select * from city where city like 'a%a';

## ANSWER 16 :-
-- Find all customers whose first name have "NI" in any position.
select * from customer where first_name like '%ni%';

## ANSWER 17 :-
-- Find all customers whose first name have "r" in the second position .
select * from customer where first_name like '_r%';

## ANSWER 18 :-
-- Find all customers whose first name starts with "a" and are at least 5 characters in length.
select * from customer where first_name like 'a%' and length(first_name) >= 5;

## ANSWER 19 :-
-- Find all customers whose first name starts with "a" and ends with "o".
select * from customer where first_name like 'a%o';

## ANSWER 20 :-
-- Get the films with pg and pg-13 rating using IN operator
select * from film where rating in ('PG', 'PG-13');

## ANSWER 21 :-
-- Get the films with length between 50 to 100 using between operator.
select * from film where length between 50 and 100;

## ANSWER 22 :-
-- Get the top 50 actors using limit operator.
select * from actor limit 50;

## ANSWER 23 :-
-- Get the distinct film ids from inventory table.
select distinct film_id from inventory;



### Functions (Basic Aggregate Functions) :- ###

## ANSWER 1 :-
-- Retrieve the total number of rentals made in the Sakila database.
use sakila;
select count(*) as total_rental from rental;

## ANSWER 2 :-
-- Find the average rental duration (in days) of movies rented from the Sakila database.
select avg(rental_duration) as Avg_Rental_Duration from film;

## ANSWER 3 :-
-- Display the first name and last name of customers in uppercase.
select upper(first_name) as Upper_Case_FN, upper(last_name) as Upper_Case_LN from customer;

## ANSWER 4 :-
-- Extract the month from the rental date and display it alongside the rental ID.
select rental_Id, month(rental_date) as rental_month from rental;

select rental_id, monthname(rental_date) as rental_month_name from rental;



### GROUP BY :- ###

## ANSWER 5 :-
-- Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
select customer_id, count(*) as rental_count from rental group by customer_id;

## ANSWER 6 :-
-- Find the total revenue generated by each store.
select store.store_id, sum(payment.amount) as total_revenue from payment
join rental on payment.rental_id = rental.rental_id
join inventory on rental.inventory_id = inventory.inventory_id
join store on inventory.store_id = store.store_id
group by store.store_id;

## ANSWER 7 :-
-- Determine the total number of rentals for each category of movies.
select category.name as category_name, COUNT(rental.rental_id) as total_rentals
from rental
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
group by category.name;

## ANSWER 8 :-
-- Find the average rental rate of movies in each language.
select language.name as language_name, avg(film.rental_rate) as avg_rental_rate from film
join language on film.language_id = language.language_id
group by language_name;



### JOINS :- ###

## ANSWER 9 :-
-- Display the title of the movie, customers first name, and last name who rented it.
use sakila;
select film.title, customer.first_name, customer.last_name
from film 
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join customer on rental.customer_id = customer.customer_id;


## ANSWER 10 :-
-- Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
select actor.first_name, actor.last_name from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where film.title = 'Gone with the wind';

select * from film where title = 'gone with the wind';

## ANSWER 11 :-
-- Retrieve the customer names along with the total amount they've spent on rentals.
select customer.first_name, customer.last_name, sum(payment.amount) as total_spent from customer
join payment on customer.customer_id = payment.customer_id
join rental on rental.rental_id = payment.rental_id
group by customer.customer_id;

## ANSWER 12 :-
-- List the titles of movies rented by each customer in a particular city (e.g., 'London').

select customer.first_name, customer.last_name, film.title FROM customer
join address on customer.address_id = address.address_id
join city on address.city_id = city.city_id
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
join film on inventory.film_id = film.film_id
where city.city = 'London'
order by customer.last_name, customer.first_name, film.title;


### Advanced Joins and GROUP BY :- ###

## ANSWER 13 :-
-- Display the top 5 rented movies along with the number of times they've been rented.
select film.title, COUNT(rental.rental_id) AS rental_count from film 
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by film.film_id
order by rental_count desc
limit 5;

## ANSWER 14 :-
-- Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
select customer.first_name, customer.last_name, customer.customer_id from customer
join rental on customer.customer_id = rental.customer_id
join inventory on rental.inventory_id = inventory.inventory_id
where inventory.store_id in (1, 2)
group by customer.customer_id
having count(distinct inventory.store_id) = 2;


### Windows Function :- ###

## ANSWER 1 :-
-- Rank the customers based on the total amount they've spent on rentals.
select customer.first_name, customer.last_name, 
SUM(payment.amount) AS total_spent,
rank() over (order by SUM(payment.amount) desc) as rank_order from customer
join payment on customer.customer_id = payment.customer_id
group by customer.customer_id
order by rank_order;

## ANSWER 2 :-
-- Calculate the cumulative revenue generated by each film over time.
select film.title, payment.payment_date,
sum(payment.amount) over (partition by film.film_id order by payment.payment_date) as cumulative_revenue
from film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join payment on rental.rental_id = payment.rental_id
order by film.title, payment.payment_date;

## ANSWER 3 :-
-- Determine the average rental duration for each film, considering films with similar lengths.
select film.length,
avg(film.rental_duration) as average_rental_duration
from film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by film.length
order by film.length;

## ANSWER 4 :-
-- Identify the top 3 films in each category based on their rental counts.
with FilmRentalCounts as (
select film.title, category.name as category, count(rental.rental_id) as rental_count from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id group by film.title, category.name)
select title, category, rental_count
from (select title, category, rental_count,
row_number() over (partition by category order by rental_count desc) as rank_order
from FilmRentalCounts) as RankedFilms
where rank_order <= 3
order by category, rank_order;

## ANSWER 5 :-
-- Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
with CustomerRentalCounts as (
select customer.customer_id, customer.first_name, customer.last_name, 
count(rental.rental_id) as total_rentals from customer
join rental on customer.customer_id = rental.customer_id
group by customer.customer_id),
AverageRentalCount as (select avg(total_rentals) as avg_rentals
from CustomerRentalCounts)
select CustomerRentalCounts.customer_id, CustomerRentalCounts.first_name, 
CustomerRentalCounts.last_name, CustomerRentalCounts.total_rentals, AverageRentalCount.avg_rentals,
(CustomerRentalCounts.total_rentals - AverageRentalCount.avg_rentals) as rental_difference
from CustomerRentalCounts, AverageRentalCount
order by rental_difference desc;

## ANSWER 6 :-
-- Find the monthly revenue trend for the entire rental store over time.
select date_format(payment.payment_date, '%Y-%m') as month, 
sum(payment.amount) AS monthly_revenue
from payment 
group by date_format(payment.payment_date, '%Y-%m')  
order by month;  

## ANSWER 7 :-
-- Identify the customers whose total spending on rentals falls within the top 20% of all customers.
with CustomerTotalSpending as (
select customer.customer_id, customer.first_name, customer.last_name, sum(payment.amount) as total_spent
from customer
join payment on customer.customer_id = payment.customer_id
group by customer.customer_id),

RankedCustomers as (
select customer_id, first_name, last_name, total_spent,
percent_rank() over (order by total_spent desc) as spending_percent_rank
from CustomerTotalSpending)

select customer_id, first_name, last_name, total_spent
from RankedCustomers
where spending_percent_rank >= 0.80  -- Top 20% of customers
order by total_spent desc;

## ANSWER 8 :-
-- Calculate the running total of rentals per category, ordered by rental count.
with RentalCounts as (
select category.name as category_name, 
count(rental.rental_id) as rental_count from category
join film_category on category.category_id = film_category.category_id
join film on film_category.film_id = film.film_id
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by category.name)

select category_name, rental_count,
sum(rental_count) over (order by rental_count desc) as running_total
from RentalCounts
order by rental_count desc;

## ANSWER 9 :-
-- Find the films that have been rented less than the average rental count for their respective categories.
with FilmRentalCounts as (
select film.film_id, film.title, category.name as category_name, 
count(rental.rental_id) as rental_count from film 
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by film.film_id, film.title, category.name),

CategoryAverageRentalCounts as (
select category_name, avg(rental_count) as avg_rental_count
from FilmRentalCounts
group by category_name)

select FilmRentalCounts.film_id, FilmRentalCounts.title, FilmRentalCounts.category_name, FilmRentalCounts.rental_count
from FilmRentalCounts
join CategoryAverageRentalCounts on FilmRentalCounts.category_name = CategoryAverageRentalCounts.category_name
where FilmRentalCounts.rental_count < CategoryAverageRentalCounts.avg_rental_count
order by FilmRentalCounts.category_name, FilmRentalCounts.rental_count;

## ANSWER 10 :-
-- Identify the top 5 months with the highest revenue and display the revenue generated in each month
select date_format(payment.payment_date, '%Y-%m') as month, 
sum(payment.amount) as total_revenue from payment
group by date_format(payment.payment_date, '%Y-%m')
order by total_revenue desc  
limit 5;



### Normalisation & CTE :- ###

## ANSWER 1 :-
-- In 1NF, we ensure:
-- 1) Atomic values :- No column should contain multiple values or lists.
-- 2) Uniqueness of records :- Each record must be unique, which is typically ensured by a primary key.
use sakila;
select * from film;
select special_features from film;
-- The special_features column in the film table violates 1NF because it stores multiple values in a single column. 
-- The proposed solution creates a new table that properly atomizes these values while maintaining data integrity.

-- However, the special_features column in the related film table violates 1NF:

-- First create the film_duplicate table :-
CREATE TABLE film_Duplicate (
    film_id SMALLINT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY (film_id)
);
select * from film_duplicate;

-- Normalization Solution ----> Create a separate film_special_features table :-
CREATE TABLE film_special_features (
    film_id SMALLINT NOT NULL,
    special_feature VARCHAR(50) NOT NULL,
    PRIMARY KEY (film_id, special_feature),
    FOREIGN KEY (film_id) REFERENCES film_duplicate(film_id)
);
select * from film_special_features;


## ANSWER 2 :-
# 2NF Requirements Check
-- 1) Must be in 1NF (verified).
-- 2) All non-key attributes must depend on the entire primary key.

# Determining if a Table is in 2NF:
# To determine if a table is in 2NF, follow these steps:
-- Check for 1NF Compliance :- Ensure the table is already in 1NF (i.e., atomic columns, no repeating groups).
-- Identify the Primary Key :- Identify the primary key of the table. If it's a composite key (more than one column), look for partial dependencies.
-- Check for Partial Dependencies :- Ensure that all non-key columns are fully dependent on the entire primary key, not just part of it. If any non-key column depends only on part of a composite key, then the table violates 2NF.

# We will choose the "film_category" table, which has a composite primary key. 
-- This will allow us to show the steps of checking whether it satisfies Second Normal Form (2NF).

-- 1) The film_category table is used to associate films with categories. Here’s the table structure:
create table film_category (
    film_id smallint UNSIGNED,
    category_id tinyint UNSIGNED,
    last_update timestamp,
    PRIMARY KEY (film_id, category_id)   -- Here, Primary Key: Composite of (film_id, category_id)
);

# Step-by-Step Analysis of the film_category Table :-
-- Step 1 :- Is it in 1NF
-- The attributes (film_id, category_id, last_update) all contain atomic values. There are no repeating groups or arrays.
-- Primary Key :- The combination of film_id and category_id uniquely identifies each record in the table.

-- Step 2 :- Check for Partial Dependencies
-- The primary key of the film_category table is composite, consisting of two columns: film_id and category_id.
-- The last_update column depends on the entire composite key (film_id and category_id), so there is no partial dependency.

# If the Table Violates 2NF
-- Steps to Normalize the Table if It Violates 2NF :-
-- the film_category table had an additional column like category_name, which depends only on category_id (part of the composite key), here’s how we would normalize it to 2NF:

-- Step 1 :- Identify the Partial Dependency
-- category_name depends only on category_id, not on the entire composite key (film_id, category_id).

-- Step 2 :- Normalize the Table
-- To resolve this partial dependency, Create a new category table to store information about categories, including category_name.
CREATE TABLE new_category (
    category_id tinyint UNSIGNED PRIMARY KEY,
    category_name varchar(25),
    last_update timestamp
);

-- Remove category_name from the film_category table. 
-- The film_category table should only store relationships between film_id and category_id.
CREATE TABLE new_film_category (
    film_id smallint UNSIGNED,
    category_id tinyint UNSIGNED,
    last_update timestamp,
    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id) -- Reference to the new category table
);
-- Now, the category_name is stored in the category table, and the film_category table only stores the relationships between films and categories, satisfying 2NF.

-- The film_category table in the Sakila database does not violate 2NF. It is in 2NF because there are no partial dependencies. All non-key attributes (last_update) depend on the entire composite key (film_id, category_id).
-- However, if the table had attributes like category_name, which depend only on part of the composite key (e.g., just category_id), it would violate 2NF, and we would need to split the data into two tables to normalize it.

## ANSWER 3 :-
-- To determine if a table violates 3NF, we need to first ensure that the table is in 2NF (which means there are no partial dependencies).
-- In 3NF, a table should not have any transitive dependencies. If there is a transitive dependency, we need to decompose the table to eliminate it.

-- A table in Sakila that violates 3NF is the "customer" table

# Step 1 :- Check if the Table is in 2NF
-- The customer table has a single-column primary key (customer_id), so there are no partial dependencies.
-- All non-key attributes depend on the entire primary key.

# Step 2 :- Identify Transitive Dependencies
-- A transitive dependency exists if:
-- A non-key attribute depends on another non-key attribute, and that second non-key attribute depends on the primary key.

-- There is a transitive dependency :- customer_id --> address_id --> (address details), where the address details are indirectly dependent on customer_id.

# Step 3 :- Steps to Normalize the Table to 3NF
-- Create an address table to store address-related details, such as address, district, city_id, and other address-related fields.
CREATE TABLE new_address (
    address_id smallint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    address varchar(50),
    address2 varchar(50),
    district varchar(20),
    city_id smallint UNSIGNED,
    postal_code varchar(10),
    phone varchar(20),
    last_update timestamp
);

-- Then modify the customer table :- Remove any direct address-related information (such as address, district, etc.) and leave only the address_id, which references the address table.
CREATE TABLE new_customer (
    customer_id smallint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id tinyint UNSIGNED,
    first_name varchar(45),
    last_name varchar(45),
    email varchar(50),
    address_id smallint UNSIGNED,  -- This links to the `address` table
    active tinyint(1),
    create_date datetime,
    last_update timestamp,
    FOREIGN KEY (address_id) REFERENCES address(address_id)  -- Foreign Key relationship
);

-- Now, the customer table no longer stores address details directly. Instead, it stores the address_id, which links to the address table.
-- The address table now handles all the address-related data. By doing this, we've removed the transitive dependency on address-related data, and the customer table is now in 3NF.

## ANSWER 4 :-
-- Let's take the payment table in the Sakila database as an example and guide through the normalization process from Unnormalized Form (UNF) to 2NF

# 1) Unnormalized Form (UNF)
-- Let's assume our payment table contains repeated payment records for the same customer.
-- -- Step 1: Create an Unnormalized Payment Table :-
create table payment_unnormalized (
    payment_id int PRIMARY KEY,
    customer_id int,
    staff_id int,
    rental_id int,
    amount decimal(5, 2),
    payment_date datetime,
    last_update timestamp
);

insert into payment_unnormalized (payment_id, customer_id, staff_id, rental_id, amount, payment_date, last_update)
values
(1, 100, 1, 5001, 5.99, '2025-01-03 10:00:00', '2025-01-03 10:00:00'),
(2, 100, 1, 5002, 2.99, '2025-01-03 11:00:00', '2025-01-03 11:00:00'),
(3, 101, 2, 5003, 7.99, '2025-01-03 12:00:00', '2025-01-03 12:00:00'),
(4, 102, 3, 5004, 4.99, '2025-01-03 13:00:00', '2025-01-03 13:00:00');

# 2) First Normal Form (1NF)
-- To convert the payment_unnormalized table into 1NF, ensure that:
-- Each field contains atomic values (i.e., no repeating groups).
-- Each row has a unique identifier (primary key).

# 3) Second Normal Form (2NF)
-- To convert the table into 2NF, we need to eliminate partial dependencies (where non-key attributes depend only on part of a composite primary key). 
-- However, in the case of the payment_unnormalized table, the payment_id is the primary key, and there are no composite keys, so there are no partial dependencies.
-- Since this table already satisfies 1NF and has a single-column primary key, it is already in 2NF. Therefore, no further changes are needed.


### CTE :- ###

## ANSWER 5 :-
-- Query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
with ActorFilmCount as (
select actor.actor_id, 
concat(actor.first_name, ' ', actor.last_name) as Actor_Name, 
count(film_actor.film_id) as Film_Count from actor
left join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id)
select actor_name, film_count from ActorFilmCount;

## ANSWER 6 :-
-- Creating a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
with FilmLanguageInfo as (select
film.title as film_title, 
language.name as language_name, 
film.rental_rate
from film
join language on film.language_id = language.language_id)
select film_title, language_name, rental_rate from FilmLanguageInfo;


## ANSWER 7 :-
-- Query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
with CustomerRevenue as (select customer.customer_id, 
concat(customer.first_name, ' ', customer.last_name) as Customer_Name, 
sum(payment.amount) as total_revenue from customer
join payment on customer.customer_id = payment.customer_id
group by customer.customer_id)

select customer_name, total_revenue from CustomerRevenue;


## ANSWER 8 :-
with FilmRentalRank as (select film.film_id, film.title, film.rental_duration,
rank() over (order by film.rental_duration desc) as rental_rank from film)
select film_id, title, rental_duration, rental_rank from FilmRentalRank;

## ANSWER 9 :-
with CustomerRentalCount as (select rental.customer_id,
count(rental.rental_id) as rental_count from rental 
group by rental.customer_id having rental_count > 2)
select customer.customer_id, customer.first_name, customer.last_name,
customer.email, CustomerRentalCount.rental_count from customer 
join CustomerRentalCount on customer.customer_id = CustomerRentalCount.customer_id;


## ANSWER 10 :-
with MonthlyRentals as (select 
year(rental.rental_date) as rental_year, 
month(rental.rental_date) as rental_month, 
count(rental.rental_id) as total_rentals from rental
group by year(rental.rental_date), month(rental.rental_date))
select rental_year, rental_month, total_rentals from MonthlyRentals
order by rental_year, rental_month;


## ANSWER 11 :-
with ActorPairs as (select fa1.actor_id as actor_1_id,
fa2.actor_id as actor_2_id, fa1.film_id from film_actor fa1
join film_actor fa2 on fa1.film_id = fa2.film_id
where fa1.actor_id < fa2.actor_id)
select ap.actor_1_id, ap.actor_2_id, f.title as film_title from ActorPairs ap
join film f on ap.film_id = f.film_id
order by ap.actor_1_id, ap.actor_2_id;


## ANSWER 12 :-
select * from staff;
select * from store;

with recursive EmployeeHierarchy as (select s.staff_id, s.first_name,
s.last_name, s.store_id from staff s        -- Base case: Select the manager (or a specific staff member)
join store st on s.store_id = st.store_id
where st.manager_staff_id = 1  -- Replace 1 with the specific manager's staff_id like '2'

union all      -- Recursive case: Select employees working at the same store as the previously found staff members
select s.staff_id, s.first_name, s.last_name, s.store_id
from staff s 
join store st on s.store_id = st.store_id
join EmployeeHierarchy eh on s.store_id = eh.store_id
where s.staff_id != eh.staff_id)  -- Avoid revisiting the same staff member

select staff_id, first_name, last_name from EmployeeHierarchy;
