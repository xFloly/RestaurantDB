--funkcja 1
--zwraca top x najlepiej sprzedajacych sie dan

create function udfGetBestSellingDishes(@x int)

returns table as return

select top (@x) * 
from QuantityOfOrderedDishes
order by DishQuantitiy desc

go

--funkcja 2
--zwraca znizke klienta

CREATE FUNCTION udfGetDiscount(@order_id int, @customer_id int)
returns float as
begin
declare @x float;
SET @x = ISNULL((
select DiscountValue
from Discount D
join Orders O on @order_id = O.OrderID
where (D.CustomerID = @customer_id and O.OrderDate >= D.ValidFrom)),0)
return @x
end
go

--funkcja 3
--zwraca wartosc zamowienia
CREATE FUNCTION udfGetOrderPrice(@order_id int)
returns float as
begin
declare @x float;
SET @x = ISNULL((
select CO.[Order Price]
from CustomersOrders CO
where OrderID = @order_id),-1)
return @x
end
go

--funkcja 4
--zwraca pozycje z menu znajdujace sie miedzy okreslonymi wwartosciami
CREATE FUNCTION udfGetMenuPositionsBetween(@x int, @y int)
returns table as
return

select MenuPositionID,
	DishID,
	Name, 
	DishPrice
from allMenu
where allMenu.DishPrice between @x and @y

go
