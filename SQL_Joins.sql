/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name Product, c.Name Category FROM products p
 JOIN categories c
 ON c.CategoryID = p.CategoryID
 WHERE c.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.name, p.price, r.rating 
FROM products p JOIN reviews r
ON p.ProductID = r.ProductID
WHERE rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT FirstName, LastName, sum(s.Quantity) AS Total
FROM employees e
JOIN sales s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name, d.Name
FROM categories c JOIN departments d
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, sum(s.Quantity) AS 'Total Sold', sum(s.Quantity + s.PricePerUnit) AS 'Total Price'
FROM Products p
JOIN Sales s
ON p.ProductID = s.ProductID
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment 
From products p
Join Reviews r
on p.ProductID = r.ProductID
WHERE r.Rating = 1
AND r.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName,p.Name, sum(s.Quantity) AS 'Total Sold'
From Sales s
Join employees e on e.EmployeeID = s.EmployeeID
Join products p on p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID