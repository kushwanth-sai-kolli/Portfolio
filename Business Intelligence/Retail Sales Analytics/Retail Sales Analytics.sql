CREATE DATABASE RetailStoreDB;
USE RetailStoreDB;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    JoinDate DATE
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);

-- Stores Table
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(255),
    Region VARCHAR(100)
);

-- Dates table
CREATE TABLE DATES (
	OrderDate DATE PRIMARY KEY
);

-- Orders Table (Fact Table)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    StoreID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- OrderItems Table (Fact Table)
CREATE TABLE OrderItems (
    OrderID INT,
    ProductID INT,
    StoreID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

SET GLOBAL local_infile = 1;
USE RetailStoreDB;
