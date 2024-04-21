# README

* Sentia test code.
* Ruunning on:
   ruby "3.1.2"
   Rails 7.0.4
* Database: Mysql


* I implemented using:
 - Basic featured from ruby on rails.
 - the basic scarffolding.
 - Roo gem to import CSV.  I could have just opened the file.
 - will_paginate to paginate.
* I didn't implement the item 4 of part 2.
* I didn't do tests, sorry.

To run:
  - bundle install
  - rake db:migrate
  - rails s
  - http://127.0.0.1:3000/home/index
  - http://127.0.0.1:3000/people 


PART 1
1. As a user, I should be able to upload this sample CSV and import the data into a database.
  
IMPORTER REQUIREMENTS
a. The data needs to load into 3 tables. People, Locations and Affiliations
b. A Person can belong to many Locations
c. A Person can belong to many Affiliations
d. A Person without an Affiliation should be skipped
e. A Person should have both a first_name and last_name. All fields need to be validated except for last_name, weapon and vehiclewhich are optional.
f. Names and Locations should all be titlecased

PART 2
1. As a user, I should be able to view these results from the importer in a table.
2. As a user, I should be able to paginate through the results so that I can see a maximum of 10 results at a time.
3. As a user, I want to type in a search box so that I can filter the results I want to see.
4. As a user, I want to be able to click on a table column heading to reorder the visible results.



