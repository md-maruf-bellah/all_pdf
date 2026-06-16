-- Functions

-- Create function to calculate average price of books
create function book_avg_price()
returns int
language sql
as
$$
   select avg(price) from books
$$

select book_avg_price()

-- Function to delete a book by id
create function book_book(bookId int)
returns void
language sql
as
$$
  delete from books where id=bookId
$$

select book_book(17)

-- Procedures

-- Create procedure to delete a book by id
create procedure delete_book_by_id(bookId int)
language plpgsql
as
$$
  begin
  delete from books where id=bookId;
  end;
$$

call delete_book_by_id(6)

-- Create procedure to update stock based on category and stock condition 

create procedure update_stock_2(b_category varchar,b_stock int)
language plpgsql
as 
$$
   declare
    total_book int;
   begin
   select count(stock) into total_book from books
   where category = b_category and total_book < b_stock; 

   update books set stock = stock+100
   where category = b_category and total_book < b_stock; 
   end;
$$

call update_stock_2('Web',30)









