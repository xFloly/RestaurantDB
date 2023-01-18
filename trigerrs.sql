--trigger 1
--Uruchamia procedurę “uspCheckMenu” jeśli modyfikujemy tabelę Menu

CREATE trigger trCheckMenuPositions
   ON Menu
   AFTER INSERT, UPDATE
   AS
   BEGIN
       SET NOCOUNT ON;
       EXECUTE uspCheckMenu
   END
GO

--procedure 1a
--wyrzuca pozycje w menu po dacie "OutDate"

CREATE TRIGGER trMenuOutDate
ON Menu
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM Menu
WHERE OutDate < GETDATE() AND OutDate IS NOT NULL
END
GO


--trigger 2
--przy usuwaniu pracownika, wszyscy jego podwładni są przypisywani do jego zwierzchnika

CREATE TRIGGER trEmployeesDelete
ON Employees
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON
UPDATE Employees
SET ReportsTo = (SELECT ReportsTo FROM deleted)
WHERE ReportsTo IN (SELECT EmployeeID FROM deleted)
END
GO

--trigger 3
--Przyznaje zniżkę 10% dla danego klienta przy jego 10tym zamówieniu

CREATE TRIGGER trOrdersInsert
ON Orders
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @CustomerID INT
SELECT @CustomerID = CustomerID FROM inserted
DECLARE @order_count INT = (SELECT COUNT(*) FROM Orders WHERE CustomerID = @CustomerID)
IF @order_count = 10
BEGIN
UPDATE Discount
SET DiscountValue = 10
WHERE CustomerID = @CustomerID
END
END
GO

--trigger 4
--sprawdza czy dany stolik jest już zarezerwowany w danym czasie przed dodaniem nowej rezerwacji

CREATE TRIGGER trTableReservationsCheck
ON TableReservations
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @TableID INT
DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME
SELECT @TableID = TableID, @StartDate = TableReservationStart, @EndDate = TableReservationEnd FROM inserted
IF EXISTS (SELECT 1 FROM TableReservations WHERE TableID = @TableID AND TableReservationStart <= @EndDate AND TableReservationEnd >= @StartDate)
BEGIN
RAISERROR('Stolik jest już zarezerwowany w danym przedziale czasowym', 16, 1)
ROLLBACK TRANSACTION
END
END
GO

--trigger 5
--sprawdza, czy jest wystarczająco miejsca na daną liczbę osób przy składaniu rezerwacji

CREATE TRIGGER trReservationCheck
ON Reservations
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME
DECLARE @NumberOfPeople INT
SELECT @StartDate = StartDate, @EndDate = EndDate, @NumberOfPeople = NumberOfPeople
FROM inserted
JOIN ReservationDetails
ON ReservationDetails.ReservationID = inserted.ReservationID
JOIN TableReservations
ON TableReservations.TableID = ReservationDetails.TableID
WHERE TableReservationStart <= @EndDate AND TableReservationEnd >= @StartDate
AND NOT EXISTS (SELECT 1 FROM TableReservations
WHERE TableReservationStart <= @EndDate AND TableReservationEnd >= @StartDate
GROUP BY TableID
HAVING SUM(NumberOfPeople) + @NumberOfPeople > (SELECT SUM(Quantity) FROM [Tables]))
BEGIN
RAISERROR('Nie ma wystarczajaco miejsc na te liczbe osob', 16, 1)
ROLLBACK TRANSACTION
END
END
GO

