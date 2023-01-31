# Projek baz danych restauracji

## Założenia

**Cel projektu:**

Stworzenie bazy danych restauracji, aby umożliwić łatwe i szybkie zarządzanie informacjami o menu, klientach, rezerwacjach i transakcjach.

**Możliwości:**

Przechowywanie informacji o menu, cenach i dostępności potraw
Rejestrowanie i przeglądanie informacji o klientach i ich rezerwacjach
Śledzenie transakcji i obliczanie wyniku finansowego restauracji
Generowanie raportów i analiz dotyczących sprzedaży i popularności poszczególnych potraw
Umożliwienie wygodnego wyszukiwania i sortowania informacji w bazie danych

**Główne załozenia**:

Baza danych będzie prosta i łatwa w użyciu dla personelu restauracji
Będzie zabezpieczona i chroniona przed nieautoryzowanym dostępem
Będzie umożliwiać wygodne i szybkie wprowadzanie i aktualizację danych
Będzie umożliwiać efektywne wykorzystywanie informacji w celu poprawy działania restauracji i zwiększenia zysków.

## Schemat pielęgnacji bazy danych

Pielęgnacja bazy danych restauracji powinna obejmować następujące kroki:

**Regularne backupowanie bazy danych**:

Aby uniknąć utraty danych w przypadku awarii systemu lub innych problemów technicznych, należy regularnie tworzyć kopie zapasowe bazy danych i przechowywać je na bezpiecznym dysku lub w chmurze.

**Czyszczenie i archiwizacja danych**:

Regularnie należy czyścić bazę danych, usuwając niepotrzebne dane, takie jak stare rezerwacje lub zamówienia. Dane, które nie są już potrzebne, powinny być archiwizowane, aby nie zajmowały miejsca na serwerze.

## Diagram Relacji

![image](https://user-images.githubusercontent.com/101994826/215746970-73e348e5-ff38-4f4f-9c9b-a340b634e76e.png)


## Tabele

![Tabelki1](https://user-images.githubusercontent.com/101994826/215623823-5bc9791e-b6fd-48d3-b2db-a4420b264c40.png)
![Tabelki2](https://user-images.githubusercontent.com/101994826/215623833-4dd1a044-8ff2-4c19-a003-f556e127bcf4.png)

## Indeksy
**Categories_pk**:
ustawienie indeksu na CategoryID w Categories
```
create unique index Categories_pk
on Categories(CategoryID)
go
```
**Dishes_pk**:
ustawienie indeksu na DishID w Dishes
```
create unique index Dishes_pk
on Dishes(DishID)
go
```
**Menu_pk**: 
ustawienie indeksu na MenuPositionID w Menu 
```
create unique index Menu_pk
on Menu(MenuPositionID)
go
```
**Orders_pk**:
ustawienie indeksu na OrderID w Orders
```
create unique index Orders_pk
on Orders(OrderID)
go
```
**Customers_pk**:
ustawienie indeksu na CustomerID w Customers
```
create unique index Customers_pk
on Customers(CustomerID)
go
```
## Typowe zapytania

Typowe zapytania realizowane są w formie widoków oraz funkcji.

## Widoki

**allMenu**:

wyświetla wszystie pozycje, które kiedykolwiek wytąpiły w Menu

```

create view allMenu
as

select 	M.MenuPositionID,
	M.DishID,
	D.Name,
	M.DishPrice,
	M.InDate,
	M.OutDate
from Menu as M
inner join Dishes D on D.DishID= M.DishID

go
```
**QuantityOfOrderedDishes**:

wyświetla ilość zamówień na każdy produkt
```
create view QuantityOfOrderedDishes
as

select 	D.Name,
	(select  COUNT(*)
		from Dishes D1
		inner join Menu M
		on D1.DishID = M.DishID
		inner join OrderDetails OD on
		M.MenuPositionID = OD.MenuPosID
		where D.DishId = D1.DishID) as DishQuantitiy
from Dishes D

go
```
**CurrentMenu**: 

wypisuje w przejrzysty sposób aktualne menu: ID, nazwe dania, cene i kategorie
```
create view CurrentMenu as

select 	M.DishID,
	D.Name,
	M.DishPrice,
	C.CategoryName
from Menu as M
inner join Dishes D on D.dISHID = M.DishID
inner join Categories C on C.CategoryID = D.CategoryID
where M.OutDate is null or M.OutDate > getdate()

go
```
**allReservations**: 

pokazuje wszystkie dotychczasz zlozone rezerwacje
z rozróżnieniem czy rezerwwacja została wykonana przez firme czy indywidualna jednostke
```
create view allReservations as
select R.ReservationID,
	R.CustomerID,
	R.StartDate,
	'Individual' as Customer,
	YEAR(R.StartDate) as [Year],
	MONTH(R.StartDate) as [Month]
from Reservations R
join IndividualReservations IR
on R.ReservationID = IR.ReservationID

union 

select R.ReservationID,
	R.CustomerID,
	R.StartDate,
	'Company' as Customer,
	YEAR(R.StartDate) as [Year],
	MONTH(R.StartDate) as [Month]
from Reservations R
join CompanyReservations CR
on R.ReservationID = CR.ReservationID
go
```

# Procedury

**uspCheckMenu**:

Wyrzuca dania znajdujące się w aktualnym Menu dłużej niż 2 tygodnie, 
tzn. ustawia ich “OutDate” na równy dacie uruchomienia procedury
```
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
```

**[dbo].[uspInsertCompany]**:

Dodaje firmę o nazwie “companyName” oraz NIPie “NIP” 
z miasta o ID “CityID” do tabeli Company i Customers
```
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
```

**uspInsertPerson**:

Dodaje dane osoby o imieniu “firstname”, nazwisku “lastname”, 
numerze telefonu “phone” i “ID” do tabeli Person

```
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
```

**[dbo].[uspInsertIndividualCustomer]**:

Dodaje klienta o danym imieniu “firstname”, nazwisku “lastname”, 
numerze telefonu “phone” z miasta “CityID” do tabeli IndividualCustomers,
Customers oraz Person
```
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
```

**uspInsertOrderDetailsToOrder**:

--Dodaje szczegóły dotyczące zamówenia o ID “OrderID” tzn. 
--jakie danie oraz w jakiej ilości zamówiono
```
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
```
# Wyzwalacze

**trCheckMenuPositions**:

Uruchamia procedurę “uspCheckMenu” jeśli modyfikujemy tabelę Menu
```
CREATE trigger trCheckMenuPositions
   ON Menu
   AFTER INSERT, UPDATE
   AS
   BEGIN
       SET NOCOUNT ON;
       EXECUTE uspCheckMenu
   END
GO
```

**trMenuOutDate**:

wyrzuca pozycje w menu po dacie "OutDate"

```
CREATE TRIGGER trMenuOutDate
ON Menu
AFTER INSERT, UPDATE
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM Menu
WHERE OutDate < GETDATE() AND OutDate IS NOT NULL
END
GO
```

**trEmployeesDelete**:

przy usuwaniu pracownika, wszyscy jego podwładni są przypisywani do jego zwierzchnika
```
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
```
**trOrdersInsert**:

Przyznaje zniżkę 10% dla danego klienta przy jego 10tym zamówieniu
```
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
```
**trTableReservationsCheck**:

sprawdza czy dany stolik jest już zarezerwowany w danym czasie przed dodaniem nowej rezerwacji
```
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
```
**trReservationCheck**:

sprawdza, czy jest wystarczająco miejsca na daną liczbę osób przy składaniu rezerwacji
```
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
```


