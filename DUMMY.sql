CREATE DATABASE DATA1;
USE DATA1;
 CREATE DATABASE DATA7;
 DROP DATABASE DATA2;
USE DATA7;
CREATE TABLE Seller (
    SellerID INT AUTO_INCREMENT PRIMARY KEY,
    SELLER_Name VARCHAR(255)
);
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    cat_Name VARCHAR(255)
);
CREATE TABLE SubCategory (
    SubCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    sub_Name VARCHAR(255)
    #CategoryID INT
   # FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

ALTER TABLE Product MODIFY Link VARCHAR(600);
CREATE TABLE Product (
	ProductID VARCHAR(255) PRIMARY KEY,
    Title VARCHAR(255),
    Link VARCHAR(600),
    Price DECIMAL(10, 2),
    Rating FLOAT,
    ImageLink VARCHAR(255),
    About TEXT
    #SellerID INT,
    #SubCategoryID INT
    #FOREIGN KEY (SellerID) REFERENCES Seller(SellerID),
    #FOREIGN KEY (SubCategoryID) REFERENCES SubCategory(SubCategoryID)
);
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
   # ProductID VARCHAR(255)
    Review TEXT
    #FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
CREATE TABLE ExtraImages (
    ImageID INT AUTO_INCREMENT PRIMARY KEY,
   # ProductID VARCHAR(255),
    ImageLink VARCHAR(255)
    #FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

# Create Temporary Tables with Foreign Keys
CREATE TEMPORARY TABLE TempSeller (
  SellerID INT AUTO_INCREMENT PRIMARY KEY,
  SELLER_Name VARCHAR(255)
);
CREATE TEMPORARY TABLE TempCategory (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    cat_Name VARCHAR(255)
);

CREATE TEMPORARY TABLE TempSubCategory (
  SubCategoryID INT AUTO_INCREMENT PRIMARY KEY,
  sub_Name VARCHAR(255),
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES TempCategory(CategoryID)
);

CREATE TABLE TempProduct (
  ProductID VARCHAR(255) PRIMARY KEY,
  Title VARCHAR(255),
  Link VARCHAR(600),
  Price DECIMAL(10, 2),
  Rating FLOAT,
  ImageLink VARCHAR(255),
  About TEXT,
  SellerID INT,
  SubCategoryID INT,
  FOREIGN KEY (SellerID) REFERENCES Seller(SellerID),
  FOREIGN KEY (SubCategoryID) REFERENCES SubCategory(SubCategoryID)
);

CREATE TEMPORARY TABLE TempReviews (
  ReviewID INT AUTO_INCREMENT PRIMARY KEY,
  ProductID VARCHAR(255),
  Review TEXT,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TEMPORARY TABLE TempExtraImages (
  ImageID INT AUTO_INCREMENT PRIMARY KEY,
  ProductID VARCHAR(255),
  ImageLink VARCHAR(255),
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

# Copy Data to Temporary Tables
# (Replace 'your_database_name' with your actual database name)
INSERT INTO TempSeller (SELLER_Name) SELECT SELLER_Name FROM your_database_name.Seller;

INSERT INTO TempSubCategory (sub_Name, CategoryID) SELECT sub_Name, CategoryID FROM your_database_name.SubCategory;

INSERT INTO TempProduct (ProductID, Title, Link, Price, Rating, ImageLink, About)
SELECT ProductID, Title, Link, Price, Rating, ImageLink, About FROM DATA7.Product ;
insert into TempProduct(SellerID)
SELECT SellerID from DATA7.Seller;

INSERT INTO TempReviews (ProductID, Review) SELECT ProductID, Review FROM your_database_name.Reviews;

INSERT INTO TempExtraImages (ProductID, ImageLink) SELECT ProductID, ImageLink FROM your_database_name.ExtraImages;

# Drop Original Tables
DROP TABLE your_database_name.Seller;
DROP TABLE your_database_name.SubCategory;
DROP TABLE your_database_name.Product;
DROP TABLE your_database_name.Reviews;
DROP TABLE your_database_name.ExtraImages;
#DATA 7
# Rename Temporary Tables to Original Names
drop TABLE TempProduct;
RENAME TABLE TempSubCategory TO SubCategory;
RENAME TABLE TempProduct TO Product;
RENAME TABLE TempReviews TO Reviews;
RENAME TABLE TempExtraImages TO ExtraImages;


use DATA4;
KILL 15;
hehe
(SELECT * FROM SubCategory LIMIT 0, 4900)
SHOW FULL PROCESSLIST;
SELECT * FROM Category;
delete from Category;
SELECT * FROM Reviews ;
SELECT * FROM ExtraImages;
ALTER TABLE Reviews,
DROP TABLE Reviews
drop COLUMN  ProductID;


SELECT user FROM mysql.user;

-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Delete all rows from the Seller table
DELETE FROM Reviews ;

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE SubCategory
ADD COLUMN CategoryID INT,
ADD FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);
UPDATE SubCategory sc
JOIN Category c ON sc.sub_Name = c.cat_Name
SET sc.CategoryID = c.CategoryID
WHERE sc.SubCategoryID > 0; 

