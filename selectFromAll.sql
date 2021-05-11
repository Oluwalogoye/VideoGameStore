/* 
Group 1: Samuel Solomon, Fritz Paz, Cameron Dolly, Logo Olagoke
CMS 375 Phase 4
Implementation
Query/Update file
*/
-- print each table
\! echo 'Printing All Tables'

\! echo 'Person';
select * 
from Person;

\! echo 'Employee';
select * 
from Employee;

\! echo 'Customer';
select * 
from Customer;

\! echo 'Item';
select * 
from Item;

\! echo 'Game';
select * 
from Game;

\! echo 'Console';
select * 
from Console;

\! echo 'Publisher';
select * 
from Publisher;

\! echo 'Order_t';
select * 
from Order_t;

\! echo 'OrderItems';
select * 
from OrderItems
order by ordernumber;
