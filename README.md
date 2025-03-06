# Building-an-Inventory-Database-with-PostgreSQL


## Intro
Built out a database schema that could be used to organize an inventory of mechanical parts. This schema will keep track of all the parts, their manufacturer, category, location in storeroom, available inventory, and other relevant information.

A database like this might be updated and queried by an inventory management application that accepts input from many users who might not be familiar with the database structure. As a result, I made sure that there are sufficient data quality checks to ensure that only valid data can be entered into the database and ensured there was data integrity enforcement.