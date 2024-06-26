# Hiking Database Project🌲

This project is designed to explore the basics of MySQL by creating a hiking database. Below you'll find information about the structure of the project, its assignments, and bonus tasks.

## 1. Generic Info

The hiking database consists of 6 tables:

- **Trail**: Stores information about each trail, including name, length, elevation, description, and image. It references the Location table by location_id.
- **Location**: Stores information about locations where trails are located, such as name, country, region, and coordinates.
- **Difficulty**: Stores information about different difficulty levels of trails, such as name and description.
- **Trail_Rating**: Stores user ratings for trails, referencing the Trail, User, and Difficulty tables. 
Ratings range from 0 to 5.
- **Review**: Stores user reviews for trails, referencing the User and Trail tables.
- **User**: Stores information about users of the hiking trail guide, including name, email, password, and profile type.
 
![Image 4](https://github.com/MarharytaFilipovych/Database_Fundamentals/blob/main/pa2/Schema.jpg)

## 2. Project Structure

The project consists of 5 main assignments and bonus tasks:

1. **Assignment 1 & 2**: Created schema, populate data, wrote basic queries, and modified table structures to establish references between tables. Also included basic queries using inner joins. Additional task showed why we should use indexes in big tables.
2. **Assignment 3**: Learnt and practiced correlated and non-correlated subqueries with various operators like IN, NOT IN, EXISTS, etc. Additional C# program interacts with the database using CRUD operations.
3. **Assignment 4**: Learnt to use stored procedures and transactions. Additional C# program demonstrates basic transaction handling.
4. **Assignment 5**: Practice creating views, specifically creating views for trails in Europe and North America ordered by popularity (number of reviews). The columns, which are indicated in SELECT statement are indexed.
The goal of the additional task was to utilize GitLab for version control, create a repository, add it as a remote to the local repository, push data, and demonstrate working with different remotes.

## How to deploy the project:

1. Clone the Repository 📂
2. Set up a MySQL Database 🛠️
3. Set up a connection with my database 🔗
4. Run Provided Queries and Programs:
   Now you can start interacting with the database.
   Use the provided queries and programs to practice MySQL commands and concepts. All queries in the project have comments indicating their purpose, allowing you to understand what each query does.
   You can execute these queries and programs using a MySQL client, command-line interface, or any programming language that supports MySQL connectivity (like the C# program provided).
   Feel free to modify the queries or write your own to interact with the database according to your needs or to further practice MySQL concepts.

## Bonus tasks

### Bonus Task 2: Indexes

Objective: Demonstrate the significance of indexes in improving database search performance.

#### Steps:
1. **Creation of Tables:**
   - **Trail_Imaginary Table:** Initially created with IDs and trail names, populated via ChatGPT.
   - **Trail_Imaginary_Index Table:** has absolutely the same structure  and information as in Trail_Imaginary but with an added index on the `name` column.

2. **Search Performance Comparison:**
   - A simple SELECT query for a trail name is executed on both tables.
   - The query on Trail_Imaginary (without an index) experiences longer execution times as it requires scanning through every row to find the matching trail name.
   - In contrast, the query on Trail_Imaginary_Index (with an index) benefits from the index, resulting in faster search operations by quickly locating the desired row based on the indexed column.

#### SQL queries which I used to check indexes:
```mysql
-- Query without Index
SELECT * FROM trail_imaginary
WHERE name = 'Deer 2054';

-- Query with Index
SELECT * FROM trail_imaginary_index
WHERE name = 'Deer 2054';
```
#### Attached Photos:

![Image 1](https://github.com/MarharytaFilipovych/Database_Fundamentals/blob/main/pa2/bonus.indexes.images/1.png)
![Image 2](https://github.com/MarharytaFilipovych/Database_Fundamentals/blob/main/pa2/bonus.indexes.images/2.png)

### Bonus Task 3: CRUD Operations Using C#

This bonus task demonstrates how to perform CRUD (Create, Read, Update, Delete) operations using C# and MySQL.

The provided C# program establishes a connection to the hiking database and executes basic SQL queries to interact with the database. Here's what each part of the program does:

1. **InsertRecords:** Inserts new records into different tables such as trail, location, trail_rating, user, difficulty, and review.
2. **ReadRecords:** Reads records from the specified table, displaying selected columns for each record.
3. **DeleteRecords:** Deletes records from the specified table based on given conditions.
4. **UpdateRecords:** Updates records in the specified table, setting new values for specified columns based on given conditions.

To use this program:
- Ensure you have the MySQL connector installed in your C# project.
- Launch this program via launch button
- You can replace parameters in methods to retrieve different information according to your needs.

### Bonus Task 4: Transactions Using C#

This C# code demonstrates performing transactions with a MySQL database.

The code establishes a connection to the MySQL database using the provided connection string. It begins a transaction to group multiple SQL statements into a single unit of work. Within the transaction, user email addresses are updated. If all operations within the transaction are successful, it commits the transaction. Otherwise, it rolls back the transaction. The **UpdateUserEmail** method updates a user's email address after checking various conditions such as email uniqueness, length, format, etc. If any condition fails during the email update process, an exception is thrown, and the transaction is rolled back.

To use this program:
1. Launch the C# project containing the provided code
2. Monitor the console output for messages indicating the success or failure of the transaction.
3. If successful, the console should display "Successful!". Otherwise, it will throw an exception indicating your error

### Bonus task 5: 

The objective of this additional task was to _utilize GitLab_ for version control, including creating a repository, adding it as a remote to the local repository, pushing data, and demonstrating working with different remotes.

#### Steps:
* I created repository on GitLab
* The GitLab repository URL was added as a remote to the local repository via command '**git remote add gitlab https://gitlab.com/filipovych_marharyta/Database_FundamentalsGitHub.git**'
* Pushed Data to GitLab Repository using the command '**git push gitlab**' 

![Image 3](https://github.com/MarharytaFilipovych/Database_Fundamentals/blob/main/pa5/gitlab(additional%20task).png)

## Information about author
It was done by Filipovych Marharyta ❤️❤️❤️