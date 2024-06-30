
CREATE TABLE Products (
    ProductId INT PRIMARY KEY,
    ProductName NVARCHAR(255),
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2),
    Category NVARCHAR(100) -- Simplify first because it's more on a customer, merchants, and products transaction
    -- Additional fields if needed
);

CREATE INDEX idx_Products_ProductName ON Products(ProductName);


CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    CustomerName NVARCHAR(255),
    Email NVARCHAR(255),
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100)
    -- Additional fields if needed
);

CREATE INDEX idx_Customers_CustomerName ON Customers(CustomerName);

CREATE TABLE Merchants (
    MerchantId INT PRIMARY KEY,
    MerchantName NVARCHAR(255),
    Category NVARCHAR(100),
    Location NVARCHAR(255),
    ContactPerson NVARCHAR(255),
    Phone NVARCHAR(20),
    Email NVARCHAR(255),
    Website NVARCHAR(255),
    EstablishedDate DATE,
    Status NVARCHAR(20) CHECK (Status IN ('active', 'inactive', 'suspended')) DEFAULT 'active'
   -- Additional fields if needed
);

CREATE INDEX idx_Merchants_MerchantName ON Merchants(MerchantName);

--- Tranasctions --

CREATE TABLE Transactions (
    TransactionId INT PRIMARY KEY,
    CustomerId INT,
    MerchantId INT,
    Amount DECIMAL(10, 2),
    TransactionDate DATETIME,
    Status NVARCHAR(20) CHECK (Status IN ('completed', 'pending', 'cancelled')) DEFAULT 'pending',
    PaymentMethod NVARCHAR(100),
    Comments NVARCHAR(MAX),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (MerchantId) REFERENCES Merchants(MerchantId)
    -- Additional fields if needed
);

CREATE INDEX idx_Transactions_CustomerId ON Transactions(CustomerId);
CREATE INDEX idx_Transactions_MerchantId ON Transactions(MerchantId);
CREATE INDEX idx_Transactions_TransactionDate ON Transactions(TransactionDate);

--- A transaction can have one or more item ---

CREATE TABLE TransactionItems (
    TransactionItemId INT PRIMARY KEY,
    TransactionId INT,
    ProductId INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
    -- Additional fields as needed
);

-- Index on TransactionId for efficient transaction-based queries
CREATE INDEX idx_TransactionItems_TransactionId ON TransactionItems(TransactionId);

-- Index on ProductId for efficient product-based queries
CREATE INDEX idx_TransactionItems_ProductId ON TransactionItems(ProductId);
