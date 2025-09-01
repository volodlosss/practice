CREATE TABLE Clients (
    ClientID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100)
);

CREATE TABLE Tours (
    TourID INT PRIMARY KEY IDENTITY,
    TourName NVARCHAR(100),
    Country NVARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY IDENTITY,
    ServiceName NVARCHAR(100),
    Cost DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    ClientID INT,
    TourID INT,
    OrderDate DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (TourID) REFERENCES Tours(TourID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
