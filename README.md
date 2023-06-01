# sql

- ###### createschema.sql : Create database schema. Create entities and relationship sets by creating tables. Table names, data types, size and constraints. Set up primary keys and foreign keys. On update cascade, on delete cascade considering the queries for menus
- ###### initdata.sql : insert initial datas in the table considering the data types. create index
- ###### dropschema.sql : drop all tables


### how to execute sql files in cmd)

###### - by connecting to mysql

### 1. install mysql
#### Apply MySQL to Environment Variable Path

### 2. execute mysql in cmd

    C:\USERS>mysql -u root -p
    Enter password: ****
    mysql>create database [database name]
    mysql>use [database name]
    mysql>source [.sql file address]\createschema.sql
    mysql>source [.sql file address]\initdata.sql

####     after executing sql queries, you can drop all tables in the database

    mysql>source [address]\dropschema.sql


###### 23/05/23
