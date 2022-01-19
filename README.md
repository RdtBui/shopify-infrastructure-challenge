<div id="top"></div>

## Shopify Infrastructure / Site Reliability Challenge - Summer 2022
<pre>
<p align="center">                                                    
 _____ _           _ ___        _____ _       _ _                 
|   __| |_ ___ ___|_|  _|_ _   |     | |_ ___| | |___ ___ ___ ___ 
|__   |   | . | . | |  _| | |  |   --|   | .'| | | -_|   | . | -_|
|_____|_|_|___|  _|_|_| |_  |  |_____|_|_|__,|_|_|___|_|_|_  |___|
              |_|       |___|                            |___|  
</p>
</pre>                                                                                                                                                                           
[Quick Demo](http://34.72.158.92:3000/) hosted with Google Cloud Platform
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
  - [Reason](#reason)
  - [Mechanic](#mechanic)
  - [Metrics](#metrics)
- [Thoughts and Improvements](#thoughts-and-improvements)

## About the Project
Hello! I wanted a challenge so I learned Ruby on Rails by myself in a short amount of time for this project. Don't worry, the code is of high quality. I made sure that the code is clean by keeping scalability, reusability, and best practices in mind. For the sake of simplicity, the project comes with 79 sample log seeds to populate the database. On top of that, 66 tests were written to keep a good quality control. The report feature was implemented with TDD. I even went further and Dockerized the project because Ruby on Rails is a pain to install so you don't have to go through the struggles I did. In case you are not able to do any installation, I hosted the project on Google Cloud Platform for you to have a try in the Quick Demo link above.

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

* [Ruby on Rails](https://rubyonrails.org/) as the backend framework
* [SQLite](https://www.sqlite.org/index.html) as the database
* [Google Cloud Platform](https://cloud.google.com/) for hosting the website with a VM Instance
* [Docker](https://www.docker.com/) as the containerization platform
* [RuboCop](https://rubocop.org/) as the linting tool
* Baggy eyes and hunched back

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

### Prerequisites

Ruby on Rails is known to be difficult to install so the project was Dockerized for ease of installation. The only thing you need to install before starting is Docker. You will also need Git to clone the project.

* [Docker](https://docs.docker.com/get-docker/)
* [Git](https://git-scm.com/downloads)

### Installation
Make sure your Docker Daemon is running if you're using Docker Desktop.

Note: UNIX based operating systems might need to prefix `sudo` in front of commands if asked for permissions. Building the Docker image might take several minutes if it's your first time.
  
1. Clone the repo
   ```
   git clone https://github.com/RdtBui/shopify-infrastructure-challenge/
   ```
2. Navigate to the root directory and build the Docker image and DON'T FORGET the dot at the end
   ```
   docker build -t hire-richard-bui .
   ```
3. Create and start the container from the Docker image
   ```
   docker run -p 3000:3000 hire-richard-bui
   ```
4. Enter `localhost:3000` in the address bar of your browser

<p align="right">(<a href="#top">back to top</a>)</p>

## Tests
There are a total of **66 tests** and **113 different assertions** in the project.
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150077671-b6903584-1d25-4689-8aea-9f7c66e7cf52.png" />
</p>
Three types of tests were written during the project. These include: 

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
    
Note: A lot of unit tests were written to make sure that the validations are effective in preventing errors.

<details><summary>Show Sample Validations</summary>  
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150180802-5533b327-992b-43ee-8202-2676b0c37950.png" />
</p>
</details>

### Running the Tests

The Dockerfile runs the tests when you build it. Please follow these steps if you want to run it manually:
1. Run the container if you haven't already, assuming you already built the Docker image from [Installation](#installation)
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
Example:
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150074389-efb3ea0d-11a1-4d17-821d-89a29839e8bd.png" />
</p>

<details><summary>Alternative Way: Docker Desktop</summary>  
  
1. Run the container in detached mode if you haven't already, assuming you already built the Docker image from [Installation](#installation)
   ```
   docker run -d -p 3000:3000 hire-richard-bui
   ```
2. Access the container's CLI within Docker Desktop
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150192444-d1b72459-6d2f-47f8-9b7f-360dcc0f500d.png" />
</p>
3. Run the command line
 
   ```
   rails test
   ```
</details>
  
<p align="right">(<a href="#top">back to top</a>)</p>

## Usage

The home page should display all the items in your inventory.

<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150082048-03e217a1-05f3-43b4-81e5-791fc5011851.png" />
</p>

You have every component of the **CRUD** actions in the first page where the buttons under Actions should be able to `Show`, `Edit`, and `Destroy` the corresponding inventory item. You should be able to create a new inventory item by clicking on the `Add Item` at the bottom left corner of the table. The `Reports` button next to it will bring you to the report feature implemented.

<p align="right">(<a href="#top">back to top</a>)</p>

## Feature
> Ability to generate a report on inventory levels over time, like: most in-stock or out-of-stock last month

The report table is able to display various metrics, including most in-stock and out-of-stock for each month of the selected year.
<p align="center">
  <img src="https://user-images.githubusercontent.com/43472079/150085876-10d6918f-0201-4a03-8bab-cbebc248ccab.png" />
</p>

### Reason
I believe that this feature would give you a glimpse of my analytical skills.

### Mechanic
The report is based off of the logs generated whenever an item is created or edited. In normal time, they would be timestamped with the date of execution but a few logs for the year 2021 has been seeded for demonstration purposes.  These logs would then be extracted in the report model and compiled into different metrics. Am improvement of the feature can be easily made which is described in the [Thoughts and Improvements](#thoughts-and-improvements) section.

### Metrics
- Most Stocked Item
  - Item with the highest quantity at any given log time within the month. If the item quantity went from 10 to 5 within the month, the higher quantity will be considered against others
- Highest Revenue
  - Item with the highest revenue (quantity x price) at any given log time within the month. If the item revenue went from (12 x 4.99) to (3 x 4.99) within the month, the higher one will be considered against others
- Most Stocked Brand*
  - Brand with the most stocked item within the month
- Most Stocked Category*
  - Category with the most stocked item within the month
- Least Stocked Item
  - Opposite of Most Stocked Item
- Lowest Revenue
  - Opposite of Highest Revenue
- Least Stocked Brand*
  - Opposite of Most Stocked Brand
- Least Stocked Category*
  - Opposite of Most Stocked Category
  
*If an item was logged more than once within the month (e.g.: quantity was edited multiple times), then the average of the quantities will be calculated for the same item.

<p align="right">(<a href="#top">back to top</a>)</p>

## Thoughts and Improvements

There were a good deal of problems that came up during the building of the project such as the CRLF break type that Windows uses. The project was built on a Linux machine which uses LF but when it was tested on a Windows machine, the OS couldn't recognize the symbol and Docker would fail to host the server. My implemented solution was to add a line in the .gitattributes file that would normalize line endings in the repository when cloned. Overall, there were challenges on top of challenges but they were all solved in a eloquent way. It was a good and fun learning experience for me.

Some ideas I could do for next time:
- For a better report, an automatic daily log of the inventory should be performed.
- Allow an item to have multiple categories with a many-to-many association with a table containing the relationship between item_id to category_id.
- Add a limit of character to SKU. Right now it doesn't have a limit because [Shopify](https://www.shopify.ca/encyclopedia/stock-keeping-unit-sku) mentioned that the SKU can be anything that company wishes it to be as long as it's unique within the company. In theory, the SKU can be a huge string. With that, another improvement would be to make the SKU unique within the company. Right now it's only unique across all companies like an UPC.
- Snapshot the report to keep a history of events.
- If this was an actual product, it would be best to get in touch with the merchandiser to build better metrics according to their needs.


<p align="right">(<a href="#top">back to top</a>)</p>

Thanks for reading this far!
