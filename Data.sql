Insert into Categories Values 
	(1,'Przystawki'),
	(2,'Zupy'),
	(3,'Dania Główne'),
	(4,'Desery'),
	(5,'Dodatki'),
	(6,'Napoje') 

Insert into Dishes Values
	(1,'Roladki z łososia',1),
	(2,'Tatar wołowy',1),
	(3,'Grillowane Szparagi z serem',1),
	(4,'Bruschetta z pomidorami',1),
	(5,'Krem Serowy',2),
	(6,'Rosół z makaronem',2),
	(7,'Krem z Buraka',2),
	(8,'Kurczak Grillowany',3),
	(9,'Pierś z Kaczki',3),
	(10,'Udziec Jagnięcy',3),
	(11,'Policzki Wołowe',3),
	(12,'Stek Wołowy',3),
	(13,'Sernik',4),
	(14,'Fondant',4),
	(15,'Ziemniaki',5),
	(16,'Ryż',5),
	(17,'Frytki',5),
	(18,'Woda Mineralna',6),
	(19,'Napoje Zimne(Pepsi,Mirinda,Sok Owowcowy)',6),
	(20,'Piwo lane',6)
	
Insert into Person Values
	(1,'Marek','Nowak','506-230-142'),
	(2,'Marcin','Wilk','546-131-647'),
	(3,'Kamil','Ślimak','827-525-123'),
	(4,'Jakub','Jajko','890-123-523'),
	(5,'Franek','Brodacz','213-412-456'),
	(6,'Karol','Skorpion','424-525-123'),
	(7,'Filip','Uposiowski','505-524-521'),
	(8,'Agnieszka','Twarzowska','312-424-121'),
	(9,'Aleksandra','Ptak','942-231-421'),
	(10,'Milena','Pytała','312-567-321'),
	(11,'Nikola','Ola','496-512-789')

Insert into EmployeesCategory Values 
	(1,'Menadżerowie'),
	(2,'Logistyka'),
	(3,'Kelnerzy'),
	(4,'Kuchnia')

Insert into Employees Values
	(1,6,1,null),
	(2,1,2,1),
	(3,3,2,2),
	(4,11,2,2),
	(5,10,3,1),
	(6,9,3,10),
	(7,5,3,10),
	(8,8,3,7),
	(9,2,4,1),
	(10,4,4,2),
	(11,7,4,2)

Insert into Menu Values	
	(1,1,20,'2021-09-10',null),
	(2,2,23,'2020-04-03','2021-05-05'),
	(3,2,27,'2021-05-05',null),
	(4,3,18,'2020-04-03',null),
	(5,4,15,'2020-04-03','2021-05-05'),
	(6,4,18,'2021-05-05',null),
	(7,5,19,'2020-04-03','2022-01-01'),
	(8,5,22,'2022-01-01',null),
	(9,6,20,'2021-05-05',null),
	(10,7,22,'2022-01-01',null),
	(11,8,28,'2020-04-03','2021-02-03'),
	(12,9,32,'2021-02-03','2022-01-01'),
	(13,9,35,'2022-01-01',null),
	(14,10,30,'2022-01-01',null),
	(15,11,29,'2020-03-04','2022-01-01'),
	(16,11,32,'2022-01-01',null),
	(17,12,40,'2020-03-04','2021-05-04'),
	(18,12,49,'2021-05-04',null),
	(19,13,15,'2021-01-01',null),
	(20,14,17,'2021-01-01',null),
	(21,15,10,'2020-03-04','2022-01-01'),
	(22,15,12,'2022-01-01',null),
	(23,16,12,'2020-03-04','2022-01-01'),
	(24,16,14,'2022-01-01',null),
	(25,17,13,'2021-05-01','2022-04-04'),
	(26,17,15,'2022-04-04',null),
	(27,18,7,'2020-03-04',null),
	(28,19,8,'2020-03-04','2021-02-02'),
	(29,19,9,'2021-02-02','2022-03-03'),
	(30,19,10,'2022-03-03',null),
	(31,20,12,'2022-05-05',null)

Insert into Countries Values	
	(1,'Polska'),
	(2,'Niemcy'),
	(3,'Francja'),
	(4,'Czechy')


Insert into City Values		
	(1,'Warszawa',1),
	(2,'Krakow',1),
	(3,'Gdansk',1),
	(4,'Poznan',1),
	(5,'Wrocław',1),
	(6,'Berlin',2),
	(7,'Monachium',2),
	(8,'Drezno',2),
	(9,'Paryż',3),
	(10,'Lyon',3),
	(11,'Praga',4)

Insert into Customers Values
	(1,1), (2,1), (3,1), (4,1), (5,2), (6,2),
	(7,2), (8,3), (9,3), (10,4), (11,4), (12,4),
	(13,5), (14,5), (15,6), (16,6), (17,7), (18,7),
	(19,8), (20,9), (21,9), (22,10), (23,11), (24,11),
	(25,1), (26,1), (27,3), (28,5), (29,2), (30,4)

Insert into Companies Values
	(1,'Blachotrapez','6762431730'),
	(4,'Krawiec Bartek','857305918'),
	(5,'Plast-Met','9370924525'),
	(7,'Kurniki u Grzesia','4958176425'),
	(10,'Browar Piwnica','9502857218'),
	(14,'TPC Polska','9276216482'),
	(20,'Leroy Merlin Paris','9124757287'),
	(17,'Bayerische Motoren Werke AG','2879490193'),
	(16,'Niemieckie Termosy','2747916742'),
	(8,'CCC','4379742911')


Insert into Person Values 
	(12,'Eleonora','Kamińska','728-492-193'),
	(13,'Kornelia','Kwiatkowska','930-315-256'),
	(14,'Alana ','Przybylska','502-212-136'),
	(15,'Maria ','Kołodziej','252-526-241'),
	(16,'Konstancja','Kowalczyk','512-123-663'),
	(17,'Anita','Sawicka','124-485-552'),
	(18,'Ewelina ','Krawczyk','555-555-555'),
	(19,'Dagmara','Kowalska','777-532-177'),
	(20,'Józefa ','Kozłowska','245-515-234'),
	(21,'Izabela ','Górska','788-522-777'),
	(22,'Mariusz','Baran','505-525-325'),
	(23,'Kazimierz','Górski','510-510-510'),
	(24,'Ernest ','Baran','666-666-666'),
	(25,'Mikołaj  ','Kołodziej','692-137-420'),
	(26,'Albert ','Cieślak','252-241-500'),
	(27,'Robert ','Malinowski','680-636-324'),
	(28,'Filip  ','Ostrowski','512-442-666'),
	(29,'Kuba','Sawicki','213-525-666'),
	(30,'Dominik','Urbańska','511-522-533'),
	(31,'Kajetan','Górski','734-690-521')

Insert into IndividualCustomers Values	
	(2,12),(3,13),(6,14),(9,15),(11,16),(12,17),
	(13,18),(15,19),(18,20),(19,21),(21,22),(22,23),
	(23,24),(24,25),(25,26),(26,27),(27,28),(28,29),
	(29,30),(30,31)

Insert into REservations Values 
	(1,1,'2022-02-20 19:00', '2022-02-20 21:00','2022-02-20 11:00'),
	(2,2,'2021-03-12 20:20', '2021-03-12 21:20','2021-03-12 18:20'),
	(3,3,'2020-07-12 21:00', '2020-07-12 23:00','2020-07-12 13:00'),
	(4,4,'2021-04-11 22:30', '2021-04-11 23:30','2021-04-11 13:30'),
	(5,5,'2021-05-13 14:40', '2021-05-13 16:40','2021-05-13 11:40'),
	(6,6,'2021-06-15 15:50', '2021-06-15 17:50','2021-06-14 17:50'),
	(7,7,'2022-07-16 16:10', '2022-07-16 17:40','2022-07-13 17:40'),
	(8,8,'2022-08-17 17:20','2022-08-17 17:40','2022-08-16 17:40'),
	(9,9,'2020-09-18 21:52', '2020-09-18 23:52','2020-09-18 14:00'),
	(10,10,'2020-10-19 12:23', '2020-10-19 19:23','2020-10-18 10:00'),
	(11,11,'2021-11-20 13:50', '2021-11-20 16:50','2021-11-20 10:00'),
	(12,12,'2022-12-01 21:10', '2022-12-01 22:10','2022-12-01 10:00'),
	(13,13,'2021-01-02 20:20', '2021-01-02 22:20','2021-01-02 11:00'),
	(14,14,'2021-02-03 20:30', '2021-02-03 22:30','2021-02-03 15:00'),
	(15,15,'2021-03-04 20:40', '2021-03-04 21:30','2021-03-03 15:00'),
	(16,16,'2020-09-05 19:50', '2020-09-05 21:50','2020-09-04 15:00'),
	(17,17,'2020-10-06 18:10', '2020-10-06 20:30','2020-10-05 15:00'),
	(18,18,'2020-11-07 17:20', '2020-11-07 19:30','2020-11-05 15:00'),
	(19,19,'2020-12-08 16:30', '2020-12-08 17:30','2020-12-08 11:00'),
	(20,20,'2022-06-09 15:40', '2022-06-09 17:40','2022-06-09 10:00'),
	(21,21,'2022-07-10 14:50', '2022-07-10 16:50','2022-07-07 15:00'),
	(22,22,'2022-08-11 13:10', '2022-08-11 16:10','2022-08-11 12:00'),
	(23,23,'2022-09-01 12:20', '2022-09-01 22:20','2022-09-01 12:00'),
	(24,24,'2021-10-02 23:30', '2021-10-02 23:59','2021-10-02 16:00'),
	(25,25,'2021-02-03 22:40', '2021-02-03 23:40','2021-02-03 19:00'),
	(26,26,'2021-02-04 21:55', '2021-02-04 23:55','2021-02-03 15:00'),
	(27,27,'2021-04-05 20:12', '2021-04-05 22:12','2021-04-04 15:00'),
	(28,28,'2022-07-06 19:14', '2022-07-06 21:14','2022-07-02 15:00'),
	(29,29,'2022-01-07 18:15', '2022-01-07 19:45','2022-01-02 15:00'),
	(30,30,'2021-06-25 17:42', '2021-06-25 23:42','2021-06-25 10:00'),
	(31,5,'2021-01-26 21:12', '2021-01-26 23:12','2021-01-26 10:00'),
	(32,9,'2021-07-27 21:25', '2021-07-27 23:25','2021-07-27 10:00'),
	(33,11,'2020-11-28 22:12', '2020-11-28 23:12','2020-11-28 13:00'),
	(34,15,'2020-08-29 22:52', '2020-08-29 23:52','2020-08-29 16:00'),
	(35,16,'2020-02-20 23:12', '2020-02-20 23:59','2020-02-20 15:00'),
	(36,1,'2022-08-31 23:00', '2022-08-31 23:45','2022-08-31 15:00'),
	(37,2,'2022-02-01 20:20', '2022-02-01 23:20','2022-02-01 15:00'),
	(38,3,'2022-01-02 20:20','2022-01-02 23:20','2022-01-02 15:00'),
	(39,11,'2021-08-22 18:23', '2021-08-22 23:00','2021-02-02 15:00'),
	(40,9,'2021-10-12 19:23', '2021-10-12 21:23','2021-10-12 15:50')

Insert into CompanyReservations Values 
	(1,1,5,'Marek','Kowal'), 
	(36,1,10,'Marek','Kowal'), 
	(4,4,8,'Leszek','Maniek'), 
	(5,5,5,'Kamil','Wojciechowski'), 
	(31,5,9,'Krzysztof','Kaźmierczak'),
	(7,7,15,'Aleks','Wojciechowski'), 
	(8,8,10,'Leszek ','Kwiatkowski'), 
	(10,10,5,'Robert','Lis'), 
	(14,14,4,'Józef','Marciniak'), 
	(16,16,7,'Bolesław ','Czarnecki'), 
	(35,16,13,'Julian ','Zalewski'), 
	(17,17,12,'Heronim','Baran'), 
	(20,20,15,'Ignacy','Dąbrowski')

Insert into [tables] Values
	(1,4),(2,6),(3,6),(4,6),(5,2),(6,2),(7,2),(8,10),(9,4),(10,4)

Insert into ReservationDetails Values
	(1,4),(4,8),(5,3),(7,8),(7,4),(8,8),(10,2),(14,1),(16,9),
	(16,10),(17,3),(17,4),(20,8),(20,2),(31,8),(35,2),
	(35,9),(35,10),(36,8)

Insert into Discount Values		
	(1,2,'2021-03-01',null,0.2),
	(2,3,'2020-03-04','2021-03-04',0.3),
	(3,6,'2021-06-15',null,0.1),
	(4,9,'2021-03-04','2022-01-01',0.05),
	(5,11,'2021-11-20','2021-11-21',0.5)

Insert into Orders Values 
	(1,5,1,'2022-02-20 19:00', '2022-02-20 21:00'),
	(2,5,2,'2021-03-12 20:20', '2021-03-12 21:20'),
	(3,6,3,'2020-07-12 21:00', '2020-07-12 23:00'),
	(4,6,4,'2021-04-11 22:30', '2021-04-11 23:30'),
	(5,6,5, '2021-05-13 14:40', '2021-05-13 16:40'),
	(6,6,6,'2021-06-15 15:50', '2021-06-15 17:50'),
	(7,7,7,'2022-07-16 16:10', '2022-07-16 17:40'),
	(8,8,8,'2022-08-17 17:20','2022-08-17 17:40'),
	(9,7,9,'2020-09-18 21:52', '2020-09-18 23:52'), 
	(10,7,10,'2020-10-19 12:23', '2020-10-19 19:23'),
	(11,7,11,'2021-11-20 13:50', '2021-11-20 16:50'),
	(12,7,12,'2022-12-01 21:10', '2022-12-01 22:10'),
	(13,5,13,'2021-01-02 20:20', '2021-01-02 22:20'),
	(14,5,14,'2021-02-03 20:30', '2021-02-03 22:30'),
	(15,5,15,'2021-03-04 20:40', '2021-03-04 21:30'),
	(16,5,16,'2020-09-05 19:50', '2020-09-05 21:50'), 
	(17,5,17,'2020-10-06 18:10', '2020-10-06 20:30'), 
	(18,5,18,'2020-11-07 17:20', '2020-11-07 19:30'), 
	(19,5,19,'2020-12-08 16:30', '2020-12-08 17:30'), 
	(20,6,20,'2022-06-09 15:40', '2022-06-09 17:40'), 
	(21,8,21,'2022-07-10 14:50', '2022-07-10 16:50'), 
	(22,8,22,'2022-08-11 13:10', '2022-08-11 16:10'), 
	(23,8,23,'2022-09-01 12:20', '2022-09-01 22:20'), 
	(24,8,24,'2021-10-02 23:30', '2021-10-02 23:59'),
	(25,8,25,'2021-02-03 22:40', '2021-02-03 23:40'), 
	(26,8,26,'2021-02-04 21:55', '2021-02-04 23:55'),
	(27,6,27,'2021-04-05 20:12', '2021-04-05 22:12'),
	(28,7,28,'2022-07-06 19:14', '2022-07-06 21:14'), 
	(29,7,29,'2022-01-07 18:15', '2022-01-07 19:45'),
	(30,7,30,'2021-06-25 17:42', '2021-06-25 23:42'), 
	(31,7,5,'2021-01-26 21:12', '2021-01-26 23:12'), 
	(32,7,9,'2021-07-27 21:25', '2021-07-27 23:25'), 
	(33,6,11,'2020-11-28 22:12', '2020-11-28 23:12'), 
	(34,6,15,'2020-08-29 22:52', '2020-08-29 23:52'), 
	(35,6,16,'2020-02-20 23:12', '2020-02-20 23:59'), 
	(36,8,1,'2022-08-31 23:00', '2022-08-31 23:45'),
	(37,8,2,'2022-02-01 20:20', '2022-02-01 23:20'), 
	(38,8,3,'2022-01-02 20:20','2022-01-02 23:20'),
	(39,5,11,'2021-08-22 18:23', '2021-08-22 23:00'), 
	(40,7,9,'2021-09-12 19:23', '2021-09-12 21:23'),
	(41,8,30,'2021-06-23 17:42', '2021-06-23 23:42'), 
	(42,6,5,'2021-01-21 21:12', '2021-01-21 23:12'), 
	(43,5,9,'2021-07-21 21:25', '2021-07-21 23:25'), 
	(44,6,11,'2020-11-21 22:12', '2020-11-21 23:12'), 
	(45,6,15,'2020-08-21 22:52', '2020-08-21 23:52'), 
	(46,6,16,'2020-02-21 23:12', '2020-02-21 23:59'), 
	(47,7,1,'2022-08-01 23:00', '2022-08-01 23:45'),
	(48,7,2,'2022-02-02 20:20', '2022-02-02 23:20'), 
	(49,8,3,'2021-01-02 20:20','2021-01-02 23:20'),
	(50,5,11,'2020-08-22 18:23', '2020-08-22 23:00')

Insert into IndividualReservations  Values 
	(2,2,2,2,5),(3,3,3,3,1),(6,6,2,5,2),(9,9,9,5,2),(11,11,11,6,3),
	(12,12,12,5,3),(13,13,13,2,4),(15,15,15,6,4),(18,18,18,2,5),(19,19,19,2,5),
	(21,21,21,2,6),(22,22,22,2,7),(23,23,23,2,6),(24,24,24,2,7),(25,25,25,2,6),
	(26,26,26,2,5),(27,27,27,2,7),(28,28,28,4,9),(29,29,29,4,10),(30,30,30,4,9),
	(32,9,32,2,5),(33,11,33,3,1),(34,15,34,2,5),(37,2,37,7,8),(38,3,38,4,10),
	(39,11,39,8,10),(40,9,40,2,5)

Insert into TableReservations  Values 
	(1,4,'2022-02-20 19:00', '2022-02-20 21:00'),
	(2,5,'2021-03-12 20:20', '2021-03-12 21:20'),
	(3,1,'2020-07-12 21:00', '2020-07-12 23:00'),
	(4,8,'2021-04-11 22:30', '2021-04-11 23:30'),
	(5,3, '2021-05-13 14:40', '2021-05-13 16:40'),
	(6,2,'2021-06-15 15:50', '2021-06-15 17:50'),
	(7,4,'2022-07-16 16:10', '2022-07-16 17:40'),
	(41,8,'2022-07-16 16:10', '2022-07-16 17:40'),
	(8,8,'2022-08-17 17:20','2022-08-17 17:40'),
	(9,2,'2020-09-18 21:52', '2020-09-18 23:52'), 
	(10,2,'2020-10-19 12:23', '2020-10-19 19:23'),
	(11,3,'2021-11-20 13:50', '2021-11-20 16:50'),
	(12,3,'2022-12-01 21:10', '2022-12-01 22:10'),
	(13,4,'2021-01-02 20:20', '2021-01-02 22:20'),
	(14,1,'2021-02-03 20:30', '2021-02-03 22:30'),
	(15,4,'2021-03-04 20:40', '2021-03-04 21:30'),
	(16,9,'2020-09-05 19:50', '2020-09-05 21:50'), 
	(42,10,'2020-09-05 19:50', '2020-09-05 21:50'), 
	(17,3,'2020-10-06 18:10', '2020-10-06 20:30'),
	(43,4,'2020-10-06 18:10', '2020-10-06 20:30'),  
	(18,5,'2020-11-07 17:20', '2020-11-07 19:30'), 
	(19,5,'2020-12-08 16:30', '2020-12-08 17:30'), 
	(20,2,'2022-06-09 15:40', '2022-06-09 17:40'), 
	(44,8,'2022-06-09 15:40', '2022-06-09 17:40'), 
	(21,6,'2022-07-10 14:50', '2022-07-10 16:50'), 
	(22,7,'2022-08-11 13:10', '2022-08-11 16:10'), 
	(23,6,'2022-09-01 12:20', '2022-09-01 22:20'), 
	(24,7,'2021-10-02 23:30', '2021-10-02 23:59'),
	(25,6,'2021-02-03 22:40', '2021-02-03 23:40'), 
	(26,5,'2021-02-04 21:55', '2021-02-04 23:55'),
	(27,7,'2021-04-05 20:12', '2021-04-05 22:12'),
	(28,9,'2022-07-06 19:14', '2022-07-06 21:14'), 
	(29,10,'2022-01-07 18:15', '2022-01-07 19:45'),
	(30,9,'2021-06-25 17:42', '2021-06-25 23:42'), 
	(31,8,'2021-01-26 21:12', '2021-01-26 23:12'), 
	(32,5,'2021-07-27 21:25', '2021-07-27 23:25'), 
	(33,1,'2020-11-28 22:12', '2020-11-28 23:12'), 
	(34,5,'2020-08-29 22:52', '2020-08-29 23:52'), 
	(35,2,'2020-02-20 23:12', '2020-02-20 23:59'), 
	(45,9,'2020-02-20 23:12', '2020-02-20 23:59'), 
	(46,10,'2020-02-20 23:12', '2020-02-20 23:59'), 
	(36,8,'2022-08-31 23:00', '2022-08-31 23:45'),
	(37,8,'2022-02-01 20:20', '2022-02-01 23:20'), 
	(38,10,'2022-01-02 20:20','2022-01-02 23:20'),
	(39,10,'2021-08-22 18:23', '2021-08-22 23:00'), 
	(40,5,'2021-09-12 19:23', '2021-09-12 21:23')

Insert into Administrators Values	
	(1,'Karol','Skorpion','Skorpiono@gmail.com'),
	(2,'Marek','Nowak','Marek@Nowak.com'),
	(3,'Marcin','Wilk','fggwwgw@gmail.com'),
	(4,'Milena','Pytala','gwesges@rffwf.com')

Insert into Suppliers Values 
	('BIED','Biedronka',1,'Biedronka@support.com','842-421-152'),
	('LIDL','Lidl',6,'Lidl@support.com','424-145-521'),
	('MARC','Rzeznia u Marcina',4,'Rzeznia@Marcin.com','231-421-152'),
	('WJTK','Piekarnia u Wojtka',3,'Wojtek@bulka.com','222-321-534'),
	('CIAH','Cukiernia ciastko',5,'Ciacho@ponczek.com','345-888-788'),
	('OK','Rzeznia Wroclaw',5,'Rzeznia@ok.com','755-421-525'),
	('SAD','Sad W Polu',9,'SAD@DAS.com','842-666-666'),
	('SZKL','Szklarnia w Elblągu',10,'Szklarnia@Lyon.com','532-123-152'),
	('KSZS','Browar u Krzycha',11,'Krzychu@Krzyś.com','523-422-525'),
	('KARO','Łowisko w Rypinie',1,'Skorpion@o.com','868-523-123'),
	('POLE','Ziemniaki z Pola',4,'Nap@Ziemnior.com','996-234-535')

Insert Into ProductsCategory Values
	(1,'Mieso i ryby'),
	(2,'Napoje'),
	(3,'Owoce i Warzywa'),
	(4,'Dodatki'),
	(5,'Pieczywo')

Insert into Products Values
	(1,'Wołowina',1,'OK',18,1),
	(2,'Kurczak',1,'OK',12,1),
	(3,'Jagnięcina',1,'MARC',15,1),
	(4,'Kaczka',1,'MARC',15,1),
	(5,'Stek Wołowy',1,'OK',25,1),
	(6,'Napoje słodkie',2,'BIED',5,3),
	(7,'Woda Mineralna',2,'LIDL',2,3),
	(8,'Piwo Lane',2,'KSZS',4,3),
	(9,'Łosoś',1,'KARO',16,11),
	(10,'Ciasta',4,'CIAH',8,11),
	(11,'Ziemniaki',3,'POLE',3,11),
	(12,'Ryz',4,'SZKL',2,11),
	(13,'Bułki',5,'WJTK',1,11),
	(14,'Bruschetta',5,'WJTK',2,11),
	(15,'Szparagi',3,'SAD',2,1),
	(16,'Śliwki',3,'SAD',5,1),
	(17,'Maka',4,'BIED',2,1),
	(18,'Jajka',4,'POLE',1,3),
	(19,'Kostka Rosolowa',4,'BIED',1,3),
	(20,'Buraki',3,'SZKL',2,3),
	(21,'SER',4,'LIDL',6,3)

Insert into OrderDetails Values
	(21,2,3,1,1), (21,7,10,2,2), (21,11,16,2,3), (21,20,31,2,4),
	(7,12,18,1,5), (7,17,26,1,6), (7,19,30,1,7),
	(8,7,10,3,8),
	(36,1,1,1,9), (36,3,4,1,10), (36,5,8,2,11), (36,9,13,2,12),(36,16,24,2,13), (36,20,31,2,14),
	(7,12,18,1,15), (7,17,26,1,16), (7,19,30,1,17),
	(23,5,8,1,18), (23,4,6,1,19), (23,13,19,1,20), (23,20,31,1,21),
	(40,9,12,2,22), (40,11,15,2,23), (40,15,21,2,24),
	(19,2,2,3,25), (19,5,7,3,26), (19,10,8,3,27), (19,11,15,3,28),(19,15,21,3,29), (19,19,28,3,30)

	
