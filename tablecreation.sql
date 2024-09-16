--CREATE DATABASE FUFU_Republic--

CREATE TABLE Branches (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    location VARCHAR(255) NOT NULL
);

CREATE TABLE MenuItems (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE Inventory (
    id SERIAL PRIMARY KEY,
    branch_id INT NOT NULL REFERENCES Branches(id),
    menu_item_id INT NOT NULL REFERENCES MenuItems(id),
    quantity INT NOT NULL CHECK (quantity >= 0),
    reorder_level INT NOT NULL CHECK (reorder_level >= 0),
    last_restocked TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES Customers(id),
    branch_id INT NOT NULL REFERENCES Branches(id),
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10, 2) NOT NULL CHECK (total_amount >= 0),
    payment_method VARCHAR(255) NOT NULL,
    order_type VARCHAR(255) NOT NULL
);

CREATE TABLE OrderDetails (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES Orders(id),
    menu_item_id INT NOT NULL REFERENCES MenuItems(id),
    quantity INT NOT NULL CHECK (quantity > 0),
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE AD_Details (
    id SERIAL PRIMARY KEY,
    branch_id INT NOT NULL REFERENCES Branches(id),
    promo_description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE CustomerADs (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES Customers(id),
    promotion_id INT NOT NULL REFERENCES Promotions(id),
    date_sent TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SupplierInventory (
  id serial [pk]
  supplier_id int 
  menu_item_id int 
  quantity_supplied int not null
  supply_date timestamp not null default CURRENT_TIMESTAMP
;)

CREATE TABLE Suppliers (
  id serial [pk]
  name varchar(255) not null
  contact_name varchar(255)
  contact_phone varchar(15)
  contact_email varchar(255)
  address text
)