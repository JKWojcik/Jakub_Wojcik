--Zadanie 1
--in CMD
cd /d D:\Programy\PostgreSQL\bin
pg_dump -U postgres -W -F t firma > firma.tar
--Zadanie 2
DROP DATABASE firma 
--Zadanie 3
CREATE DATABASE firma
--in CMD
cd /d D:\Programy\PostgreSQL\bin
pg_restore -U postgres --dbname=firma --verbose firma.tar
--Zadanie 4 i 5
--Zainstalowanie nowego œrodowiska i backup pobranej bazy danych przebiegl bezproblemowo
--Zadanie 6
--Pelny backup bazy danych wykonany w SSMS za pomoca Tasks->Backup
--Zadanie 7
CREATE VIEW logins AS
SELECT Employee.LoginID, Department.Name FROM HumanResources.Employee
JOIN HumanResources.EmployeeDepartmentHistory 
ON Employee.BusinessEntityID = EmployeeDepartmentHistory.BusinessEntityID
JOIN HumanResources.Department ON EmployeeDepartmentHistory.DepartmentID = Department.DepartmentID;
SELECT * FROM logins


