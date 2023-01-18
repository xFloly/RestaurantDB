--procedure 1
--Wyrzuca dania znajdujące się w aktualnym Menu dłużej niż 2 tygodnie, 
--tzn. ustawia ich “OutDate” na równy dacie uruchomienia procedury

create procedure uspCheckMenu
AS
BEGIN
   SET NOCOUNT ON
   BEGIN TRY
       BEGIN
           IF EXISTS(
               select * from MenuPositions
               WHERE DATEDIFF(day, InDate, GETDATE()) >= 14
               and(OutDate is null or OutDate > GETDATE())
               )
           BEGIN
               UPDATE MenuPositions
               SET OutDate = GETDATE()
               WHERE DATEDIFF(day, InDate, GETDATE()) >= 14
               and(OutDate is null or OutDate >= GETDATE())
           end
       END
   END TRY
   BEGIN CATCH
       DECLARE @msg nvarchar(2048)
           =N'Błąd usuwania dań: ' + ERROR_MESSAGE();
       THROW 52000, @msg, 1
   END CATCH
END
GO

--procedure 2
--Dodaje firmę o nazwie “companyName” oraz NIPie “NIP” 
--z miasta o ID “CityID” do tabeli Company i Customers

CREATE PROCEDURE [dbo].[uspInsertCompany] @companyName nvarchar(50), @NIP nvarchar(50), @CityID int
AS
BEGIN
   SET NOCOUNT ON;
   BEGIN TRY
       DECLARE @CustomerID INT
       SELECT @CustomerID = ISNULL(MAX(CustomerID), 0) + 1 from Customers
       INSERT INTO Company(CustomerID, CompanyName, NIP)
       VALUES (@CustomerID, @companyName, @NIP)
       INSERT INTO Customers(CustomerID, CityID)
       VALUES (@CustomerID, @CityID)
       SET @CustomerID = @@IDENTITY
   END TRY
   BEGIN CATCH
       DECLARE @msg NVARCHAR(2048) =
               'Bład przy dodawaniu firmy:' + CHAR(13) + CHAR(10) +
               ERROR_MESSAGE();
       THROW 52000,@msg, 1;
   END CATCH
END
go

--procedure 3
--Dodaje dane osoby o imieniu “firstname”, nazwisku “lastname”, 
--numerze telefonu “phone” i “ID” do tabeli Person


CREATE PROCEDURE uspInsertPerson @firstname nvarchar(50), @lastname nvarchar(50), @phone nvarchar(50), @PersonID int
AS
BEGIN
   SET NOCOUNT ON;
   BEGIN TRY
       IF (
           len(@phone) != 9
           )
           BEGIN
               ;
               THROW 52000, 'Zła długość numeru telefonu', 1
           END
       INSERT INTO Person(ID, LastName, FirstName, Phone)
       VALUES (@PersonID, @lastname, @firstname, @phone);
       SET @PersonID = @@IDENTITY
   END TRY
   BEGIN CATCH
       DECLARE @msg NVARCHAR(2048) = 'Bład przy dodawaniu osoby:' +
                                     CHAR(13) + CHAR(10) + ERROR_MESSAGE();
       THROW 52000,@msg, 1;
   END CATCH
END
go

--procedure 4
--Dodaje klienta o danym imieniu “firstname”, nazwisku “lastname”, 
--numerze telefonu “phone” z miasta “CityID” do tabeli IndividualCustomers,
--Customers oraz Person

CREATE PROCEDURE [dbo].[uspInsertIndividualCustomer] @firstname nvarchar(50), @lastname nvarchar(50), @phone nvarchar(50), @CityID int
AS
BEGIN
   SET NOCOUNT ON;
   BEGIN TRY
       DECLARE @CustomerID INT
       SELECT @CustomerID = ISNULL(MAX(CustomerID), 0) + 1 from Customers
       DECLARE @PersonID INT
       SELECT @PersonID = ISNULL(MAX(ID), 0) + 1 from Person
       EXEC uspInsertPerson @firstname, @lastname, @phone, @PersonID
     INSERT INTO Customers(CustomerID, CityID)
       VALUES (@CustomerID, @CityID)
       INSERT INTO IndividualCustomers(CustomerID, PersonID)
       VALUES (@CustomerID, @PersonID)
   SET @CustomerID = @@IDENTITY
   END TRY
   BEGIN CATCH
       DECLARE @msg NVARCHAR(2048) =
       'Bład przy dodawaniu klienta indywidualnego:' + CHAR(13) + CHAR(10) +
ERROR_MESSAGE();
       THROW 52000,@msg, 1;
   END CATCH
END
go


--procedure 5
--Dodaje szczegóły dotyczące zamówenia o ID “OrderID” tzn. 
--jakie danie oraz w jakiej ilości zamówiono

CREATE PROCEDURE uspInsertOrderDetailsToOrder @OrderID int,
                                             @MenuPositionID int,
                                             @Quantity int
AS
BEGIN
   SET NOCOUNT ON
   BEGIN TRY
       IF NOT EXISTS( SELECT *
               FROM Menu
               WHERE MenuPositionID = @MenuPositionID )
           BEGIN;
               THROW 52000, 'Nie ma takiej potrawy', 1
           END
       IF NOT EXISTS( SELECT * FROM Orders
               WHERE OrderID = @OrderID )
           BEGIN;
               THROW 52000, 'Nie ma takiego zamowienia', 1
           END

           DECLARE @DishID INT
           SELECT @DishID = DishID
           FROM Menu
           WHERE MenuPositionID = @MenuPositionID
           INSERT INTO OrderDetails(OrderID, DishID, MenuPosID, Quantity)
           VALUES (@OrderID, @DishID, @MenuPositionID, @Quantity)
       END TRY
       BEGIN CATCH
           DECLARE @msg nvarchar(2048)
               =N'Błąd dodawania szczegółów zamówienia: ' + ERROR_MESSAGE();
           THROW 52000, @msg, 1
       END CATCH
END
go








