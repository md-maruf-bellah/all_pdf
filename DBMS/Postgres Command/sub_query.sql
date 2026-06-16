-- Sub Queries

-- Which book is the most expensive?
select * from books where price = (
  select max(price) from books
)
-- select max(price) from books = 900 <  select max(price) from books = 950-> x
-- Which book has the second highest price?
select * from books 
where price = (
   select max(price) from books 
   where price < (
    select max(price) from books
   ) 
)

-- Which books have a price higher than the average price?
select title from books
where price > (
  select avg(price) from books
)








