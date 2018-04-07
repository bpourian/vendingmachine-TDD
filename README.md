Vending-Machine Tech Test (Onfido)
==================
[![Build Status](https://travis-ci.com/bpourian/vending-machine.svg?token=pbZE7sGYsn5RyUv9ZzzN&branch=master)](https://travis-ci.com/bpourian/vending-machine)


Brief Summary of Approach
-------
I chose Ruby to build this app, and used the pg gem to interact with a PostgreSQL database. I test drove the development using RSpec focusing on testing behaviour of my methods. This was my first time interacting with PostgreSQL using the `PG` gem and I found that I ran out of time and couldn't complete the full test.

I used Rubocop static code analyzer and SimpleCov code coverage analysis tool for Ruby to maintain 100% test coverage and cleaner syntax. I have also setup Travis CI to build the application on every push. You can access this by clicking the build logo on the top left hand corner.

In hindsight I would have taken a slightly different approach to storing data in my database and used DataMapper which I was more familiar with. However, I wanted to try something new and the `pg` gem is simple enough to use. But unfortunately I couldn't implement all the features as I ran out of time. I have managed to complete the features up to the user story where product data can be stored on the database.

See more on my approach <a href='#process'>below</a>.

Instructions
-------

Clone this repository in your directory
```
$ git clone https://github.com/bpourian/vending-machine.git
```
Change directory
```
$ cd vending-machine
```
Run 'bundle' to ensure you have all the libraries
```
$ bundle
```

You will need to create a local databases 'vending_machine_test' and 'vending_machine_dev' in PostgreSQL and create the required tables using:
```
$ CREATE TABLE ratings(Id INTEGER PRIMARY KEY, Product VARCHAR(20), Price INT);
```

To test run 'rspec'
```
$ rspec
```

N.B. requires ruby version 2.4.1 and the bundler gem

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
```
```
As a User
So that I can see how much change the vending machine contains all the time
I would like to be able to reload the change at a later point
```

```
As a User
So that I can see what products are remaining
I would like to see quantity of each item
```

```
As a User
So that I can see how much change is left in the vending machine
I would like to see list of change available
```

Process
---------
* Whilst the test was very simple and considering I had made a lot of challenging applications in the past it
was not easy to remain calm and not panic. I began by reading the spec and trying the write down the steps required to complete this challenge.

* Once I had completed that and had a better idea of what I wanted to do, I began to diagram the classes I needed in my code and the methods within them (picture below). Although from experience I knew there was only so much diagraming I could have done at this stage.

* Next I proceeded onto to writing out user stories and ensuring I had a good understanding of the requirements. I even sent an email to Alfred to clarify a particular question I had. At this point I also decided what my MVP was going to be, so I could have a milestone in mind and not panick if time was running out.

* I test drove the development by writing failing test for the VendingMachine class and implemented each method in the TDD as I went along.

* I started with very simple steps not to over complicate things with the view that I could refactor later and make additional changes required.

* I regularly kept an eye on Rubocop and SimpleCov to ensure consistency of my code.

* Once I had achieved my MVP V1 and V2 I was ready to start with the database. However, I was enjoying learning about the `pg` gem too much and failed to finish the test within allocated time.

* Given more time I would have liked to completed the following;

  - complete the storage of products
  - complete the storage of change for the Vending Machine
  - Setup a rake file to ensure the db is cleaned after every test along with migration and upgrade of the db

* I would love to discuss my approach in more detail and talk about what I have done so far, thank you for looking at my code.

Initial diagram
----------

![Screenshot-2](img/diagram.png)
