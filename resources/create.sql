CREATE TABLE roles
(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(50),
  description VARCHAR(500)
);
CREATE TABLE rules
(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(50),
  description VARCHAR(500)
);
CREATE TABLE role_rules
(
  role_id INTEGER REFERENCES roles (id),
  rule_id INTEGER REFERENCES rules (id)
);
CREATE TABLE users
(
  id          SERIAL PRIMARY KEY,
  birthday    DATE,
  description VARCHAR(500),
  role_id     INTEGER REFERENCES roles (id)
);
CREATE TABLE categories
(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(50),
  description VARCHAR(500)
);
CREATE TABLE states
(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(50),
  description VARCHAR(500)
);
CREATE TABLE issues
(
  id          SERIAL PRIMARY KEY,
  title       VARCHAR(500),
  user_id     INTEGER REFERENCES users (id),
  state_id    INTEGER REFERENCES states (id),
  category_id INTEGER REFERENCES categories (id)
);
CREATE TABLE comments
(
  id          SERIAL PRIMARY KEY,
  description TEXT,
  issue_id    INTEGER REFERENCES issues (id)
);
CREATE TABLE files
(
  id           SERIAL PRIMARY KEY,
  description  VARCHAR(300),
  file_address VARCHAR(500),
  issue_id     INTEGER REFERENCES issues (id)
);
