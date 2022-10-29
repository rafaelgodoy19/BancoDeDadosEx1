create table if not EXISTS customers (
    customer_id BIGINT PRIMARY KEY,
    name varchar(255) NOT NULL,
    age smallint NOT NULL,
    gender varchar(10) NOT NULL,
    document varchar(14) UNIQUE NOT NULL
);

INSERT INTO customers VALUES (1, 'Rafael', '33', 'Masculino', '312545454');

SELECT * FROm customers;

CREATE TABLE if not EXISTS address (
	addres_id BIGINT PRIMARY KEY,
    country varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    state varchar(100) NOT NULL,
    street varchar(200) not NULL,
    street_number varchar(10) not NULL,
    neighborhood varchar(50) not NULL,
    zipcode varchar(20) not NULL,
    address_complement varchar(100),
    customer_id BIGINT not NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT into address VALUES (1, 'Brasil', 'Campinas', 'SP', 'Rua 10', '298', 'Centro', '13057159', NULL,1);
INSERT into address VALUES (2, 'Brasil', 'Campinas', 'SP', 'Rua 11', '500', 'Centro', '13057163', NULL,1);

SELECT *
FROM customers cus,
     address adr
WHERE cus.customer_id = adr.customer_id;

CREATE TABLE if NOT EXISTS contact(
  	contact_id BIGINT PRIMARY KEY,
  	contact_type varchar(10) NOT NULL,
  	dados_contato varchar(100) NOT NULL,
  	customers_id BIGINT not NULL,
  	FOREIGN KEY (customers_id) REFERENCES customers(customer_id)
);

INSERT into contact VALUES (1, 'telefone', '32323232', 1);
INSERT into contact VALUES (2, 'celular', '99323232', 1);
INSERT into contact VALUES (3, 'e-mail', 'rafael@gmail.com', 1);

SELECT * FROm contact;

SELECT * 
FROM contact con,
	 customers cus
WHERE con.customers_id = cus.customer_id;