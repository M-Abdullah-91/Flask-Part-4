CREATE DATABASE IF NOT EXISTS library;
USE library;

DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(50) NOT NULL,
  created_at DATE NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS admin;
CREATE TABLE admin(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  password VARCHAR(45) NOT NULL,
  created_at DATE NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS category;
CREATE TABLE category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    created_at DATE NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


DROP TABLE IF EXISTS books;
CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    category_id INT NOT NULL,
    created_at DATE NOT NULL,
    CONSTRAINT fk_category_id
        FOREIGN KEY (category_id)
        REFERENCES category(id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS borrow_history;
CREATE TABLE borrow_history (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    admin_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE NOT NULL,
    CONSTRAINT fk_customer_id
        FOREIGN KEY (customer_id)
        REFERENCES customer(id),
    CONSTRAINT fk_admin_id
        FOREIGN KEY (admin_id)
        REFERENCES admin(id),
    CONSTRAINT fk_book_id
        FOREIGN KEY (book_id)
        REFERENCES books(id)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;



