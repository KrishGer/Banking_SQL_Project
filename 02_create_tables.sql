create table customers (
   customer_id int primary key,
   full_name varchar(100) not null,
   email varchar(100) unique,
   city varchar(50),
   created_at date
);
create table Accounts (
   account_id int primary key,
   customer_id int,
   account_type varchar(20),
   balance decimal(12,2),
   status varchar(10),
   foreign key (customer_id) references customers(customer_id)
);
create table transactions (
  transaction_id int primary key,
  account_id int,
  transaction_type varchar(20),
  amount decimal(12,2),
  transaction_date date,
  foreign key (account_id) references accounts(account_id)
);