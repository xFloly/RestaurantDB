Create Database Restaurant
----------------------------------------------------
go 
create function dbo.CheckFunction	(
	@var INT
	)
returns int
as begin
  IF EXISTS (Select CategoryID from Employees E where CategoryID = @var)
	return 1	 
  return 0
end;

-----------------------------------------------------
Create Table Categories (
	CategoryID int not null,
	CategoryName nvarchar(256) not null, 
	constraint PK_Categories primary key (CategoryID),
	constraint UQ_Categories unique (CategoryName)
)

Create table Dishes (
	DishID int not null,
	Name nvarchar(256) not null,
	CategoryID int not null,
	constraint PK_Dishes Primary Key (DishID),
	constraint FK_CategoryID_TO_Categories foreign Key (CategoryID) references Categories(CategoryID),
	constraint UQ_Name unique (Name)
)

create table Menu (
	MenuPositionID int not null,
	DishID int not null,
	DishPrice money not null,
	InDate datetime not null,
	OutDate datetime null,
	constraint PK_Menu Primary Key (MenuPositionID),
	constraint FK_DishID_TO_Dishes foreign key (DishID) references Dishes(DishID),
	constraint CK_OutDate check (OutDate is null or OutDate > InDate),
	constraint CK_DishPrice check (DishPrice > 0)
)

Create Table Countries (
	CountryID int not null,
	Country nvarchar(256) not null,
	constraint PK_Countries Primary Key (CountryID),
	constraint UQ_Countries unique (Country)
)

Create Table City (
	CityID int not null,
	CityName nvarchar(256) not null,
	CountryID int not null,
	constraint PK_City Primary Key (CityID),
	constraint UQ_CityName unique (CityName),
	constraint FK_CountryID_TO_Countries Foreign Key (CountryID) references Countries(CountryID)
)

Create Table Customers (
	CustomerID int not null, 
	CityID int not null,
	Constraint PK_Customers Primary Key (CustomerID),
	constraint FK_CityID_To_Cities Foreign Key (CityID) references City(CityID)
)

Create table Companies (
	CustomerID int not null,
	CompanyName nvarchar(256) not null,
	NIP nvarchar(256) not null,
	Constraint PK_Companies Primary Key (CustomerID),
	Constraint FK_CustomerID_TO_Customers2 Foreign Key (CustomerID) references Customers(CustomerID),
	Constraint CK_NIP Check (isNumeric(NIP) = 1),
	Constraint UQ_NIP Unique (NIP),
	constraint UQ_CompanyName unique (CompanyName)
)

Create Table Person (
	PerosnID int not null,
	FirstName nvarchar(256) not null,
	LastName nvarchar(256) not null, 
	Phone nvarchar(256) not null,
	Constraint PK_Person Primary Key (PerosnID),
	Constraint CK_Phone Check (Phone like '[1-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')
)

Create Table IndividualCustomers (
	CustomerID int not null,
	PersonID int not null,
	Constraint PK_IndividualCustomers Primary Key (CustomerID),
	Constraint FK_PersonID_TO_Person Foreign Key (PersonID) references Person(PerosnID),
	Constraint FK_CustomerID_TO_Customers Foreign Key (CustomerID) references Customers(CustomerID)
)

Create Table Reservations (
	ReservationID int not null, 
	CustomerID int not null, 
	StartDate datetime not null,
	EndDate datetime not null,
	ReservationDate datetime not null,
	Constraint PK_Reservations Primary Key (ReservationID),
	Constraint FK_CustomerID_TO_Customers3 Foreign Key (CustomerID) references Customers(CustomerID),
	Constraint CK_StartDate check (StartDate >= ReservationDate),
	Constraint CK_EndDate check ([EndDate] > [StartDate] AND datepart(year,[EndDate]) = datepart(year, [StartDate]) AND
    datepart(month, [EndDate]) = datepart(month, [StartDate]) AND datepart(day, [EndDate]) = datepart(day,[StartDate]))
)

Create Table CompanyReservations (
	ReservationID int not null, 
	CustomerID int not null,
	NumberOfPeople int not null,
	FirstName nvarchar(256) not null,
	LastName nvarchar(256) not null,
	Constraint PK_CompanyReservations Primary Key (ReservationID),
	Constraint FK_ReservationID_TO_Reservations Foreign Key (ReservationID) references Reservations(ReservationID),
	Constraint FK_CustomerID_TO_Customers4 Foreign Key (CustomerID) references Customers(CustomerID),
	Constraint CK_NumberOfPeople Check (NumberOfPeople > 0)
)


Create Table [Tables] (
	TableID int not null, 
	Quantity int not null,
	Constraint PK_Tables Primary Key (TableID),
	Constraint CK_Quantity2 Check (Quantity > 0)
)

Create Table ReservationDetails (
	ReservationID int not null,
	TableID int not null,
	Constraint PK_ReservationDetails Primary Key (ReservationID, TableID),
	Constraint FK_ReservationID_TO_Reservations3 Foreign Key (ReservationID) references Reservations(ReservationID),
	Constraint FK_TableID_TO_Tables2 Foreign Key (TableID) references Tables(TableID)
)

Create Table TableReservations (
	TableReservationID int not null,
	TableID int not null, 
	TableReservationStart datetime not null,
	TableReservationEnd datetime not null, 
	Constraint PK_TableReservations Primary Key (TableReservationID),
	Constraint FK_TableID_TO_Tables3 Foreign Key (TableID) references Tables(TableID),
	Constraint CK_TableReservationEnd Check (TableReservationEnd > TableReservationStart AND 
	datepart(year,TableReservationEnd) = datepart(year, TableReservationStart) AND
    datepart(month, TableReservationEnd) = datepart(month, TableReservationStart) AND 
	datepart(day, TableReservationEnd) = datepart(day,TableReservationStart))
)

Create Table Discount (
	DiscountID int not null,
	CustomerID int not null,
	ValidFrom datetime not null, 
	ValidTo datetime null,
	DiscountValue real not null,
	Constraint PK_Discount Primary Key (DiscountID),
	Constraint FK_CustomerID_TO_Customers6 Foreign Key (CustomerID) references Customers(CustomerID),
	Constraint CK_ValidTo Check (ValidFrom < ValidTo OR ValidFrom is null),
	Constraint CK_DiscountValue Check (DiscountValue > 0 AND DiscountValue < 1)
)

Create Table EmployeesCategory (
	CategoryID int not null,
	CategoryName nvarchar(256) not null,
	Constraint PK_EmployeesCategory Primary Key (CategoryID),
	Constraint UQ_CategoryName Unique (CategoryName)
)

 Create Table Employees (
	EmployeeID int not null,
	PersonID int not null, 
	CategoryID int not null,
	ReportsTo int null,
	Constraint PK_Employees Primary Key (EmployeeID),
	Constraint FK_PersonID_TO_Person2 foreign Key (PersonID) references Person(PerosnID),
	Constraint FK_ReportsTo_TO_Employees foreign Key (ReportsTo) references Employees(EmployeeID),
	Constraint CK_ReportsTO Check (ReportsTO <> EmployeeID OR ReportsTo is null),
	Constraint FK_CategoryID_TO_EmployeesCategory foreign Key (CategoryID) references EmployeesCategory(CategoryID)
)


create table Orders	(
	OrderID int not null,
	EmployeeID int not null,
	CustomerID int not null,
	OrderDate datetime not null,
	PaidDate datetime not null,
	Constraint PK_Orders Primary Key (OrderID),
	Constraint FK_EmployeeID_TO_Employees Foreign Key (EmployeeID) references Employees(EmployeeID),
	Constraint FK_CustomerID_TO_Customers7 Foreign Key (CustomerID) references Customers(CustomerID),
	Constraint CK_OutDate2 check (PaidDate > OrderDate),
	Constraint CK_EmployeeCategory Check (dbo.CheckFunction(3) = 1)
)

Create Table IndividualReservations (
	ReservationID int not null,
	CustomerID int not null, 
	OrderID int not null,
	NumberOfPeople int not null,
	TableID int not null,
	Constraint PK_IndividualReservations Primary Key (ReservationID),
	Constraint FK_ReservationID_TO_Reservations2 Foreign Key (ReservationID) references Reservations(ReservationID),
	Constraint FK_CustomerID_TO_Customers5 Foreign Key (CustomerID) references Customers(CustomerID),
	Constraint CK_NumberOfPeople2 Check (NumberOfPeople > 0),
	Constraint FK_OrderID_TO_Orders2 Foreign Key (OrderID) references Orders(OrderID),
	Constraint FK_TableID_TO_Tables Foreign Key (TableID) references Tables(TableID)
)


Create Table OrderDetails (
	OrderID int not null,
	DishID int not null, 
	MenuPosID int not null,
	Quantity int not null,
	OrderDetailsID int not null
	constraint PK_OrderDetails primary key (OrderDetailsID),
	constraint FK_MenuPosID_TO_Menu foreign key (MenuPosID) references Menu(MenuPositionID),
        constraint FK_OrderDetails_TO_Orders foreign key (OrderID) references Orders(OrderID),
	constraint CK_Quantity check (Quantity > 0)
)

Create table Administrators (
	AdminID int not null,
	FirstName nvarchar(256) not null,
	LastName nvarchar(256) not null,
	Email nvarchar(256) not null,
	Constraint PK_Administrators Primary Key (AdminID),
	Constraint CK_Email Check (Email like '%@%')
)

Create Table Suppliers (
	SupplierID nvarchar(4) not null,
	SupplierName nvarchar(256) not null,
	Location int not null,
	Email nvarchar (256) not null,
	Phone nvarchar(256) not null,
	Constraint PK_SuppliersDetails Primary Key (SupplierID),
	Constraint UQ_SupplierName unique (SupplierName),
	Constraint FK_Location_TO_City Foreign Key (Location) references City(CityID),
	Constraint CK_Email2 Check (Email like '%@%'),
	Constraint CK_Phone2 Check (Phone like '[1-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')
)

Create Table ProductsCategory (
	CategoryID int not null,
	CategoryName nvarchar(256) not null,
	Constraint PK_ProductsCategory Primary Key (CategoryID),
	Constraint UQ_CategoryName2 Unique (CategoryName)
)

Create Table Products (
	ProductID int not null,
	ProductName nvarchar(256) not null,
	CategoryID int not null,
	SupplierID nvarchar(4) not null,
	UnitPrice int not null,
	EmployeeID int not null,
	Constraint PK_Products Primary Key (ProductID),
	Constraint UQ_ProductName unique (ProductName),
	Constraint FK_CategoryID_TO_ProductsCategory Foreign Key (CategoryID) references ProductsCategory(CategoryID),
	Constraint FK_SupplierID_TO_Suppliers Foreign Key (SupplierID) references Suppliers(SupplierID),
	Constraint CK_UnitPrice Check (UnitPrice > 0),
	Constraint FK_EmployeeID_from_Employees2 Foreign Key (EmployeeID) references Employees(EmployeeID),
	Constraint CK_EmployeeID Check (dbo.CheckFunction(2) = 1) 
)
