/*1.Dla każdego zamówienia podaj łączną liczbę zamówionych jednostek towaru oraz nazwę klienta*/
Select cus.CompanyName, ord.OrderID, SUM(det.Quantity) 
from Orders as ord,[Order Details] AS det ,Customers as cus 
where (ord.OrderID = det.OrderID AND ord.CustomerID = cus.CustomerID) 
group by ord.OrderID, cus.CompanyName

/*2.Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których 
łączna liczbę zamówionych jednostek jest większa niż 250*/
Select cus.CompanyName, ord.OrderID, SUM(det.Quantity)  as quanti
from Orders as ord  
INNER join [Order Details] AS det
    ON ord.OrderID = det.OrderID  
INNER join Customers as cus 
    ON ord.CustomerID = cus.CustomerID
group by ord.OrderID, cus.CompanyName 
Having SUM(det.Quantity) >250

/*Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz nazwę 
klienta*/
Select cus.CompanyName, ord.OrderID, SUM(det.Quantity * det.UnitPrice*(1-det.Discount) ) as quanti
from Orders as ord  
INNER join [Order Details] AS det
    ON ord.OrderID = det.OrderID  
INNER join Customers as cus 
    ON ord.CustomerID = cus.CustomerID
group by ord.OrderID, cus.CompanyName 

/*4.Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia, dla których 
łączna liczba jednostek jest większa niż 250.*/
Select cus.CompanyName, ord.OrderID, SUM(det.Quantity * det.UnitPrice*(1-det.Discount) ) as quanti
from Orders as ord  
INNER join [Order Details] AS det
    ON ord.OrderID = det.OrderID  
INNER join Customers as cus 
    ON ord.CustomerID = cus.CustomerID
group by ord.OrderID, cus.CompanyName 
HAVING SUM(det.Quantity) >250

/* 5.Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i nazwisko 
pracownika obsługującego zamówienie*/
Select emp.FirstName+' '+emp.Lastname,cus.CompanyName, ord.OrderID, SUM(det.Quantity * det.UnitPrice*(1-det.Discount) ) as quanti
from Orders as ord  
INNER join [Order Details] AS det
    ON ord.OrderID = det.OrderID  
INNER join Customers as cus 
    ON ord.CustomerID = cus.CustomerID
Inner join Employees as emp
    ON ord.EmployeeId = emp.EmployeeID 
group by ord.OrderID, cus.CompanyName , emp.Lastname,emp.FirstName
HAVING SUM(det.Quantity) >250
