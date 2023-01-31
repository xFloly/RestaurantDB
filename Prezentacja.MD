# Projek baz danych restauracji

## Założenia

Baza danych restauracji umozliwia łatwy urzytkownikowi do kontroli nad płatnosciami oraz dokonanymi zamóieniami. 

## Schemat pielęgnacji bazy danych

Pielęgnacja bazy danych restauracji powinna obejmować następujące kroki:

Regularne backupowanie bazy danych: Aby uniknąć utraty danych w przypadku awarii systemu lub innych problemów technicznych, należy regularnie tworzyć kopie zapasowe bazy danych i przechowywać je na bezpiecznym dysku lub w chmurze.

Czyszczenie i archiwizacja danych: Regularnie należy czyścić bazę danych, usuwając niepotrzebne dane, takie jak stare rezerwacje lub zamówienia. Dane, które nie są już potrzebne, powinny być archiwizowane, aby nie zajmowały miejsca na serwerze.

## Diagram Bazy



## Tabele

![Tabelki1](https://user-images.githubusercontent.com/101994826/215623823-5bc9791e-b6fd-48d3-b2db-a4420b264c40.png)
![Tabelki2](https://user-images.githubusercontent.com/101994826/215623833-4dd1a044-8ff2-4c19-a003-f556e127bcf4.png)

## Indeksy
**Categories_pk**: ustawienie indeksu na CategoryID w Categories
```
create unique index Categories_pk
on Categories(CategoryID)
go
```
**Dishes_pk**: ustawienie indeksu na DishID w Dishes
```
create unique index Dishes_pk
on Dishes(DishID)
go
```
**Menu_pk**: ustawienie indeksu na MenuPositionID w Menu 
```
create unique index Menu_pk
on Menu(MenuPositionID)
go
```
**Orders_pk**: ustawienie indeksu na OrderID w Orders
```
create unique index Orders_pk
on Orders(OrderID)
go
```
**Customers_pk**: ustawienie indeksu na CustomerID w Customers
```
create unique index Customers_pk
on Customers(CustomerID)
go
```
## Typowe zapytania

Typowe zapytania realizowane są w formie widoków oraz funkcji.

## Widoki

**allMenu**: wyświetla wszystie pozycje, które kiedykolwiek wytąpiły w Menu
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
**QuantityOfOrderedDishes**: wyświetla ilość zamówień na każdy produkt
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
**CurrentMenu**: wypisuje w przejrzysty sposób aktualne menu: ID, nazwe dania, cene i kategorie
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

