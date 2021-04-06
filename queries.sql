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
from Item, Game
where game.gameid=item.itemid
and category ='Action';

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
from Person, Employee
where employee.epid=person.pid
and Name = 'Alan';


-- What games are rated M?
select item.name, game.rating
from Item, Game
where game.gameid=item.itemid
and rating = 'M';


-- Show all orders from 2021
select *
from Order_t
where (orderDate like '%2021');

-- update Elon Musks, PID 13, birthday
update person
set birthdate = '07/28/1971'
where PID = 13;

-- Whats the item id for the PS3 V2?
select itemid
from item
where name = 'PS3 V2';

commit; 
