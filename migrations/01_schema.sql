DROP TABLE IF EXISTS property_reviews;
DROP TABLE IF EXISTS guest_reviews;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS rates;
DROP TABLE IF EXISTS users;

CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(2000),
  thumbnail_photo_url VARCHAR(250) NOT NULL,
  cover_photo_url VARCHAR(250) NOT NULL,
  cost_per_night MONEY NOT NULL,
  street VARCHAR(100) NOT NULL,
  parking_spaced INTEGER NOT NULL,
  number_of_bathrooms INTEGER NOT NULL,
  number_of_bedrooms INTEGER NOT NULL,
  country VARCHAR(30) NOT NULL,
  city VARCHAR (30) NOT NULL,
  province VARCHAR (30) NOT NULL,
  post_code VARCHAR (10) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(350) NOT NULL
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP,
  property_id INTEGER NOT NULL,
  guest_id INTEGER NOT NULL
);

CREATE TABLE guest_reviews (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER NOT NULL,
  owner_id INTEGER NOT NULL,
  reservation_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  message VARCHAR(2000) NOT NULL
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER NOT NULL,
  reservation_id INTEGER NOT NULL,
  property_id INTEGER NOT NULL,
  rating SMALLINT NOT NULL,
  message VARCHAR(2000) NOT NULL
);

CREATE TABLE rates (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  cost_per_night MONEY,
  property_id INTEGER
);