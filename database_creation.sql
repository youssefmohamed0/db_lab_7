CREATE DATABASE order_processing_system;

USE order_processing_system;

CREATE TABLE `customer`
(
    customer_id INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE `order`
(
    order_id INT NOT NULL,
    order_date TIMESTAMP NOT NULL,
    customer_id INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES `customer`(customer_id)
);

CREATE TABLE `item`
(
    item_id INT NOT NULL,
    unit_price FLOAT(24) NOT NULL,
    PRIMARY KEY (item_id)
);

CREATE TABLE `order_item`
(
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (item_id) REFERENCES `item`(item_id)
);

CREATE TABLE `warehouse`
(
    warehouse_id INT NOT NULL,
    warehouse_city VARCHAR(255) NOT NULL,
    PRIMARY KEY (warehouse_id)
);

CREATE TABLE `shipment`
(
    order_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    ship_date TIMESTAMP NOT NULL,
    PRIMARY KEY (order_id, warehouse_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (warehouse_id) REFERENCES `warehouse`(warehouse_id)
);
