Vending-Machine Tech Test (Onfido)
==================
[![Build Status](https://travis-ci.org/bpourian/vendingmachine-TDD.svg?branch=master)](https://travis-ci.org/bpourian/vendingmachine-TDD)

Brief Summary of Approach
-------
I chose Ruby to build this app, and used the `pg` gem to interact with a PostgreSQL database. I test drove the development using RSpec focusing on testing behaviour of my methods.

I used Rubocop static code analyzer and SimpleCov code coverage analysis tool for Ruby to maintain 100% test coverage and cleaner syntax. I have also setup Travis CI to build the application on every push. You can access this by clicking the build logo on the top left hand corner.

See more on my approach <a href='#approach'>below</a>.

Instructions
-------

Clone this repository in your directory
```
$ git clone https://github.com/bpourian/vending-machine-2.git
```
Change directory
```
$ cd vending-machine-2
```
Run 'bundle' to ensure you have all the libraries
```
$ bundle
```
Create your databases by running the command(assuming you have PostgreSQL installed already)
```
$ rake setup
```
This will create two databases one for test and the other for dev environment. Once that's done it will also create
the relevant tables with correct data columns
Easiest way to confirm setup is to run RSpec
```
$ rspec
```
You should see all tests green

To use the app:
```
$ irb

2.4.1 :001 > require './app'

```
To see available commands simply type the following in `irb`
```
2.4.1 :002 > show_commands
```
This will print commands available to you at this stage of development

N.B. requires ruby version 2.4.1 and the bundler gem.

User Stories
---------
```
----------MVP V1----------

As a User
So that I can decide what I want from the vending machine
I would like to be able to see list of items

As a User
So that I can interact with the vending machine
I would like to be able to make a selection


As a User
So that I can pay the correct amount
I would like to see how much my snack costs

As a User
So that I can purchase my snack
I would like to pay for my snack

As a User
So that I am not owed any money
I would like to receive the correct change

As a User
So that I know, if I have paid insufficient funds
I would like to be prompted with the correct amount I owe
```

```
----------MVP V2----------

As a User
So that I can stock the vending machine
I would like to load it with products

As a User
So that the vending machine can return change
I would like to load it with change
```
```
----------MVP V3----------
As a User
So that I can see the vending machine products all the time
I would like to be able to reload the products at a later point

As a User
So that I can see how much change the vending machine contains all the time
I would like to be able to reload the change at a later point
```

```
----------MVP V4----------
As a User
So that I can see what products are remaining
I would like to see quantity of each item

As a User
So that I can see how much change is left in the vending machine
I would like to see list of change available
```

Approach
---------
* I began by outlining the general requirements  in bullet point format and writing down the names of some of the gems and tools required to complete this application.

* Once I had completed that and had a better idea of what I wanted to do, I began to diagram the classes I needed in my code and the methods within them (picture below). Although from experience I knew there was only so much diagraming I could have done at this stage.

* Next I proceeded onto to writing out user stories and ensuring I had a good understanding of the requirements. At this point I had decided what my MVP was going to be, so I could have a milestone in mind.

* I test drove the development by writing failing tests for the VendingMachine class and implemented each method in the TDD as I went along.

* I started with very simple steps not to over complicate things with the view that I could refactor later and make additional changes required.

* I regularly kept an eye on Rubocop and SimpleCov to ensure consistency of my code.

* Once I had achieved my MVP V1 and V2 I was ready to start with the database.


Improvements
------
* I am not entirely happy with feature test for Interface class. I feel that I have some redundant tests. I Would say this is an area which I need to learn more about. Main point I need to look at is the behaviours the particular methods in this class perform. At this stage they are delegating and passing messages on. Since the underlying code which is being injected in from the VendingMachine class has already been tested having additional tests can seem a bit redundant.

* I introduced Travis CI but was failing to get it to create the correct tables and hence my tests were failing on Travis. Given more time I would like to debug this and make sure that the correct table is created at the beginning of each test.

Initial diagram
----------

![Screenshot-2](img/diagram.png)
