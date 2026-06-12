-- Create Database
create database library_management

-- Drop Database
drop database book

-- Create Table
create table book(
  id serial primary key,
  title varchar(255) not null,
  author varchar(255) not null,
  isbn bigint unique,
  category varchar(50) not null,
  rating smallint check (rating <=5),
  price numeric(8,2) check(price > 0), 
  isAvailable boolean default true,
  tags text[], 
  metadata jsonb
)
  

-- Delete Table
drop table book

-- Insert Single Record
insert into book(id,title,author,isbn,category,rating,price,tags,metadata)
values (1,'Title - 1','Author - 1','12783468','Category - 1',3,1000,array['Math','Programming'],'{"page" : "2000","bio" : "sdhkgkdbfg"}')

-- Insert Multiple Records
insert into book(title,author,isbn,category,rating,price,tags,metadata)
values 
  ('Title - 1','Author - 1','12783469','Category - 1',3,1000,array['Math','Programming'],'{"page" : "2000","bio" : "sdhkgkdbfg"}'),
  ('Title - 1','Author - 1','12783410','Category - 1',3,1000,array['Math','Programming'],'{"page" : "2000","bio" : "sdhkgkdbfg"}')

-- Insert Record Using Default Auto Increment ID
insert into book(id,title,author,isbn,category,rating,price,tags,metadata)
values (default,'Title - 1','Author - 1','12783471','Category - 1',3,1000,array['Math','Programming'],'{"page" : "2000","bio" : "sdhkgkdbfg"}')

-- View All Records
select * from books

drop table books










