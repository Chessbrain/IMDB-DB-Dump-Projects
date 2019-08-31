## Data Warehouse Project

This project will be split into two different projects: ETL and Cube.

Due to the small size of the database (small number of tables that hold useful data), there is not a lot you can work with.

### This solution
I have created five Dimensions and one Fact table: 

 - DimGenre
 - DimDirector
 - DimWriter
 - DimDate
 - DimTitleType
 - FactRatings

The solution focuses on answering questions such as:

 - What genre had the best ratings of all time (or in a specific year)
 - Which Director/Writer consistently created well rated movies or series
 - Which combination of Director and Writer produced the most consistent good ratings
 - What genres perform badly (in a specific year) therefor, are probably a bad investment

↑ Just to give a few examples. I have also opted to used a [Star Schema](https://docs.microsoft.com/en-us/power-bi/guidance/star-schema) over [Snowflake](https://docs.microsoft.com/en-us/analysis-services/multidimensional-models-olap-logical-dimension-objects/dimensions-introduction) mainly because there was no need to over complicate, and my solution overall required no extra connections between the tables.

### Hierarchies 
The Cube solution will be missing hierarchies, simply because there is no hierarchy. Dates in the database are only on the [Year] level and there are no data sets that require hierarchies.

### DW Schema
The DW_Schema.sql file will create the DW Dim and Fact tables including their FK constraints.

### Time Dimension
You may have noticed that the DimDate table only has [Year] as an attribute. Some of you may be wondering why the granularity level wasn't reduced to include at least a month, that's because the database dump itself lacks that info. Therefor, there was no reason to generate useless data.
