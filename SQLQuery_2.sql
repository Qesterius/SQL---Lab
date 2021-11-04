/*--------------------------------------------------*/
/*1.Dla każdej kategorii produktu (nazwa), podaj łączną liczbę zamówionych przez 
klientów jednostek towarów z tek kategorii*/
Select Products.CategoryID, SUM(ord.Quantity) from Products 
    INner join [Order Details] as ord
        ON ord.ProductID = Products.ProductID
    group by Products.CategoryID

/*2.Dla każdej kategorii produktu (nazwa), podaj łączną wartość zamówionych przez 
klientów jednostek towarów z tek kategorii.*/
Select Products.CategoryID, SUM(ord.Quantity * ord.UnitPrice*(1-ord.Discount) ) from Products 
    INner join [Order Details] as ord
        ON ord.ProductID = Products.ProductID
    group by Products.CategoryID

/*3. Posortuj wyniki w zapytaniu z poprzedniego punktu wg:
a) łącznej wartości zamówień
b) łącznej liczby zamówionych przez klientów jednostek towarów..*/
Select Products.CategoryID, SUM(ord.Quantity * ord.UnitPrice*(1-ord.Discount) ) as price from Products 
    INner join [Order Details] as ord
        ON ord.ProductID = Products.ProductID
    group by Products.CategoryID
    Order by price

Select Products.CategoryID, SUM(ord.Quantity * ord.UnitPrice*(1-ord.Discount) ) as price from Products 
    INner join [Order Details] as ord
        ON ord.ProductID = Products.ProductID
    group by Products.CategoryID
    Order by SUM(ord.Quantity)

    
/*4. Dla każdego zamówienia podaj jego wartość uwzględniając opłatę za przesyłkę nieWIIEM*/
Select SUM(det.UnitPrice*(1-det.Discount) )- Orders.Freight   as price from Orders 
    INner join [Order Details] as det
        ON det.OrderID = Orders.OrderID
    group by Orders.OrderID,Orders.Freight 
