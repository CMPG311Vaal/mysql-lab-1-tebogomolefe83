mysql> CREATE DATABASE BidvestBank;
mysql> use BIDVESTBANK;

mysql> create table BankBranch
    -> (
    ->        branch_name VARCHAR(20) not null primary key,
    ->        branch_city VARCHAR(20) not null,
    ->        assets INT not null
    -> );
mysql>
mysql> create table Customer
    -> (
    ->      customer_name VARCHAR(20) ,
    ->      customer_street VARCHAR(20) not null,
    ->      customer_city VARCHAR(20) not null
    -> );

mysql>
mysql> create table CustomerAccount
    -> (
    ->        account_number CHAR(20) not null,
    ->        branch_name VARCHAR(20) not null,
    ->        balance double not null
    -> );

mysql> create table Loan
    -> (
    ->        loan_number CHAR(20) not null,
    ->        branch_name VARCHAR(20) not null,
    ->        amount double not null
    -> )
    ->
    -> create table Depositor
    -> (
    ->        customer_name VARCHAR(20) not null ,
    ->        account_number CHAR(20) not null
    -> );

mysql> create table Borrower
    -> (
    ->        customer_name VARCHAR(20) not null,
    ->        loan_number CHAR(20) not null
    -> );

mysql> create table Employee
    -> (
    ->        employee_name VARCHAR(20) ,
    ->        branch_name VARCHAR(20) not null,
    ->        salary DOUBLE not null
    -> );

mysql> insert into BankBranch values('Midrand','Johannesburg',7100000);

mysql> insert into BankBranch values('Newtown','Johannesburg',9000000);

mysql> insert into BankBranch values('Mabopane', 'Pretoria',400000);

mysql> insert into BankBranch values('Belgravia','Kimberly',3700000);

mysql> insert into BankBranch values('Sunnyside','Pretoria',1700000);

mysql> insert into BankBranch values('Amanzimtoti','Durban'300000);

mysql> insert into BankBranch values('Universitas','Bloemfontain',2100000);

mysql> insert into BankBranch values('Mamelodi','Pretoria',8000000);

mysql> insert into Customer values('Modise','Spring','George');

mysql> insert into Customer values('Brooks','Senator','Johannesburg');

mysql> insert into Customer values('Jooste','North','Kimberly');

mysql> insert into Customer values('Lombard','Sand Hill','Nelspruit');

mysql> insert into Customer values('Mokwena','Walnut','Port-Elizabeth');

mysql> insert into Customer values('Johnson','Mmabatho','Mafikeng');

mysql> insert into Customer values('Johnson','Alma','Bloemfontein');

mysql> insert into Customer values('Zwane','Main','Mafikeng');

mysql> insert into Customer values('Lindsay','Park','George');

mysql> insert into Customer values('Smith','North','Kimberly');

mysql> insert into Customer values('Dlamini','Putnam','Port-Elizabeth');

mysql> insert into Customer values('Williams','Nassau','Giyane');

mysql> insert into CustomerAccount values('A-5324','Newtown',500);

mysql> insert into CustomerAccount values('A-5624','Sunnyside',400);

mysql> insert into CustomerAccount values('A-7794','Midrand',900);

mysql> insert into CustomerAccount values('A-4467','Mabopane',700);

mysql> insert into CustomerAccount values('A-3546','Midrand',750);

mysql> insert into CustomerAccount values('A-3453','Universitas',700);

mysql> insert into CustomerAccount values('A-2542','Mamelodi',350);

mysql> insert into Loan values('L-11','Mamelodi',900);

mysql> insert into Loan values('L-14','Newtown',1500);

mysql> insert into Loan values('L-15','Sunnyside',1500);

mysql> insert into Loan values('L-16','Sunnyside',1300);

mysql> insert into Loan values('L-17','Newtown',1000);

mysql> insert into Loan values('L-23','Univesitas',2000);

mysql> insert into Loan values('L-93','Mabopane',500);

mysql> insert into Depositor values('Johnson','A-5624');

mysql> insert into Depositor values('Johnson','A-5624');

mysql> insert into Depositor values('Johnson','A-7794');

mysql> insert into Depositor values('Zwane','A-3546');

mysql> insert into Depositor values('Lindsay','A-3453');

mysql> insert into Depositor values('Smith','A-4467');

mysql> insert into Depositor values('Dlamini','A-2542');

mysql> insert into Borrower values('Modise','L-16');

mysql> insert into Borrower values('Jooste','L-93');

mysql> insert into Borrower values('Johnson','L-15');

mysql> insert into Borrower values('Jackson','L-14');

mysql> insert into Borrower values('Zwane','L-17');

mysql> insert into Borrower values('Smith','L-11');

mysql> insert into Borrower values('Smith','L-23');

mysql> insert into Borrower values('Williams','L-17');

mysql> insert into Employee values('Modise','Sunnyside',1500);

mysql> insert into Employee values('Brown','Sunnyside',1300);

mysql> insert into Employee values('Gopal','Sunnyside',5300);

mysql> insert into Employee values('Johnson','Newtown',1500);

mysql> insert into Employee values('Loreena','Newtown',1300);

mysql> insert into Employee values('Peterson','Newtown',2500);

mysql> insert into Employee values('Rao','Austin',1500);

mysql> insert into Employee values('Sato','Austin',1600);

mysql>
mysql> SELECT account_number, balance
    -> FROM CustomerAccount
    -> WHERE balance < 700;
+----------------+---------+
| account_number | balance |
+----------------+---------+
| A-2542         |     350 |
| A-5324         |     500 |
| A-5624         |     400 |
+----------------+---------+
3 rows in set (0.00 sec)

mysql>
mysql> SELECT customer_name, customer_city
    -> FROM Customer
    -> WHERE customer_city ='Johannesburg';
+---------------+---------------+
| customer_name | customer_city |
+---------------+---------------+
| Brooks        | Johannesburg  |
| Brooks        | Johannesburg  |
| Brooks        | Johannesburg  |
| Brooks        | Johannesburg  |
+---------------+---------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT employee_name, branch_name,salary
    -> FROM Employee
    -> WHERE salary<1500 AND branch_name!= 'Newtown';
+---------------+-------------+--------+
| employee_name | branch_name | salary |
+---------------+-------------+--------+
| Brown         | Sunnyside   |   1300 |
| Brown         | Sunnyside   |   1300 |
| Brown         | Sunnyside   |   1300 |
| Brown         | Sunnyside   |   1300 |
+---------------+-------------+--------+

mysql>
mysql> SELECT employee_name, branch_name, AVG(salary) AS avg_salary
    -> FROM Employee
    ->
    -> SELECT branch_name, MAX(assets)
    -> FROM BankBranch
    ->
    -> SELECT employee_name, branch_name,salary
    -> FROM Employee
    -> WHERE branch_name = 'Sunnyside';
