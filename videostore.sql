/* 
Group 1: Samuel Solomon, Fritz Paz, Cameron Dolly, Logo Olagoke
CMS 375 Phase 4
Implementation
Creation and Population file
*/

-- if database exists, delete it and recreate it
DROP database IF EXISTS videoStore;
CREATE database videoStore;
USE videoStore;


-- if the table exists, delete it
DROP TABLE IF EXISTS Person, Employee, Customer, Item, Order_t, OrderItems, Game;


-- ---------------------------- Table creations(DDL) -----------------------------------

-- defines base table person
CREATE TABLE Person(
	PID int NOT NULL,
	Name varchar(40) NOT NULL,	
	PhoneNumber char(10),
	Email varchar(50),
	Birthdate varchar(10),
	isEmployee char(1) DEFAULT 'f',
	isCustomer char(1) DEFAULT 'f',
	Constraint Person_pk PRIMARY KEY (PID)
);

-- defines employee table 
CREATE TABLE Employee(
	EPID int NOT NULL,
	JobTitle varchar(30) NOT NULL,
	Salary int,
	Constraint Employee_pk PRIMARY KEY (EPID),
	Constraint Employee_fk FOREIGN KEY (EPID) references Person(PID)
);

-- defines customer table 
CREATE TABLE Customer(
	CPID int NOT NULL,
	Membership varchar(6),
	Check(Membership in ("Gold", "Silver", "Bronze")),
	Constraint Customer_pk PRIMARY KEY (CPID),
	Constraint Customer_fk FOREIGN KEY (CPID) references Person(PID)
);

-- defines base table item 
CREATE TABLE Item(
	ItemID int NOT NULL,
	Name varchar(24) NOT NULL,
	Price int NOT NULL DEFAULT 0,
	CustomerRating int,
	IType char(1),
	Check(IType in ("g", "c")),
	Constraint Item_pk PRIMARY KEY (ItemID)
);

-- defines base table order
CREATE TABLE Order_t(
	OrderNumber int NOT NULL,
	CustomerID int NOT NULL,
	EmployeeID int NOT NULL,
	OrderTime int,
	OrderDate varchar(10),
	Constraint Order_pk PRIMARY KEY (OrderNumber),
	Constraint Order_fk_1 FOREIGN KEY (CustomerID) REFERENCES Person(PID),
	Constraint Order_fk_2 FOREIGN KEY (EmployeeID) REFERENCES Person(PID)
);

-- defines items in order table
CREATE TABLE OrderItems(
	OrderNumber int NOT NULL,
	ItemID int NOT NULL,
	Constraint OrderItems_pk PRIMARY KEY (OrderNumber, ItemID),
	Constraint OrderItems_fk_1 FOREIGN KEY (OrderNumber) REFERENCES Order_t(OrderNumber),
	Constraint OrderItems_fk_2 FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);


-- defines base table publisher
CREATE TABLE Publisher(
	PublisherID int NOT NULL,
	Founder varchar(40),
	Headquarters varchar(20),
	Constraint Publisher_pk PRIMARY KEY (PublisherID)
);

-- defines game table
CREATE TABLE Game(
	GameID int NOT NULL,
	PublisherID int NOT NULL,
	Rating varchar(4),
	Check(Rating in ('PG','PG13','M','E', 'R')),
	Category varchar(12),
	Check(Category in ('Action', 'Adventure', 'Fighting', 'Racing', 'Role-playing', 'Shooter', 'Strategy', 'Other')),
	Constraint Game_pk PRIMARY KEY (GameID),
	Constraint Game_fk_1 FOREIGN KEY (GameID) REFERENCES Item(ItemID),
	Constraint Game_fk_2 FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- defines console table
CREATE TABLE Console(
	ConsoleID int NOT NULL,
	PublisherID int NOT NULL,
	Color varchar(15),
	Constraint Console_pk PRIMARY KEY (ConsoleID),
	Constraint Console_fk_1 FOREIGN KEY (ConsoleID) REFERENCES Item(ItemID),
  Constraint Console_fk_2 FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherId)
);


-- ---------------------------- Table populations (DML) -----------------------------------

-- BASE TABLE Person: PID, Name, Phone Number, Email, DOB, employee?, customer?
-- Data for person. Employees only
INSERT INTO Person VALUES (1, 'Logo Olagoke', '9873458736', 'la@gmail.com', '02/09/2000', 't', 'f');
INSERT INTO Person VALUES (2, 'Samuel Solomon', '4071234567', 'ss@gmail.com', '04/20/1996', 't', 'f');
INSERT INTO Person VALUES (3, 'Cameron Dolly', '2392982938', 'Cdolly@yahoo.com', '09/03/1998', 't', 'f');
INSERT INTO Person VALUES (4, 'Fritz Paz', '2872092983', 'fpaz@yahoo.com', '03/06/2000', 't', 'f');
INSERT INTO Person VALUES (5, 'Layo Olagoke', '9273450736', 'layo@gmail.com', '03/12/2000', 't', 'f');
INSERT INTO Person VALUES (6, 'Cameron Ponce', '239598898', 'Cponce@yahoo.com', '01/03/2003', 't', 'f');
INSERT INTO Person VALUES (7, 'Florence Laz', '1432092921', 'flaz@outlook.com', '03/06/2004', 't', 'f');
INSERT INTO Person VALUES (24, 'Bob Ross', '1231118765', 'bross@mail.com', '03/06/1944', 't', 'f');
INSERT INTO Person VALUES (25, 'Bob Ross jr', '4012231534', 'brossjr@mail.com', '03/06/1984', 't', 'f');
INSERT INTO Person VALUES (26, 'Jane Good', '8123321654', 'janeG@mail.com', '01/26/1974', 't', 'f');
INSERT INTO Person VALUES (27, 'George Noble', '2143546677', 'gnoble@mail.com', '03/06/1933', 't', 'f');
INSERT INTO Person VALUES (28, 'Chris Wild', NULL, 'chrisw@mail.com', '02/17/1984', 't', 'f');
INSERT INTO Person VALUES (29, 'Marge Simpson', '8089765423', 'marges@mail.com', '11/16/1974', 't', 'f');
INSERT INTO Person VALUES (30, 'Bob Chris', '2143546677', 'bobChris@mail.com', '12/25/1983', 't', 'f');
INSERT INTO Person VALUES (31, 'Shawn Grey', NULL, 'shawnnnn@mail.com', '12/17/1984', 't', 'f');
INSERT INTO Person VALUES (32, 'Jenny W', '8089765423', 'jennyrocks@mail.com', '11/01/1984', 't', 'f');

-- Data for person. Customers only
INSERT INTO Person VALUES (8, 'John Doe', '4071112222', 'jdoe@email.com', '03/06/1950', 'f', 't');
INSERT INTO Person VALUES (9, 'Jenny Jo', '3671116368', 'jjo@email.com', '09/15/1999', 'f', 't');
INSERT INTO Person VALUES (10, 'Bob Buider', '1213456243', 'bbuilder@email.com', '07/30/1967', 'f', 't');
INSERT INTO Person VALUES (11, 'Mickey Mouse', '8905621111', 'mmouse@email.com', '10/30/2001', 'f', 't');
INSERT INTO Person VALUES (12, 'Ryan Gosling', '8731237676', 'rgos@email.com', '12/12/1983', 'f', 't');
INSERT INTO Person VALUES (13, 'Elon Musk', '3030012255', 'emusk@email.com', '01/22/1961', 'f', 't');
INSERT INTO Person VALUES (14, 'John Deer', '4321112222', 'jdeer@email.com', '03/05/1950', 'f', 't');
INSERT INTO Person VALUES (15, 'Sally Ride', '7775261432', 'sride@email.com', '11/22/1954', 'f', 't');
INSERT INTO Person VALUES (21, 'Karen Right', NULL, 'karenRIGHT@email.com', '12/03/1977', 'f', 't');
INSERT INTO Person VALUES (22, 'Mary Jane', '5094201943', 'mj@email.com', '05/20/1995', 'f', 't');
INSERT INTO Person VALUES (23, 'Mary Doe', '4071651122', 'mdoe@email.com', '02/22/2002', 'f', 't');
INSERT INTO Person VALUES (33, 'Sierra Doe', '4071734382', 'sdoe@gmail.com', '01/17/1998', 'f', 't');
INSERT INTO Person VALUES (34, 'Mary Women', '4072856183', NULL, '07/02/1955', 'f', 't');
INSERT INTO Person VALUES (35, 'Vincent Adultman', '4076548521', 'vadultman@realmail.com', '08/12/1964', 'f', 't');
INSERT INTO Person VALUES (36, 'Mclovin', '4079843578', 'mclovin@hawaii.com', '06/03/1981', 'f', 't');

-- Data for person. Customer and Employee
INSERT INTO Person VALUES (16, 'Alice Grace', '1212341098', 'agrace@email.com', '05/01/1998', 't', 't');
INSERT INTO Person VALUES (17, 'Ron Gold', '4076224132', 'ronlovesbeth@email.com', '07/01/1971', 't', 't');
INSERT INTO Person VALUES (18, 'Beth Gold', '4076224132', 'bethlovesron@email.com', '07/22/1971', 't', 't');
INSERT INTO Person VALUES (19, 'Ethan Marc', '4123215566', 'ethanrox@email.com', '04/01/2009', 't', 't');
INSERT INTO Person VALUES (20, 'Alan', NULL, NULL, '01/01/1922', 't', 't');


-- Data for Employee: ~ID(Must match a PID), Job title, Salary
INSERT INTO Employee VALUES (1,'Programmer', 80000);
INSERT INTO Employee VALUES (2, 'Cashier', 20000);
INSERT INTO Employee VALUES (3, 'Cashier', 20000);
INSERT INTO Employee VALUES (4, 'Programmer', 97000);
INSERT INTO Employee VALUES (5, 'Cashier', 12000);
INSERT INTO Employee VALUES (6, 'Manager', 150000);
INSERT INTO Employee VALUES (7, 'Front end developer', 100000);
INSERT INTO Employee VALUES (16,'Programmer', 80000);
INSERT INTO Employee VALUES (17, 'Cashier', 33000);
INSERT INTO Employee VALUES (18, 'Cashier', 11000);
INSERT INTO Employee VALUES (19, 'Programmer', 95000);
INSERT INTO Employee VALUES (20, 'Cashier', 15000);
INSERT INTO Employee VALUES (24, 'Cashier', 20000);
INSERT INTO Employee VALUES (25, 'Cashier', 20000);
INSERT INTO Employee VALUES (26, 'Programmer', 97000);
INSERT INTO Employee VALUES (27, 'Cashier', 12000);
INSERT INTO Employee VALUES (28, 'Manager', 150000);
INSERT INTO Employee VALUES (29, 'Front end developer', 100000);
INSERT INTO Employee VALUES (30,'Programmer', 80000);
INSERT INTO Employee VALUES (31, 'Cashier', 33000);
INSERT INTO Employee VALUES (32, 'Cashier', 11000);

-- Data for Customer: ~ID(Must match a PID), Membership(Gold, Silver, or Bronze)
INSERT INTO Customer VALUES (8,'Gold'); 
INSERT INTO Customer VALUES (9,'Gold'); 
INSERT INTO Customer VALUES (10,'Gold'); 
INSERT INTO Customer VALUES (11,'Silver'); 
INSERT INTO Customer VALUES (12,'Gold'); 
INSERT INTO Customer VALUES (13,'Bronze'); 
INSERT INTO Customer VALUES (14,'Gold'); 
INSERT INTO Customer VALUES (15,'Silver');
INSERT INTO Customer VALUES (16,'Gold');  
INSERT INTO Customer VALUES (17,'Silver'); 
INSERT INTO Customer VALUES (18,'Gold'); 
INSERT INTO Customer VALUES (19,'Gold'); 
INSERT INTO Customer VALUES (20,'Bronze'); 
INSERT INTO Customer VALUES (21,'Gold'); 
INSERT INTO Customer VALUES (22,'Bronze'); 
INSERT INTO Customer VALUES (23, 'Silver');
INSERT INTO Customer VALUES (33, 'Silver');
INSERT INTO Customer VALUES (34, 'Silver');
INSERT INTO Customer VALUES (35, 'Silver');
INSERT INTO Customer VALUES (36, 'Silver');


-- BASE TABLE Item: ID, name, cost, rating, type (g or c) 
-- Data for Item: games
INSERT INTO Item VALUES (1, 'FIFA 14', 90, 5, 'g');
INSERT INTO Item VALUES (2, 'GTA 5', 20, 4, 'g');
INSERT INTO Item VALUES (3, 'FLY TO SPACE', 100, 2, 'g');
INSERT INTO Item VALUES (4, 'FIFA 15', 88, 3, 'g');
INSERT INTO Item VALUES (5, 'GTA Vice City', 80, 1, 'g');
INSERT INTO Item VALUES (6, 'Top Eleven', 100, 5, 'g');
INSERT INTO Item VALUES (7, 'FIFA 16', 100, 3, 'g');
INSERT INTO Item VALUES (8, 'GTA Xan', 50, 4, 'g');
INSERT INTO Item VALUES (9, 'FLY TO SPACE 2', 120, 4, 'g');
INSERT INTO Item VALUES (10, 'FIFA 09', 68, 3, 'g');
INSERT INTO Item VALUES (11, 'GTA Vice City 2', 88, 3, 'g');
INSERT INTO Item VALUES (12, 'Football Manager', 120, 5, 'g');
INSERT INTO Item VALUES (13, 'FIFA 04', 99, 5, 'g');
INSERT INTO Item VALUES (14, 'GTA Fango', 29, 4, 'g');
INSERT INTO Item VALUES (15, 'FLY TO SPACE 3', 120, 5, 'g');
INSERT INTO Item VALUES (16, 'FIFA 05', 84, 3, 'g');
INSERT INTO Item VALUES (17, 'GTA Vice Land', 89, 1, 'g');
INSERT INTO Item VALUES (18, 'Top Boys', 102, 5, 'g');
INSERT INTO Item VALUES (19, 'PES 10', 110, 3, 'g');
INSERT INTO Item VALUES (20, 'GTA Xander 2', 60, 4, 'g');
INSERT INTO Item VALUES (21, 'FLY TO SPACE 3', 130, 5, 'g');
INSERT INTO Item VALUES (22, 'FIFA 19', 68, 3, 'g');
INSERT INTO Item VALUES (23, 'GTA Ki City 2', 89, 3, 'g');
INSERT INTO Item VALUES (24, 'Badass Cutie Birds', 1, 5, 'g');

-- Data for Item: consoles 
INSERT INTO Item VALUES (25, 'Xbox', 400, 5, 'c');
INSERT INTO Item VALUES (26, 'Xbox M', 450, 4, 'c');
INSERT INTO Item VALUES (27, 'PS3', 490, 5, 'c');
INSERT INTO Item VALUES (28, 'PSP', 50, 4, 'c');
INSERT INTO Item VALUES (29, 'PS5', 500, 2, 'c');
INSERT INTO Item VALUES (30, 'PS 2', 200, 4, 'c');
INSERT INTO Item VALUES (31, 'PS', 100, 5, 'c');
INSERT INTO Item VALUES (32, 'Xbox X', 400, 5, 'c');
INSERT INTO Item VALUES (33, 'Xbox M 2', 450, 4, 'c');
INSERT INTO Item VALUES (34, 'PS3 V2', 412, 2, 'c');
INSERT INTO Item VALUES (35, 'PSP Vango', 80, 4, 'c');
INSERT INTO Item VALUES (36, 'PS5 Plus', 520, 1, 'c');
INSERT INTO Item VALUES (37, 'PS 2 v2', 220, 4, 'c');
INSERT INTO Item VALUES (38, 'PS Ki', 100, 5, 'c');
INSERT INTO Item VALUES (39, 'Xbox Kinnect', 400, 5, 'c');
INSERT INTO Item VALUES (40, 'Xbox Mang', 450, 4, 'c');
INSERT INTO Item VALUES (41, 'PS3 2015', 490, 5, 'c');
INSERT INTO Item VALUES (42, 'PSP 2000', 200, 2, 'c');
INSERT INTO Item VALUES (43, 'PS5 Classic', 500, 3, 'c');
INSERT INTO Item VALUES (44, 'PS 2 Retro', 220, 2, 'c');
INSERT INTO Item VALUES (45, 'PS Django', 100, 5, 'c');


-- Data for Order: OrderNum, ~Customer ID, ~Employee ID, Order Time (Military), Order Date
INSERT INTO Order_t VALUES (1, 8, 1, 1200, '01/31/2019');
INSERT INTO Order_t VALUES (2, 9, 2, 1400, '02/31/2019');
INSERT INTO Order_t VALUES (3, 10, 3, 0800, '03/01/2019');
INSERT INTO Order_t VALUES (4, 11, 4, 0100, '03/15/2019');
INSERT INTO Order_t VALUES (5, 12, 6, 1500, '05/17/2019');
INSERT INTO Order_t VALUES (6, 13, 7, 0900, '05/25/2019');
INSERT INTO Order_t VALUES (7, 14, 16, 0400, '07/15/2019');
INSERT INTO Order_t VALUES (8, 15, 17, 1100, '08/17/2019');
INSERT INTO Order_t VALUES (9, 21, 18, 0800, '11/25/2019');
INSERT INTO Order_t VALUES (10, 22, 19, 2200, '12/15/2019');
INSERT INTO Order_t VALUES (11, 8, 20, 1000, '12/15/2019');
INSERT INTO Order_t VALUES (12, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (13, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (14, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (15, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (16, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (17, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (18, 8, 1, 1200, '01/31/2020');
INSERT INTO Order_t VALUES (19, 9, 2, 1400, '02/31/2020');
INSERT INTO Order_t VALUES (20, 10, 3, 0800, '03/01/2020');
INSERT INTO Order_t VALUES (21, 11, 4, 0100, '03/15/2020');
INSERT INTO Order_t VALUES (22, 12, 6, 1500, '05/17/2020');
INSERT INTO Order_t VALUES (23, 13, 7, 0900, '05/25/2020');
INSERT INTO Order_t VALUES (24, 14, 16, 0400, '07/15/2020');
INSERT INTO Order_t VALUES (25, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (26, 21, 7, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (27, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (28, 8, 2, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (29, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (30, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (31, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (32, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (33, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (34, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (35, 8, 1, 1200, '01/31/2020');
INSERT INTO Order_t VALUES (36, 9, 2, 1400, '02/31/2020');
INSERT INTO Order_t VALUES (37, 10, 3, 0800, '03/01/2020');
INSERT INTO Order_t VALUES (38, 11, 4, 0100, '03/15/2020');
INSERT INTO Order_t VALUES (39, 12, 6, 1500, '05/17/2020');
INSERT INTO Order_t VALUES (40, 13, 7, 0900, '05/25/2020');
INSERT INTO Order_t VALUES (41, 14, 16, 0400, '07/15/2020');
INSERT INTO Order_t VALUES (42, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (43, 21, 18, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (44, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (45, 8, 20, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (46, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (47, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (48, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (49, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (50, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (51, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (52, 8, 1, 1200, '01/31/2020');
INSERT INTO Order_t VALUES (53, 9, 2, 1400, '02/31/2020');
INSERT INTO Order_t VALUES (54, 10, 3, 0800, '03/01/2020');
INSERT INTO Order_t VALUES (55, 11, 4, 0100, '03/15/2020');
INSERT INTO Order_t VALUES (56, 12, 6, 1500, '05/17/2020');
INSERT INTO Order_t VALUES (57, 13, 7, 0900, '05/25/2020');
INSERT INTO Order_t VALUES (58, 14, 16, 0400, '07/15/2020');
INSERT INTO Order_t VALUES (59, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (60, 21, 7, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (61, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (62, 8, 2, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (63, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (64, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (65, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (66, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (67, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (68, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (69, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (70, 8, 20, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (71, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (72, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (73, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (74, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (75, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (76, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (77, 8, 1, 1200, '01/31/2020');
INSERT INTO Order_t VALUES (78, 9, 2, 1400, '02/31/2020');
INSERT INTO Order_t VALUES (79, 10, 3, 0800, '03/01/2020');
INSERT INTO Order_t VALUES (80, 11, 4, 0100, '03/15/2020');
INSERT INTO Order_t VALUES (81, 12, 6, 1500, '05/17/2020');
INSERT INTO Order_t VALUES (82, 13, 7, 0900, '05/25/2020');
INSERT INTO Order_t VALUES (83, 14, 16, 0400, '07/15/2020');
INSERT INTO Order_t VALUES (84, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (85, 21, 7, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (86, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (87, 8, 2, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (88, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (89, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (90, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (91, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (92, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (93, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (94, 8, 1, 1200, '01/31/2020');
INSERT INTO Order_t VALUES (95, 9, 2, 1400, '02/31/2020');
INSERT INTO Order_t VALUES (96, 10, 3, 0800, '03/01/2020');
INSERT INTO Order_t VALUES (97, 11, 4, 0100, '03/15/2020');
INSERT INTO Order_t VALUES (98, 12, 6, 1500, '05/17/2020');
INSERT INTO Order_t VALUES (99, 13, 7, 0900, '05/25/2020');
INSERT INTO Order_t VALUES (100, 14, 16, 0400, '07/15/2020');
INSERT INTO Order_t VALUES (101, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (102, 21, 18, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (103, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (104, 8, 20, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (105, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (106, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (107, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (108, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (109, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (110, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (111, 8, 1, 1200, '01/31/2020');
INSERT INTO Order_t VALUES (112, 9, 2, 1400, '02/31/2020');
INSERT INTO Order_t VALUES (113, 10, 3, 0800, '03/01/2020');
INSERT INTO Order_t VALUES (114, 11, 4, 0100, '03/15/2020');
INSERT INTO Order_t VALUES (115, 12, 6, 1500, '05/17/2020');
INSERT INTO Order_t VALUES (116, 13, 7, 0900, '05/25/2020');
INSERT INTO Order_t VALUES (117, 14, 16, 0400, '07/15/2020');
INSERT INTO Order_t VALUES (118, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (119, 21, 7, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (120, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (121, 8, 2, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (122, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (123, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (124, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (125, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (126, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (127, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (128, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (129, 21, 7, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (130, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (131, 8, 2, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (132, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (133, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (134, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (135, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (136, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (137, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (138, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (139, 21, 7, 0800, '11/25/2020');
INSERT INTO Order_t VALUES (140, 22, 19, 2200, '12/15/2020');
INSERT INTO Order_t VALUES (141, 8, 2, 1000, '12/15/2020');
INSERT INTO Order_t VALUES (142, 11, 5, 0100, '05/15/2020');
INSERT INTO Order_t VALUES (143, 8, 1, 1200, '01/31/2021');
INSERT INTO Order_t VALUES (144, 9, 2, 1400, '02/31/2021');
INSERT INTO Order_t VALUES (145, 10, 3, 0800, '03/01/2021');
INSERT INTO Order_t VALUES (146, 11, 4, 0100, '03/15/2021');
INSERT INTO Order_t VALUES (147, 12, 6, 1500, '03/17/2021');
INSERT INTO Order_t VALUES (148, 15, 17, 1100, '08/17/2020');
INSERT INTO Order_t VALUES (149, 21, 7, 0800, '11/30/2020');
INSERT INTO Order_t VALUES (150, 22, 19, 2200, '12/15/2020');


-- Data for items in order or OrderItems: ~Order Number, ~Item ID 
INSERT INTO OrderItems Values (1, 3);
INSERT INTO OrderItems Values (2, 5);
INSERT INTO OrderItems Values (3, 7);
INSERT INTO OrderItems Values (4, 10);
INSERT INTO OrderItems Values (4, 13);
INSERT INTO OrderItems Values (5, 1);
INSERT INTO OrderItems Values (6, 3);
INSERT INTO OrderItems Values (7, 11);
INSERT INTO OrderItems Values (8, 4);
INSERT INTO OrderItems Values (9, 6);
INSERT INTO OrderItems Values (10, 22);
INSERT INTO OrderItems Values (11, 24);
INSERT INTO OrderItems Values (12, 30);
INSERT INTO OrderItems Values (13, 4);
INSERT INTO OrderItems Values (14, 12);
INSERT INTO OrderItems Values (15, 19);
INSERT INTO OrderItems Values (16, 11);
INSERT INTO OrderItems Values (17, 5);
INSERT INTO OrderItems Values (18, 1);
INSERT INTO OrderItems Values (19, 8);
INSERT INTO OrderItems Values (19, 10);
INSERT INTO OrderItems Values (19, 15);
INSERT INTO OrderItems Values (20, 13);
INSERT INTO OrderItems Values (21, 31);
INSERT INTO OrderItems Values (22, 19);
INSERT INTO OrderItems Values (23, 40);
INSERT INTO OrderItems Values (24, 35);
INSERT INTO OrderItems Values (25, 2);
INSERT INTO OrderItems Values (26, 15);
INSERT INTO OrderItems Values (27, 6);
INSERT INTO OrderItems Values (28, 27);
INSERT INTO OrderItems Values (29, 29);
INSERT INTO OrderItems Values (30, 9);
INSERT INTO OrderItems Values (31, 43);
INSERT INTO OrderItems Values (32, 45);
INSERT INTO OrderItems Values (33, 5);
INSERT INTO OrderItems Values (34, 26);
INSERT INTO OrderItems Values (35, 42);
INSERT INTO OrderItems Values (36, 16);
INSERT INTO OrderItems Values (37, 27);
INSERT INTO OrderItems Values (38, 19);
INSERT INTO OrderItems Values (39, 24);
INSERT INTO OrderItems Values (40, 18);
INSERT INTO OrderItems Values (41, 6);
INSERT INTO OrderItems Values (42, 3);
INSERT INTO OrderItems Values (43, 43);
INSERT INTO OrderItems Values (44, 10);
INSERT INTO OrderItems Values (45, 27);
INSERT INTO OrderItems Values (46, 11);
INSERT INTO OrderItems Values (47, 21);
INSERT INTO OrderItems Values (48, 13);
INSERT INTO OrderItems Values (49, 7);
INSERT INTO OrderItems Values (50, 38);
INSERT INTO OrderItems Values (51, 35);
INSERT INTO OrderItems Values (52, 4);
INSERT INTO OrderItems Values (53, 39);
INSERT INTO OrderItems Values (54, 15);
INSERT INTO OrderItems Values (55, 29);
INSERT INTO OrderItems Values (56, 32);
INSERT INTO OrderItems Values (57, 14);
INSERT INTO OrderItems Values (58, 8);
INSERT INTO OrderItems Values (59, 36);
INSERT INTO OrderItems Values (60, 9);
INSERT INTO OrderItems Values (61, 12);
INSERT INTO OrderItems Values (62, 20);
INSERT INTO OrderItems Values (63, 41);
INSERT INTO OrderItems Values (64, 26);
INSERT INTO OrderItems Values (65, 33);
INSERT INTO OrderItems Values (66, 22);
INSERT INTO OrderItems Values (67, 35);
INSERT INTO OrderItems Values (68, 1);
INSERT INTO OrderItems Values (69, 22);
INSERT INTO OrderItems Values (70, 14);
INSERT INTO OrderItems Values (71, 30);
INSERT INTO OrderItems Values (72, 7);
INSERT INTO OrderItems Values (73, 27);
INSERT INTO OrderItems Values (74, 21);
INSERT INTO OrderItems Values (75, 5);
INSERT INTO OrderItems Values (76, 34);
INSERT INTO OrderItems Values (77, 39);
INSERT INTO OrderItems Values (78, 9);
INSERT INTO OrderItems Values (79, 42);
INSERT INTO OrderItems Values (80, 17);
INSERT INTO OrderItems Values (81, 25);
INSERT INTO OrderItems Values (82, 16);
INSERT INTO OrderItems Values (83, 41);
INSERT INTO OrderItems Values (84, 29);
INSERT INTO OrderItems Values (85, 44);
INSERT INTO OrderItems Values (86, 41);
INSERT INTO OrderItems Values (87, 38);
INSERT INTO OrderItems Values (88, 3);
INSERT INTO OrderItems Values (89, 5);
INSERT INTO OrderItems Values (90, 27);
INSERT INTO OrderItems Values (91, 28);
INSERT INTO OrderItems Values (92, 19);
INSERT INTO OrderItems Values (93, 36);
INSERT INTO OrderItems Values (94, 30);
INSERT INTO OrderItems Values (95, 11);
INSERT INTO OrderItems Values (96, 24);
INSERT INTO OrderItems Values (97, 19);
INSERT INTO OrderItems Values (98, 23);
INSERT INTO OrderItems Values (99, 9);
INSERT INTO OrderItems Values (100, 15);
INSERT INTO OrderItems Values (101, 45);
INSERT INTO OrderItems Values (102, 4);
INSERT INTO OrderItems Values (103, 11);
INSERT INTO OrderItems Values (104, 44);
INSERT INTO OrderItems Values (105, 16);
INSERT INTO OrderItems Values (106, 15);
INSERT INTO OrderItems Values (107, 11);
INSERT INTO OrderItems Values (108, 29);
INSERT INTO OrderItems Values (109, 14);
INSERT INTO OrderItems Values (110, 4);
INSERT INTO OrderItems Values (111, 16);
INSERT INTO OrderItems Values (112, 39);
INSERT INTO OrderItems Values (113, 33);
INSERT INTO OrderItems Values (114, 22);
INSERT INTO OrderItems Values (115, 41);
INSERT INTO OrderItems Values (116, 40);
INSERT INTO OrderItems Values (117, 37);
INSERT INTO OrderItems Values (118, 8);
INSERT INTO OrderItems Values (119, 32);
INSERT INTO OrderItems Values (120, 5);
INSERT INTO OrderItems Values (120, 16);
INSERT INTO OrderItems Values (120, 20);
INSERT INTO OrderItems Values (121, 20);
INSERT INTO OrderItems Values (122, 34);
INSERT INTO OrderItems Values (123, 2);
INSERT INTO OrderItems Values (124, 29);
INSERT INTO OrderItems Values (125, 43);
INSERT INTO OrderItems Values (126, 20);
INSERT INTO OrderItems Values (127, 7);
INSERT INTO OrderItems Values (128, 2);
INSERT INTO OrderItems Values (129, 27);
INSERT INTO OrderItems Values (130, 41);
INSERT INTO OrderItems Values (131, 21);
INSERT INTO OrderItems Values (132, 34);
INSERT INTO OrderItems Values (133, 17);
INSERT INTO OrderItems Values (134, 42);
INSERT INTO OrderItems Values (135, 5);
INSERT INTO OrderItems Values (136, 3);
INSERT INTO OrderItems Values (137, 19);
INSERT INTO OrderItems Values (138, 33);
INSERT INTO OrderItems Values (139, 35);
INSERT INTO OrderItems Values (140, 38);
INSERT INTO OrderItems Values (141, 11);
INSERT INTO OrderItems Values (142, 21);
INSERT INTO OrderItems Values (143, 26);
INSERT INTO OrderItems Values (144, 38);
INSERT INTO OrderItems Values (145, 17);
INSERT INTO OrderItems Values (146, 14);
INSERT INTO OrderItems Values (147, 37);
INSERT INTO OrderItems Values (148, 32);
INSERT INTO OrderItems Values (149, 1);
INSERT INTO OrderItems Values (149, 2);
INSERT INTO OrderItems Values (149, 17);
INSERT INTO OrderItems Values (149, 38);
INSERT INTO OrderItems Values (150, 15);


-- Data for BASE TABLE Publisher: ID, Founder, HQ
INSERT INTO Publisher Values (1,'Take 2', 'Los Angeles, CA');
INSERT INTO Publisher Values (2,'Notch', 'Orlando, FL');
INSERT INTO Publisher Values (3,'Linus Torvald','Helsinky, FI');
INSERT INTO Publisher Values (4,'Notch','Stockholm, SW');
INSERT INTO Publisher Values (5,'EA Sports','Redwood City, CA');
INSERT INTO Publisher Values (6,'Ubisoft','Montreuil, FR');
INSERT INTO Publisher Values (7,'Tencent Games','Shenzhen, CH');
INSERT INTO Publisher Values (8,'Nintendo','Kyoto, JP');
INSERT INTO Publisher Values (9,'Microsoft','Redmond, WA');
INSERT INTO Publisher Values (10,'Rockstar Games','New York, NY');
INSERT INTO Publisher Values (11,'Sony Entertainment','Tokyo, JP');
INSERT INTO Publisher Values (12,'Notch','Sunnyvale, CA');
INSERT INTO Publisher Values (13,'Square Enix','Kyoto, JP');
INSERT INTO Publisher Values (14,'505 Games','Milan, IT');
INSERT INTO Publisher Values (15,'Slitherine Strategies','London, UK');
INSERT INTO Publisher Values (16,'Take 2','Denver, CO');
INSERT INTO Publisher Values (17,'Bandai Namco','Okinawa, JP');
INSERT INTO Publisher Values (18,'Blizzard','Los Angeles, CA');
INSERT INTO Publisher Values (19,'SEGA','Tokyo, JP');
INSERT INTO Publisher Values (20,'Riot Games','San Diego, CA');


-- Data for Game: ~ID, ~Publisher ID, Rating, Category
-- 'Action', 'Adventure', 'Fighting', 'Racing', 'Role-playing', 'Shooter', 'Strategy', 'Other'
INSERT INTO Game Values(3,1,'E','Shooter');
INSERT INTO Game Values(2,4,'PG','Other');
INSERT INTO Game Values(1,6,'PG13','Shooter');
INSERT INTO Game Values(4,11,'M','Shooter');
INSERT INTO Game Values(5,12,'PG','Other');
INSERT INTO Game Values(6,4,'PG','Racing');
INSERT INTO Game Values(7,5,'PG13','Racing');
INSERT INTO Game Values(8,3,'PG','Role-playing');
INSERT INTO Game Values(9,9,'M','Shooter');
INSERT INTO Game Values(10,10,'M','Action');
INSERT INTO Game Values(11,12,'R','Action');
INSERT INTO Game Values(12,18,'E','Strategy');
INSERT INTO Game Values(13,11,'PG13','Fighting');
INSERT INTO Game Values(14,19,'PG13','Adventure');
INSERT INTO Game Values(15,8,'PG','Other');
INSERT INTO Game Values(16,17,'E','Other');
INSERT INTO Game Values(17,7,'E','Adventure');
INSERT INTO Game Values(18,16,'E','Strategy');
INSERT INTO Game Values(19,6,'R','Racing');
INSERT INTO Game Values(20,18,'PG13','Racing');
INSERT INTO Game Values(21,13,'M','Role-playing');
INSERT INTO Game Values(22,8,'M','Other');
INSERT INTO Game Values(23,20,'PG13','Fighting');
INSERT INTO Game Values(24,2,'R','Action');


-- Data for Console: ~ID, -PublisherID, Color
-- Microsoft ID -> 9
-- Sony ID -> 11
INSERT INTO Console Values(25, 9, 'White');
INSERT INTO Console Values(26, 11, 'Grey');
INSERT INTO Console Values(27, 12, 'Black');
INSERT INTO Console Values(28, 7, 'White');
INSERT INTO Console Values(29, 9, 'White');
INSERT INTO Console Values(30, 11, 'Black');
INSERT INTO Console Values(31, 11, 'Blue');
INSERT INTO Console Values(32, 11, 'Black');
INSERT INTO Console Values(33, 9, 'Grey');
INSERT INTO Console Values(34, 9, 'Grey');
INSERT INTO Console Values(35, 7, 'Red');
INSERT INTO Console Values(36, 5, 'White');
INSERT INTO Console Values(37, 6, 'Grey');
INSERT INTO Console Values(38, 8, 'Black');
INSERT INTO Console Values(39, 12, 'Blue');
INSERT INTO Console Values(40, 13, 'Black');
INSERT INTO Console Values(41, 15, 'Gunmetal');
INSERT INTO Console Values(42, 14, 'Gunmetal');
INSERT INTO Console Values(43, 6, 'Black');
INSERT INTO Console Values(44, 18, 'White');
INSERT INTO Console Values(45, 19, 'Grey');

commit;
