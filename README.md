<div id="top"></div>

## Shopify Infrastructure / Site Reliability Engineering Intern Challenge - Summer 2022

## Table of Contents

- [About the Project](#about-the-project)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Tests](#tests)
  - [Running the Tests](#running-the-tests)
- [Usage](#usage)
- [Feature](#feature)
- [Thoughts and Improvements](#thoughts-and-improvements)

## About the Project
LINTING  seed wanted to challenge myself with ruby on rails
<p align="right">(<a href="#top">back to top</a>)</p>

### Built With
The main tools used to build the project are
* [Ruby on Rails](https://rubyonrails.org/) as the backend framework
* [SQLite](https://www.sqlite.org/index.html) as the database
* [Docker](https://www.docker.com/) as the containerization platform
* [RuboCop](https://rubocop.org/) as the linting tool
* Baggy eyes and hunched back

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

### Prerequisites

Ruby on Rails is known to be difficult to install so the project was Dockerized for ease of installation. The only thing you need to install before starting is [Docker](https://docs.docker.com/get-docker/). You will also need [git](https://git-scm.com/downloads) to clone the project.

### Installation
With Docker installed, follow these commands to run the server. Note: UNIX based operating systems might need to prefix `sudo` in front of commands if asked for permissions. Make sure your Docker Daemon is running if you're using Docker Desktop.

<details><summary>macOS and Linux</summary>
  
1. Clone the repo
   ```
   git clone https://github.com/RdtBui/shopify-infrastructure-challenge/
   ```
2. Build the Docker image and DON'T FORGET the dot at the end
   ```
   docker build -t hire-richard-bui .
   ```
3. Create and start the container from the Docker image in a detached mode
   ```
   docker run -d -p 3000:3000 hire-richard-bui
   ```
4. Enter `0.0.0.0:3000` in the address bar of your browser
</details>

<details><summary>Windows</summary>
  
If this is your operating system, sorry. You will need to do some extra steps.

1. Clone the repo
   ```
   git clone https://github.com/RdtBui/shopify-infrastructure-challenge/
   ```
2. Comment out line 20, 21, and 22 from the Dockerfile as shown
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150080063-afea3c92-d359-4d56-8e4f-79cbaaad005e.png" />
</p>

3. Create and start the container from the Docker image in a detached mode
   ```
   docker run -d -p 3000:3000 hire-richard-bui
   ```
4. Find the name of your container
   ```
   docker ps
   ```
5. Run the DB migrations on the container by replacing <your_container_name> with the name of the `hire-richard-bui` container. 
   ```
   docker exec <your_container_name> rails db:migrate RAILS_ENV=test
   ```
   ***See picture in [Running the Tests](#running-the-tests) for a better understanding***
   
6. Do the same with the following command to populate the database with the seeds
   ```
   docker exec <your_container_name> rails db:seed
   ```
7. Enter `0.0.0.0:3000` in the address bar of your browser
</details>
  
## Tests
There are a total of **66 tests** and **113 different assertions** in the project.
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150077671-b6903584-1d25-4689-8aea-9f7c66e7cf52.png" />
</p>
Many types of tests were written during the project because I believe that tests are essential for keeping a project robust. These includes: 

1. Unit tests (test > models)
    - item_test.rb
    - log_test.rb
    - report_test.rb
2. Functional tests (test > controllers)
    - items_controller_test.rb
    - logs_controller_test.rb
3. Integration tests (test > integration)
    - create_item_test.rb
    - delete_item_test.rb
    - edit_item_test.rb

### Running the Tests
  
The Dockerfile runs the tests when you build it. Please follow these steps if you want to see the tests again:
1. Run start the container in detached mode if you haven't already, assuming you already built the Docker image
   ```
   docker run -d -p 3000:3000 hire-richard-bui
   ```
2. Find the name of your container
   ```
   docker ps
   ```
3. Run the tests on the container by replacing <your_container_name> with the name of the `hire-richard-bui` container
   ```
   docker exec <your_container_name> rails test
   ```
Example to run the tests:
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150074389-efb3ea0d-11a1-4d17-821d-89a29839e8bd.png" />
</p>

<p align="right">(<a href="#top">back to top</a>)</p>

## Usage

The home page should display all the items in your inventory.

<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150082048-03e217a1-05f3-43b4-81e5-791fc5011851.png" />
</p>

You have every component of the **CRUD** actions in the first page where the buttons under Actions should be able to `Show`, `Edit`, and `Destroy` the corresponding inventory item. You should be able to create a new inventory item by clicking on the `Add Item` at the bottom left corner of the table. The `Reports` button next to it will bring you to the report feature implemented.

<p align="right">(<a href="#top">back to top</a>)</p>

## Feature
Chosen feature:
> Ability to generate a report on inventory levels over time, like: most in-stock or out-of-stock last month
  
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150085876-10d6918f-0201-4a03-8bab-cbebc248ccab.png" />
</p>
<p align="right">(<a href="#top">back to top</a>)</p>

## Thoughts and Improvements

Some improvements I could do for the next time:
- improve


<p align="right">(<a href="#top">back to top</a>)</p>

Thanks for reading this far!
