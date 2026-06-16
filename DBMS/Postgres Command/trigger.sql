-- Trigger section

-- Create a log table to store deleted book records
 create table books_log(
   id serial primary key,
   book_name text,
   action varchar(255)
 )

-- Create a trigger that runs AFTER DELETE on books table
create trigger save_logs
after update
on books
for each row
execute function logs()

-- Create a trigger function logs()
create function logs()
returns trigger
language plpgsql
as
$$
  begin
   insert into books_log (book_name,action) values(old.title,'update');
   return old;
  end;
$$

update books
set category='Web' where id=9





DROP TRIGGER IF EXISTS save_logs3 ON books;
DROP FUNCTION IF EXISTS logs3();



