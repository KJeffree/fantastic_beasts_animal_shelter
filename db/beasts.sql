DROP TABLE IF EXISTS adopted_beasts;
DROP TABLE IF EXISTS beasts;
DROP TABLE IF EXISTS owners;

CREATE TABLE beasts(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  collection_date DATE,
  adoption_status VARCHAR(255),
  characteristics TEXT,
  diet VARCHAR(255)
);

CREATE TABLE owners(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE adopted_beasts(
  id SERIAL8 PRIMARY KEY,
  adoption_date DATE,
  update_message TEXT,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE,
  beast_id INT8 REFERENCES beasts(id) ON DELETE CASCADE
);