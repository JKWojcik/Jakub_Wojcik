--Zadanie 1
CREATE OR ALTER FUNCTION fibonacci(@n INT)
RETURNS @ciag TABLE(ciag INT)
AS
BEGIN
	DECLARE @pierwsza INT = 1;
	DECLARE @druga INT = 1;
	DECLARE @i INT = 1;
	DECLARE @temp INT;
	INSERT INTO @ciag VALUES(@pierwsza), (@druga)
	WHILE (@i <= @n-2)
	BEGIN 
		INSERT INTO @ciag VALUES(@druga + @pierwsza)
		SET @temp = @druga
		SET @druga = @druga + @pierwsza
		SET @pierwsza = @temp
		SET @i += 1
	END	
	RETURN 
END

CREATE OR ALTER PROCEDURE wyswietlanie_fibonacci 
@n INT
AS
BEGIN
SELECT * FROM fibonacci(@n)
END;

--Zadanie 2
CREATE TRIGGER duze_litery
ON Person.Person
AFTER INSERT
AS
BEGIN
DECLARE @id INT;
SELECT @id = inserted.BusinessEntityID FROM inserted
UPDATE Person.Person
SET Person.LastName = UPPER(Person.LastName) WHERE Person.BusinessEntityID = @id;
END;

--Zadanie 3
CREATE TRIGGER tax
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
DECLARE @tax1 smallmoney;
DECLARE @tax2 smallmoney;
SELECT @tax1 = deleted.TaxRate FROM deleted;
SELECT @tax2 = inserted.TaxRate FROM inserted;
IF (@tax2-@tax1)/@tax1 > 0.3
	PRINT 'Nast¹pi³a zbyt du¿a zmiana wartoœci'
END;