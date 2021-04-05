USE videoStore;
 
-- describe each schema
describe Console;
describe Customer;
describe Employee;
describe Game;
describe Item;
describe Order_t;
describe OrderItems;
describe Person;
describe Publisher;

-- What action games are in the store?
select item.name, game.category
from Item
inner join Game on game.gameid=item.itemid
where category ='Action';

-- Is GTA avalible in the store?

-- What games by Notch does the store have?
select item.name, publisher.founder
from Item
inner join Game on game.gameid=item.itemid
inner join Publisher on publisher.publisherid = game.gameid
where founder = 'Notch';


-- What games are under 20$?
select Name 
from Item 
where Price <= 20 and Itype='g';


-- What is Alans salary?
select person.name, employee.salary
from Person
inner join Employee on employee.epid=person.pid
where Name = 'Alan';


-- What games are rated M?
select item.name, game.rating
from Item
inner join Game on game.gameid=item.itemid
where rating = 'M';


-- Show all orders from 2021
select *
from Order_t
where (orderDate like '%2021');


commit; 
