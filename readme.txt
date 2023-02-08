ReadMe file      DBMS Assignment 	 IIITH-SEDS-Part A_July 21
Oct 24, 2021	Student: Jophy Joseph

This file explains the file and code organisation and each of the tasks assigned

M01-Project03-Ecommerce-Data-Storage has 2 folders - config and src
./src   has 3 python files - main.py, setup.py and database.py
./config has 4 .csv files that contains data to be inserted to the 4 tables
this readme.txt and the table_create.sql file are placed directly under the main folder(M01-Project03-Ecommerce-Data-Storage)
I have used mysql connector.

The tables and columns have been created as per the ER diagram. (script also in table_create file). The csv file needed some column name changes
which were edited accordingly. The database was also created via MySQL workbench.

Tasks 1(a.) and 1(b.) ..schema and table creation were done using MySQL workbench. The creation script is included in the zip file.

Now I will explain each of the python code files and changes done in them
1.) setup.py : 2 generic methods  are added . Has driver code for Task 2(a.) Talks to database.py
 (a.) csv_file_read(relative_cfg_path, table_name) - this reads the 'table_name'.csv file and returns the data as a list of tuples
 (b.) prepare_sql_stat(data, db, table_name) - this  prepares the insert statement  for the given table takes data from list object created in the csv_file_read() method
		# the first row is popped out which contains the column headers and used to build the insert statement
		# assumption -- at least one data row exists for each table
Driver code:
Establishes connection to the server using the credentials given.
Inserts data into all the  4 tables (Task 2(a.)) - using insert_many_rows() method from database.py

2.)database.py -  implemented 6 methods and each has error handling code
 (a.) create_server_connection(host_name, user_name, user_password).....for server connection 
 (b.) create_db_connection(host_name, user_name, user_password, db_name) -- for database conection
 (c.) create_table(connection, query) -- method to perform table creation
 (d.) insert_single_row(connection, query): --  method to perform single data point insertion
 (e.) select_query(connection, query) -- retrieving the data from the table based on the given query
 (f.) insert_many_rows(connection, sql, val): -- help us to inert multiple records using a single instance

3.) main.py -- has driver code for tasks 2(b.) through 3(c.). Talks to databse.py for all CRUD operations and connections
Driver code:
Establishes connection to the server using the credentials given.

(a.) Task 2(b.) - logic to perform at least 5 insert operations in the orders table
sql statement is prepared combining column names string and %s string
a list of 5 tuples with values created
the  insert_many_rows() method used

(b.) Task 2(c.) - read method that should fetch all the records that are available in the orders table and print on console
select query created 
select_query() method used and result fetched, printed row-wise 

(c.) Task 3(a.) - Use the data fetched in the previous task to find the maximum and minimum value order
the total_value from the first record used as initialization for max and min
iterate over each element in the fetch result and identify the max and min order values
print out the values along with the entire record

(d.) Task 3(b.) - Find and print all the order details with total_value more than the average order value
 First find the average total value  ..SELECT avg(total_value) FROM orders
 Use this sub-query in the where condition of the main query ... SELECT * FROM orders WHERE total_value > (sub_query)
 entire query passed to select_query() method  and result fetched, printed row-wise 

(e.) Task 3(c.) - Create a new table named customer_leaderboard and insert the highest ordered purchase for each customer
 create the new table with the given attributes and cutomer_id as PK using the create_table() method
 fetch the highest ordered purchase for each of the registered customers - this has 2 queries
 sub_query : SELECT max(total_value) FROM orders  GROUP BY customer_id
 main_query: SELECT c.customer_id, order_id, total_value, customer_name, customer_email FROM  customers c, orders o where c.customer_id = o.customer_id and total_value  in"
 Single select query created 
 select_query() method used and result fetched, printed row-wise  

finally server connection is closed
    










  
