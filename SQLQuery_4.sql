/*1. Dla każdego pracownika (imię i nazwisko) podaj łączną wartość zamówień 
obsłużonych przez tego pracownika
– Ogranicz wynik tylko do pracowników
a) którzy mają podwładnych
b) którzy nie mają podwładnyc*/



Select Employees.EmployeeID,Employees.LastName+' '+Employees.FirstName, SUM(det.Quantity*(1-det.Discount)*det.UnitPrice) from Employees
    join Orders as ord
        ON Employees.EmployeeID = ord.EmployeeID
    JOIN [Order Details] as det
        ON ord.OrderID = det.OrderID
    JOIN EmployeeTerritories as ter
        on Employees.EmployeeID = ter.EmployeeID
    Group by Employees.EmployeeID,Employees.LastName,Employees.FirstName

    Select Employees.EmployeeID,Employees.LastName+' '+Employees.FirstName, SUM(det.Quantity*(1-det.Discount)*det.UnitPrice) from Employees
    INner join Orders as ord
        ON Employees.EmployeeID = ord.EmployeeID
    Inner JOIN [Order Details] as det
        ON ord.OrderID = det.OrderID
    Inner JOIN EmployeeTerritories as ter
        on Employees.EmployeeID = ter.EmployeeID
    Group by Employees.EmployeeID,Employees.LastName,Employees.FirstName
