
CREATE DATABASE DATA8;
## DROP DATABASE DATA8;
USE DATA8;
CREATE TABLE Seller (
  SellerID INT AUTO_INCREMENT PRIMARY KEY,
  SELLER_Name VARCHAR(255)
);

(SELECT * FROM ExtraImages LIMIT 0, 4900);
CREATE TABLE Category (
  CategoryID INT AUTO_INCREMENT PRIMARY KEY,
  cat_Name VARCHAR(255)
);

CREATE TABLE SubCategory (
  SubCategoryID INT AUTO_INCREMENT PRIMARY KEY,
  sub_Name VARCHAR(255),
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

#ALTER TABLE Product MODIFY Link VARCHAR(600);

CREATE TABLE Product (
  ProductID varchar(255),  
  Productkey INT AUTO_INCREMENT PRIMARY KEY,  
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

CREATE TABLE Reviews (
  ReviewID INT AUTO_INCREMENT PRIMARY KEY,
   Productkey INT,  
  Review TEXT,
  FOREIGN KEY (Productkey) REFERENCES Product(Productkey)
);

CREATE TABLE ExtraImages (
  ImageID INT AUTO_INCREMENT PRIMARY KEY,
  Productkey int,  
  ImageLink VARCHAR(255),
  FOREIGN KEY (Productkey) REFERENCES Product(Productkey)
);
select * from folderImg;
CREATE TABLE folderImg (
  FImgID INT AUTO_INCREMENT PRIMARY KEY,
  Productkey int,  
  Imagefold VARCHAR(255),
  FOREIGN KEY (Productkey) REFERENCES Product(Productkey)
);
