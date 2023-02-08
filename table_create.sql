CREATE DATABASE `ecommerce_record`;

CREATE TABLE `ecommerce_record`.`customers` (
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ;


CREATE TABLE `ecommerce_record`.`orders` (
  `order_id` INT NOT NULL,
  `total_value` FLOAT NULL,
  `order_quantity` INT NULL,
  `reward_point` INT NULL,
  `customer_id` VARCHAR(10) NULL,
  `vendor_id` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_customer_id_idx_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_id_idx`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ecommerce_record`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `ecommerce_record`.`vendors` (
  `vendor_id` VARCHAR(10) NOT NULL,
  `vendor_name` VARCHAR(45) NULL,
  `vendor_email` VARCHAR(45) NULL,
  `vendor_password` VARCHAR(45) NULL,
  PRIMARY KEY (`vendor_id`));


CREATE TABLE `ecommerce_record`.`items` (
  `product_id` VARCHAR(10) NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `product_description` VARCHAR(100) NULL,
  `product_price` FLOAT NULL,
  `emi_available` VARCHAR(10) NULL,
  `vendor_id` VARCHAR(10) NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_vendor_id_idx_idx` (`vendor_id` ASC) VISIBLE,
  CONSTRAINT `fk_vendor_id_idx`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `ecommerce_record`.`vendors` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



ALTER TABLE `ecommerce_record`.`items` 
DROP FOREIGN KEY `fk_vendor_id_idx`;
ALTER TABLE `ecommerce_record`.`items` 
CHANGE COLUMN `vendor_id` `fk_vendor_id` VARCHAR(10) NULL DEFAULT NULL ;
ALTER TABLE `ecommerce_record`.`items` 
ADD CONSTRAINT `vendor_id_idx`
  FOREIGN KEY (`fk_vendor_id`)
  REFERENCES `ecommerce_record`.`vendors` (`vendor_id`);


ALTER TABLE `ecommerce_record`.`orders` 
ADD CONSTRAINT `fk_vendor_id_idx`
  FOREIGN KEY (`vendor_id`)
  REFERENCES `ecommerce_record`.`vendors` (`vendor_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
