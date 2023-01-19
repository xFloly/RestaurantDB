--VIEW 1
--wyswietla wszystkie pozycje w menu, które kiedyokolwiek wystąpiły w menu

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

--VIEW 2
--ilosc zamowien na każdy produkt

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



--VIEW 3
--wypisuje w przejrzysty sposób aktualne menu
-- ID, nazwwe, cene i kategorie

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



--VIEW 4
--pokazuje wszystkie dotychczasz zlozone rezerwacje
--z rozróżnieniem czy rezerwwacja została wykonana przez firme czy indywidualna jednostke

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


--VIEW 5
--statystyki zwiazane z rezerwacja danych stolikow

create view allTableStats
as

select T.TableID,
	T.Quantity,
	(select count(1)
	from TableReservations TR
	where T.TableID = TR.TableID) as [Times Used]
from Tables T
group by T.TableID, T.Quantity

go

--view 6
--suma zamowien

create view CustomersOrderSum 
as

select 	C.CustomerID,
	O.OrderID,
	ROUND(SUM(M.DishPrice * OD.Quantity), 2) as [Sum] 
from Customers C
join IndividualCustomers IC on C.CustomerID = IC.CustomerID
join Person P on P.ID = IC.PersonID
join Orders O on C.CustomerID = O.CustomerID
join OrderDetails OD on OD.OrderID = O.OrderID
join Menu M on M.MenuPositionID = OD.MenuPosID
group by c.CustomerID, o.OrderID

union

select 	C.CustomerID,
	O.OrderID,
	ROUND(SUM(M.DishPrice * OD.Quantity), 2) as [Sum]
from Customers C
join Companies Co on C.CustomerID = Co.CustomerID
join Orders O on C.CustomerID = O.CustomerID
join OrderDetails OD on OD.OrderID = O.OrderID
join Menu M on M.MenuPositionID = OD.MenuPosID
group by c.CustomerID, o.OrderID

go

--view 7
--wartosc zamowien z nazwa, cena, czy jest to klient indywidualny czy firma oraz data zamowienia
create view CustomersOrders
as

select O.OrderID,
C.CustomerID,
P.LastName + ' ' + P.FirstName as [Name],
ROUND(SUM(M.DishPrice * Od.Quantity * (1 - ISNULL(dbo.udfGetDiscount(O.OrderID, C.CustomerID), 0))),2) as [Order Price],
O.OrderDate,
'Person' as [Type],
YEAR(O.OrderDate) as [Year],
MONTH(O.OrderDate) as [Month]
from Orders O
join OrderDetails OD on OD.OrderID = o.OrderID
join Menu M on M.MenuPositionID = OD.MenuPosID
join Customers C on C.CustomerID = O.CustomerID
join IndividualCustomers IC on C.CustomerID = IC.CustomerID
join Person P on P.ID = IC.PersonID

group by O.OrderID, C.CustomerID, P.LastName + ' ' + P.FirstName, O.OrderDate

union 

select O.OrderID,
C.CustomerID,
Co.CompanyName as [Name],
ROUND(SUM(M.DishPrice * Od.Quantity * (1 - ISNULL(dbo.udfGetDiscount(O.OrderID, C.CustomerID), 0))),2) as [Order Price],
O.OrderDate,
'Company' as [Type],
YEAR(O.OrderDate) as [Year],
MONTH(O.OrderDate) as [Month]
from Orders O
join OrderDetails OD on OD.OrderID = o.OrderID
join Menu M on M.MenuPositionID = OD.MenuPosID
join Customers C on C.CustomerID = O.CustomerID
join Companies Co on Co.CustomerID = C.CustomerID

group by O.OrderID, C.CustomerID, Co.CompanyName, O.OrderDate

go

--view 8
--ilosc zamowien wykonanych przez klienta z rozroznieniem czy jest to firma czy indywidualna jednostka
create view amountOfOrders
as

select  C.CustomerID,
P.LastName + ' ' + P.FirstName as [Name],
count(O.OrderID) as Amount,
'Person' as [Type]
from Orders O
join OrderDetails OD on OD.OrderID = o.OrderID
join Menu M on M.MenuPositionID = OD.MenuPosID
join Customers C on C.CustomerID = O.CustomerID
join IndividualCustomers IC on C.CustomerID = IC.CustomerID
join Person P on P.ID = IC.PersonID

group by O.OrderID, C.CustomerID, P.LastName + ' ' + P.FirstName, O.OrderDate

union 

select C.CustomerID,
Co.CompanyName as [Name],
count(O.OrderID) as Amount,
'Company' as [Type]
from Orders O
join OrderDetails OD on OD.OrderID = o.OrderID
join Menu M on M.MenuPositionID = OD.MenuPosID
join Customers C on C.CustomerID = O.CustomerID
join Companies Co on Co.CustomerID = C.CustomerID

group by O.OrderID, C.CustomerID, Co.CompanyName, O.OrderDate

go

--view 9
--wyswietla informacje dot. dostawcow
create view suppliersInfo
as

select S.SupplierID, 
	S.SupplierName,
	C.CityName,
	Cou.Country,
	s.Email,
	S.Phone,
	count(*) as [amountOfProductsShipped]
from Suppliers S
join Products P on P.SupplierID = S.SupplierID
join City C on C.CityID = S.Location
join Countries Cou on Cou.ID = C.CountryID

group by S.SupplierID, S.SupplierName, C.CityName, Cou.Country, s.Email, s.Phone

go
