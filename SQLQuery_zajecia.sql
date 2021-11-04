/*1*/
SElect Products.ProductName, Products.UnitPrice, sup.Address from Products
    join Suppliers as sup
        on sup.SupplierID = Products.SupplierID
    where products.UnitPrice BETWEEN 20 and 30

/*2*/
SElect Products.ProductName, Products.UnitPrice, Products.UnitsInStock from Products
    join Suppliers as sup
        on sup.SupplierID = Products.SupplierID
    where sup.CompanyName = 'Tokyo Traders'


/*3. WAZNE */
SElect * from Customers
    left outer join Orders as ord
        on Customers.CustomerID = ord.CustomerID and Year(ord.OrderDate) = 1997
    where Year(ord.OrderDate) is null


SElect Products.ProductName, Products.UnitPrice, sup.Address from Products
    join Suppliers as sup
        on sup.SupplierID = Products.SupplierID
    where products.UnitPrice BETWEEN 20 and 30

/*podwladni
select * from Employees as boss
join Employees as low
on boss.*/


select * from Employees as boss
left join Employees as low  on low.EmployeeID = boss.ReportsTo

