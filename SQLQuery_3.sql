/*1. Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które przewieźli w 1997r*/
Select ShipperID,COUNT(*) from Shippers 
    JOIN [Orders] as ord 
        ON ShipperID = ord.ShipVia
    Where YEAR(ord.ShippedDate)= 1997
    Group BY Shipperid

/*2. Który z przewoźników był najaktywniejszy (przewiózł największą liczbę 
zamówień) w 1997r, podaj nazwę tego przewoźnika*/
Select TOP 1  ShipperID,CompanyName,COUNT(*) from Shippers 
    Inner JOIN [Orders] as ord 
        ON ShipperID = ord.ShipVia
    Where YEAR(ord.ShippedDate)= 1997
    Group BY Shipperid, CompanyName
    order by 3 DESC

/*3.Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień 
obsłużonych przez tego pracownik*/
Select Employees.EmployeeID,Employees.LastName+' '+Employees.FirstName, SUM(det.Quantity*(1-det.Discount)*det.UnitPrice) from Employees
    join Orders as ord
        ON Employees.EmployeeID = ord.EmployeeID
    JOIN [Order Details] as det
        ON ord.OrderID = det.OrderID
    Group by Employees.EmployeeID,Employees.LastName,Employees.FirstName

/*4. Który z pracowników obsłużył największą liczbę zamówień w 1997r, podaj imię i 
nazwisko takiego pracownika*/    
    Select TOP 1 Employees.EmployeeID,Employees.LastName+' '+Employees.FirstName, SUM(det.Quantity*(1-det.Discount)*det.UnitPrice), COUNT(*) from Employees
    join Orders as ord
        ON Employees.EmployeeID = ord.EmployeeID
    JOIN [Order Details] as det
        ON ord.OrderID = det.OrderID
    where YEAR(ord.OrderDate) = 1997
    Group by Employees.EmployeeID,Employees.LastName,Employees.FirstName
    order by COUNT(*) DESC

/*5. Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia o 
największej wartości) w 1997r, podaj imię i nazwisko takiego pracownika*/
   
    Select TOP 1 Employees.EmployeeID,Employees.LastName+' '+Employees.FirstName, SUM(det.Quantity*(1-det.Discount)*det.UnitPrice) as price, COUNT(*) from Employees
    join Orders as ord
        ON Employees.EmployeeID = ord.EmployeeID
    JOIN [Order Details] as det
        ON ord.OrderID = det.OrderID
    where YEAR(ord.OrderDate) = 1997
    Group by Employees.EmployeeID,Employees.LastName,Employees.FirstName
    order by price DESC



