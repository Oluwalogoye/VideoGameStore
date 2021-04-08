/* 
Group 1: Samuel Solomon, Fritz Paz, Cameron Dolly, Logo Olagoke
CMS 375 Phase 4
Implementation
Query/Update file
*/


USE videoStore;
 
-- describe each schema
\! echo ' ';
\! echo 'Console';
describe Console;
\! echo 'Customer';
describe Customer;
\! echo 'Employee';
describe Employee;
\! echo 'Game';
describe Game;
\! echo 'Item';
describe Item;
\! echo 'Order_t';
describe Order_t;
\! echo 'OrderItems';
describe OrderItems;
\! echo 'Person';
describe Person;
\! echo 'Publisher';
describe Publisher;

-- print each table
\! echo ' ';
\! echo 'Console';
select * 
from Console;
\! echo 'Customer';
select * 
from Customer;
\! echo 'Employee';
select * 
from Employee;
\! echo 'Game';
select * 
from Game;
\! echo 'Item';
select * 
from Item;
\! echo 'Order_t';
select * 
from Order_t;
\! echo 'OrderItems';
select * 
from OrderItems
order by ordernumber;
\! echo 'Person';
select * 
from Person;
\! echo 'Publisher';
select * 
from Publisher;

-- What action games are in the store?
select item.Name as 'Action Games'
from Item, Game
where item.itemid=game.gameid
and category ='Action';

-- Is Minecraft avalible in the store?
select if(exists(
select Name
from Item
where name = 'Minecraft'), 
'Yes', 
'No')
 as 'Minecraft in store';

 -- Is GTA 5 avalible in the store?
select if(exists(
select Name
from Item
where name = 'GTA 5'), 
'Yes', 
'No')
 as 'GTA 5 in store';

-- What games by Notch does the store have?
select item.Name as 'Founded by Notch'
from Item, Game, Publisher
where item.itemid = game.gameid
and game.gameid = publisher.publisherid
and founder = 'Notch';

-- How much games has Jenny Jo purchased in total?
select count(item.itemid) as'Games bought by Jenny Jo'
from item, OrderItems, order_t, Person
where item.itemid = orderitems.itemid
and order_t.ordernumber = orderitems.ordernumber
and order_t.customerId = person.pid
and person.name = 'Jenny Jo';

-- What games are under 20$?
select Name 
from Item 
where Price <= 20 and Itype='g';

-- What is Alans salary?
select concat(employee.salary, '$ a year') as 'Alans salary'
from Person, Employee
where employee.epid=person.pid
and Name = 'Alan';

-- What games are rated R?
select item.Name as 'R-rated games'
from Item, Game
where item.itemid=game.gameid
and rating = 'R';

-- What year was Mclovin born?
select year(str_to_date(person.birthdate, '%m/%d/%Y')) as 'Birth year'
from person
where name = 'Mclovin';

-- How old is Mclovin?
select timestampdiff(year,str_to_date(person.birthdate, '%m/%d/%Y'),curdate()) as 'Age'
from person
where name = 'Mclovin';

-- Can Mclovin buy an R rated game?
select if(
(select timestampdiff(year,str_to_date(person.birthdate, '%m/%d/%Y'),curdate())
from person
where name = 'Mclovin') > 18,
'Yes',
'No')
as 'Is Mclovin 18+?';

-- Can Ethan Marc buy an R rated game?
select if(
(select timestampdiff(year,str_to_date(person.birthdate, '%m/%d/%Y'),curdate())
from person
where name = 'Ethan Marc') > 18,
'Yes',
'No')
as 'Is Ethan 18+?';

-- Show all orders from 2019
select *
from Order_t
where (orderDate like '%2019');

-- Update PID 13s birthday
update person
set birthdate = '07/28/1971'
where PID = 13;

-- Whats the ID for the PS3 V2?
select itemid as 'PS3 V2 ID'
from item
where name = 'PS3 V2';

-- What items are in order number 19
select item.name as 'Order 19 items'
from item, OrderItems
where item.itemid = orderitems.itemid
and ordernumber = 19;

-- Who are the cashiers at the store?
select name as 'Cashiers'
from person,employee
where person.pid = employee.epid
and employee.JobTitle = 'Cashier';

-- Which customers need the gold discount?
select name as 'Gold Members'
from person,customer
where person.pid = customer.cpid
and customer.membership = 'Gold';

-- Which consoles come in white?
select Name
from item, console
where item.itemid = console.consoleid
and console.color = 'White';

-- What is the total for order 19?
select concat(sum(item.price), '$' ) as 'Total'
from item, OrderItems
where item.itemid = orderitems.itemid
and ordernumber = 19;

-- What did Karen Right buy in total on 11/30/2020
select item.name as 'Items bought'
from item, OrderItems, order_t, Person
where item.itemid = orderitems.itemid
and order_t.ordernumber = orderitems.ordernumber
and order_t.customerId = person.pid
and person.name = 'Karen Right'
and order_t.orderdate = '11/30/2020';

-- How much did Karen Right pay in total on 11/30/2020
select concat(sum(item.price), '$') as 'Karens total'
from item, OrderItems, order_t, Person
where item.itemid = orderitems.itemid
and order_t.ordernumber = orderitems.ordernumber
and order_t.customerId = person.pid
and person.name = 'Karen Right'
and order_t.orderdate = '11/30/2020';

-- Which employee checked out Sally Ride on 08/17/2021?
select distinct person.Name
from order_t, person
where person.pid = order_t.employeeid
and customerId = (
	select pid
	from person
	where name = 'Sally Ride'
	)
and orderdate = '08/17/2020';

commit; 
