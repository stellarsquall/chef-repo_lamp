CREATE TABLE clients(
  id CHAR (36) NOT NULL,
  PRIMARY KEY(id),
  first_name VARCHAR(64),
  last_name VARCHAR(64),
  email VARCHAR(64)
);

INSERT INTO clients ( id, first_name, last_name, email ) VALUES ( uuid(), 'Bob', 'Ross', 'bob.ross@helloworld.com' );
INSERT INTO clients ( id, first_name, last_name, email ) VALUES ( uuid(), 'Gabriela', 'Lopez', 'gabriela.lopez@helloworld.com' );