-- Drop and recreate Users table (Example)

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS books CASCADE;
CREATE TABLE books (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  author VARCHAR(255) NOT NULL,
  date_added DATE,
  is_complete BOOLEAN
);

DROP TABLE IF EXISTS movies CASCADE;
CREATE TABLE movies (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  date_added DATE,
  is_complete BOOLEAN
);

DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  date_added DATE,
  is_complete BOOLEAN
);

DROP TABLE IF EXISTS restaurants CASCADE;
CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  date_added DATE,
  city VARCHAR(255),
  address VARCHAR(255),
  is_complete BOOLEAN
);
