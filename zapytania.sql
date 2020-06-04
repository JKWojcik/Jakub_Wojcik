--Zadanie 1
BEGIN
DECLARE @srednia INT;
SET @srednia = (SELECT AVG(Rate * PayFrequency) FROM HumanResources.EmployeePayHistory);
SELECT * FROM HumanResources.Employee
JOIN HumanResources.EmployeePayHistory ON Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID
WHERE Rate * PayFrequency < @srednia
END;

--Zadanie 2
CREATE FUNCTION DateOfShipment (@orderid INT)
RETURNS TABLE AS
RETURN (SELECT ShipDate FROM Purchasing.PurchaseOrderHeader
WHERE PurchaseOrderID = @orderid)

--Zadanie 3
CREATE PROCEDURE Product 
@name VARCHAR(50) = NULL
AS
BEGIN
SELECT ProductID, ProductNumber, SafetyStockLevel FROM Production.Product
WHERE Name = @name
END;

--Zadanie 4
CREATE FUNCTION NoCard (@orderid INT)
RETURNS TABLE AS
RETURN (SELECT CardNumber FROM Sales.CreditCard
JOIN Sales.SalesOrderHeader ON CreditCard.CreditCardID = SalesOrderHeader.CreditCardID
WHERE SalesOrderHeader.SalesOrderID = @orderid)

--Zadanie 5
CREATE PROCEDURE Dzielenie 
@num1 INT = NULL, @num2 INT = NULL
AS
BEGIN
IF @num1 < @num2
	PRINT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
ELSE
	SELECT @num1/@num2 as Wynik
END;