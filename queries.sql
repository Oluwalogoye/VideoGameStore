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
from OrderItems;
\! echo 'Person';
select * 
from Person;
\! echo 'Publisher';
select * 
from Publisher;

\! echo 'What action games are in the store?'
select item.name, game.category
from Item, Game
where item.itemid=game.gameid
and category ='Action';

\! echo 'Is Minecraft avalible in the store?'
select if(exists(
select Name
from Item
where name = 'Minecraft'), 
'Yes', 
'No')
 as 'Minecraft in store';

 \! echo 'Is GTA 5 avalible in the store?'
select if(exists(
select Name
from Item
where name = 'GTA 5'), 
'Yes', 
'No')
 as 'GTA 5 in store';

\! echo 'What games by Notch does the store have?'
select item.Name as 'Founded by Notch'
from Item, Game, Publisher
where item.itemid = game.gameid
and game.gameid = publisher.publisherid
and founder = 'Notch';

\! echo 'How much games has Jenny Jo purchased in total?'
select count(item.itemid) as'Games bought by Jenny Jo'
from item, OrderItems, order_t, Person
where item.itemid = orderitems.itemid
and order_t.ordernumber = orderitems.ordernumber
and order_t.customerId = person.pid
and person.name = 'Jenny Jo';

\! echo 'What games are under 20$?'
select Name 
from Item 
where Price <= 20 and Itype='g';

\! echo 'What is Alans salary?'
select employee.salary as 'Alans salary'
from Person, Employee
where employee.epid=person.pid
and Name = 'Alan';


\! echo 'What games are rated R?'
select item.Name as 'R-rated games'
from Item, Game
where item.itemid=game.gameid
and rating = 'R';

\! echo 'What year was Mclovin born?'
select substring(birthdate,7,10) as 'Birth year'
from person
where name = 'Mclovin';

\! echo 'Can Mclovin buy an R rated game?'
select if(
(select substring(birthdate,7,10)
from person
where name = 'Mclovin') < year(curdate())-18,
'Yes',
'No')
as 'Is Mclovin 18+?';

\! echo 'Can Ethan Marc buy an R rated game?'
select if(
(select substring(birthdate,7,10)
from person
where name = 'Ethan Marc') < year(curdate())-18,
'Yes',
'No')
as 'Is Ethan 18+?';

\! echo 'Show all orders from 2021'
select *
from Order_t
where (orderDate like '%2021');

\! echo 'Update Elon Musks, PID 13, birthday'
update person
set birthdate = '07/28/1971'
where PID = 13;

\! echo 'Whats the id for the PS3 V2?'
select itemid as 'ID'
from item
where name = 'PS3 V2';

\! echo 'What items are in order number 19'
select item.name
from item, OrderItems
where item.itemid = orderitems.itemid
and ordernumber = 19;

\! echo 'Who is a cashier at the store?'
select name as 'Cashiers'
from person,employee
where person.pid = employee.epid
and employee.JobTitle = 'Cashier';

\! echo 'Which customers need the gold discount?'
select name as 'Gold Members'
from person,customer
where person.pid = customer.cpid
and customer.membership = 'Gold';

\! echo 'Which consoles come in white?'
select name
from item, console
where item.itemid = console.consoleid
and console.color = 'White';

\! echo 'What is the total order number 19'
select sum(item.price) as 'Order 19 sum'
from item, OrderItems
where item.itemid = orderitems.itemid
and ordernumber = 19;

\! echo 'What did Karen Right buy in total on 11/30/2020'
select item.name as 'Items bought'
from item, OrderItems, order_t, Person
where item.itemid = orderitems.itemid
and order_t.ordernumber = orderitems.ordernumber
and order_t.customerId = person.pid
and person.name = 'Karen Right'
and order_t.orderdate = '11/30/2020';

\! echo 'How much did Karen Right pay in total on 11/30/2020'
select sum(item.price) as 'Karens total'
from item, OrderItems, order_t, Person
where item.itemid = orderitems.itemid
and order_t.ordernumber = orderitems.ordernumber
and order_t.customerId = person.pid
and person.name = 'Karen Right'
and order_t.orderdate = '11/30/2020';

\! echo 'Which employee checked out sally ride on 08/17/2021?'
select distinct person.name
from order_t, person
where person.pid = order_t.employeeid
and customerId = 15
and orderdate = '08/17/2020';

commit; 
