# IMDB Database Dump Projects

Welcome to my public projects related to IMDBs database dumps :) Here is what this project will cover:

* **[Turning IMDB's DB dump into a relational database](https://github.com/Chessbrain/IMDB_RelationalDB_Project/tree/master/Relational%20IMDB)**
* **[Creating the Data Warehouse](https://github.com/Chessbrain/IMDB-DB-Dump-Projects/tree/master/Data%20Warehouse)**

To make it easier to traverse this project as it gets bigger, I am going to put links to quickly go to the sections you want to.

**Where to get the data, how to import it, including the idea of the relational model solution are in the "How to get started" and "Explanation of the solution" sections**

Below are links to get you quickly to the destinations you require. **For the Data Warehouse project I recommend going to the general folder first due to the README. There is important info there**

## Relational Model Project

* **[Title_Type and Cast_Profession Tables' Data](https://github.com/Chessbrain/IMDB_RelationalDB_Project/tree/master/Relational%20IMDB/Included%20Data)**
* **[SELECTs for all tables that require no array splitting](https://github.com/Chessbrain/IMDB_RelationalDB_Project/tree/master/Relational%20IMDB/Simple%20Table%20SELECTs)**
* **[Array Splitters](https://github.com/Chessbrain/IMDB_RelationalDB_Project/tree/master/Relational%20IMDB/Splitters)**
* **[Duplicate with no CONSTRAINTs](https://github.com/Chessbrain/IMDB_RelationalDB_Project/tree/master/Relational%20IMDB/NoConstraint%20Duplicate)**

## Data Warehouse Project

* **[ETL](https://github.com/Chessbrain/IMDB-DB-Dump-Projects/tree/master/Data%20Warehouse/IMDB_ETL)**
* **[Cube](https://github.com/Chessbrain/IMDB-DB-Dump-Projects/tree/master/Data%20Warehouse/IMDB_Cube)**
* **[DimDate Generation](https://github.com/Chessbrain/IMDB-DB-Dump-Projects/tree/master/Data%20Warehouse/Generate%20%5BYears%5D%20for%20%20DimDate)**

## How to get started

Here is IMDB's simple documentation on their DB dump:
http://www.imdb.com/interfaces/

And here's their link from which you can download all the .tsv files:
https://datasets.imdbws.com/

Keep in mind this Database is roughly around 5Gb after we’re done with our solution. This is not accounting to other testing tables you might create. So, keep at least 10Gb free on your PC for this project.
First, create a testing database, it can be a tempDB it can be an actual database, it’s up to you.

Unfortunately (although justified) this dump is not their full database. So, you will come across some weird issues when importing.
First of all, how to import the tsv files onto SQL Server as actual tables: 

![import1](https://user-images.githubusercontent.com/35179176/34650729-09fe53f6-f3c6-11e7-8751-8b8275956e99.png)

Although you are importing a flat file, in this case tsv (tab separated value), we will go with the ‘Import Data…’ option.  
Reason being, is that the 'Import Flat File' option does not allow you to change how SQL Server will deal with strings that you are importing. And if you try to do it without changing that, it will always give you an error and won’t work.

![import2_1](https://user-images.githubusercontent.com/35179176/34650736-39eaaab0-f3c6-11e7-9706-377c5f0f1170.png)

After you choose 'Flat File' in the Data Source, and browse to the file you want to import, go into Advanced and mark all columns. The Columns by default are on string[DT_STR], we don’t want that. Change it to the option [DT_TEXT] (not Unicode) or [DT_WSTR] (Preferably WSTR for Unicode/UTF8). The reason, is that STR is varchar and is in ANSI (also has a different size limit). This is a database in UTF8 format, with titles in different languages. So, you don’t want weird characters like these popping up.

![lel](https://user-images.githubusercontent.com/35179176/34650748-6eed71ca-f3c6-11e7-9243-44c8cf24230e.png)

After that you choose your testing database and import it there as a table (done by default).

## Explanation of the solution

This solution is probably extremely inefficient but it was the way I solved it, so if you have any other solutions by all means, share them. 

One of the biggest problems with this database are arrays, if you want to normalize the database you can’t have string arrays. The link up there will lead you to the folder holding all the scripts responsible for splitting all the arrays in the DB.

Depending on how you will solve this, you might be able to convert certain strings to their respective types. But in my solution dates and pretty much all other attributes except for Ratings are done in nvarchar. So most of your tables will have nvarchar as attribute types.

The IMDB_SCHEMA_TABLES script creates all tables and their respective schemas, this will be your “production” database, where your final product will be.

The script for the Title_Crew table runned for around 2 hours on my rig, it outputs around 13.6 milion rows (around 4 million before splitting it). So, keep that in mind.

I have also included two scripts for Title.Type’s and Cast.Profession’s data, so you don’t have to import them, the link for them is up there.

Now for the second problem while importing this database to your real production database:

As mentioned before, this is not the full database… And I am not talking just about the tables, but the data itself. For example: there are more than one million titles included in the name_basics table in the “knownForTitle” attribute that don’t exist in the actual title_basics table (and even more in the title_crew table). So, when you try import data it will never work, it will give you an error that you’re violating the FOREIGN KEY CONSTRAINT.

The way I solved this is probably not the best way possible, but it works. I made in the testDB copies of the production tables but without any of the constraints, joined them together by putting the FOREIGN KEY constraint on the IDENTITY field. But after importing the data, I inner joined them on their tconst and nconst fields. This resulted in consistent data that only exists in all tables in the given database dump.

There is a link up there to take you immediately to the respective folder holding the script

After you import into the dummy tables the data from the tsv tables all you have to do now is write simple SELECT queries with INNER JOIN on the tconst and nconst fields instead of the generated ID.
