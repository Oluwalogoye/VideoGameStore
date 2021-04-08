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

\! echo 'Is GTA avalible in the store?'
select if(exists(
select Name
from Item
where name = 'GTA'), 
'Yes', 
'Yes')
 as 'GTA is in store';

 \! echo 'Is GTA 5 avalible in the store?'
select if(exists(
select Name
from Item
where name = 'GTA 5'), 
'Yes', 
'No')
 as 'GTA 5 is in store';

\! echo 'What games by Notch does the store have?'
select item.Name as 'Founded by Notch'
from Item, Game, Publisher
where item.itemid = game.gameid
and game.gameid = publisher.publisherid
and founder = 'Notch';

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

\! echo 'What is the total order number 19'
select sum(item.price)
from item, OrderItems
where item.itemid = orderitems.itemid
and ordernumber = 19;

\! echo 'Which employee checked out sally ride on 08/17/2021?'
select distinct person.name
from order_t, person
where person.pid = order_t.employeeid
and customerId = 15
and orderdate = '08/17/2020';

commit; 
