# "SIVA" :: a command-line transaction network  
---

## Summary
_SIVA_ is a command-line application built using Ruby and ActiveRecord. It connects merchants and customers via a database that executes and stores transactions. Customers are able to create an account and login to execute transactions and manage other financial details. 

## Features
The overarching purpose of _SIVA_ is to enable customers to log their transactions and glean useful information about their purchases including spending habits and frequent merchants. 
- Login :: use your full name to log into your account
- Create account: :: use your full name to setup your account & receive a _SIVA_ card
- Dashboard :: access main account functionalities
- Settings :: access important account settings
- Transact :: create and execute a transaction under your account name & card number
- Account details :: view important details about your account, like card number & total money spent
- Merchant details :: view the merchants you've made purchases from
- Change name :: update your first/last name & login credentials
- Replace card :: mint a new _SIVA_ card if yours gets lost or is stolen
- Delete transaction :: delete one or multiple transactions from your account 

## Installation
To install _SIVA_ on your local machine, first clone this repository and open it in your text editor. Next, install all the required dependencies: ```bundle install```. You'll then need to setup the database, optionally seeding it with random data from "Faker," a Ruby gem: ```rake db:setup```. This will create the ```card-network.db``` database and seed it with random data generated in ```seeds.rb```. If you adjust any of the tables or migrations, be sure to delete ```schema.rb``` or refresh it using ```rake db:schema:load```.

You're then free to execute ```ruby bin/run.rb``` to run the application, create a _SIVA_ account, and use all the features outlined above. Note that your transactions will be stored locally, as the card-network database is not hosted online. Thus, you are free to play around with new users and random data from "Faker."


## Credits
_- by Jared Shelby_  
_- created June 2022_  
_- project 1 for @flatiron web dev bootcamp_  
  
_- github: https://github.com/jared-shelby/_  
_- linkedin: https://linkedin.com/in/jaredshelby/_
  
---