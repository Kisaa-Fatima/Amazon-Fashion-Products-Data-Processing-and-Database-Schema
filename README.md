# Amazon-Fashion-Products-Data-Processing-and-Database-Schema

This repository contains the code and instructions for preprocessing, cleaning, and storing Amazon fashion product data in a MySQL database. The project builds on data collected in a previous assignment, focusing on ensuring data quality, handling image data, and designing a normalized database schema.

## Objective
- Data Preprocessing and Cleaning: Ensure the quality and consistency of the collected JSON data.
- Image Data Handling: Efficiently download, store, and link product images.
- Database Schema Design: Create a normalized relational database schema.
- Data Insertion and Querying: Insert the cleaned data into the MySQL database and handle image links appropriately.
## Requirements
Python 3.x
Numpy
Pandas
Matplotlib
NLTK
MySQL
Selenium (for any additional data scraping)


## Install:
Ensure MySQL is installed and running on your system.
Create a database named amazon_fashion.
Update the config.py file with your MySQL username, password, and database name.
## Data Preprocessing and Cleaning
The preprocessing and cleaning steps are implemented in data_preprocessing.py
**Cleaning Steps:** 
**Handling Missing Values:**
- Ratings: Filled missing values with the mean rating.
- Price: Removed special characters from price values.
- Description: Cleaned and standardized text descriptions.
- Reviews: Labeled reviews based on emojis.
- Images: Created dummy URLs for missing images using product IDs.
- Brand Names: Rescraped brand names or extracted them from product URLs.
**Standardization:**
- Converted text columns to lowercase.
- Tokenized words and phrases.
- Removed punctuation, special characters, and stop words.
- Performed stemming and lemmatization.
- Removed extra white spaces and identified outliers.
**Preprocessing Steps**
                  **Text Data Cleaning:**
- Converted text columns to lowercase.
- Tokenized text data.
- Removed punctuation and special characters.
- Removed stop words.
- Applied stemming and lemmatization.
- Removed extra white spaces.
- Challenges Faced
- Handling a large number of null values without dropping essential data.
- Ensuring the dataset was extensive enough for further analysis and modeling.
- Simplifying data transfer to the database while maintaining data integrity.
- Image Data Handling
- Download product images from URLs.
- Store images efficiently and link them with corresponding products in the database.
## Database Schema Design
The database schema is designed to store numeric data, reviews, and images in an organized and linked manner. The schema includes the following tables:
**Products:**
- product_id
- name
- price
- brand_name
- description
**Colors:**
- color_id
- product_id (foreign key)
- color_name
- description
**Reviews:**
- review_id
- color_id (foreign key)
- rating
- review_text
**Images:**
- image_id
- color_id (foreign key)
- image_url
- The schema ensures data normalization, reduces redundancy, and improves data integrity.

**Data Insertion and Querying**
The script for data insertion and querying is implemented in data_insertion.py.

**Connect to MySQL Database:**
Use the mysql.connector module to connect to the database.
**Insert Data:**

Insert cleaned data into the respective tables.
Handle image links appropriately.
**Query Data:**
Execute SQL queries to retrieve and analyze data
