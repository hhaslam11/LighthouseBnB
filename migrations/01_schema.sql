DROP TABLE IF EXISTS property_reviews;
DROP TABLE IF EXISTS guest_reviews;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS rates;
DROP TABLE IF EXISTS users;

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  owner_id INTEGER,
  title VARCHAR(50),
  description VARCHAR(2000),
  thumbnail_photo_url VARCHAR(250),
  cover_photo_url VARCHAR(250),
  cost_per_night MONEY,
  street VARCHAR(100),
  parking_spaced INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms INTEGER,
  country VARCHAR(30),
  city VARCHAR (30),
  province VARCHAR (30),
  post_code VARCHAR (10),
  active BOOLEAN
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  password VARCHAR(350)
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  property_id INTEGER,
  guest_id INTEGER
);

CREATE TABLE guest_reviews (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER,
  owner_id INTEGER,
  reservation_id INTEGER,
  rating SMALLINT,
  message VARCHAR(2000)
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER,
  reservation_id INTEGER,
  property_id INTEGER,
  rating SMALLINT,
  message VARCHAR(2000)
);

CREATE TABLE rates (
  id SERIAL PRIMARY KEY,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  cost_per_night MONEY,
  property_id INTEGER
);