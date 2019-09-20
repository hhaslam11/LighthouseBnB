const properties = require('./json/properties.json');
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: 123,
  host: 'localhost',
  database: 'lightbnb'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {
  return pool.query(`
    SELECT * FROM users
    WHERE email = $1;
  `, [email])
    .then(res => res.rows[0]);
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  return pool.query(`
    SELECT * FROM users
    WHERE id = $1;
  `, [id])
    .then(res => res.rows[0]);
};
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {
  return pool.query(`
    INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3)
    RETURNING *;
  `, [user.name, user.email, user.password])
    .then(res => res.rows[0]);
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  return pool.query(`
    SELECT reservations.*, properties.*, AVG(property_reviews.rating) AS average_rating
    FROM reservations
    JOIN properties ON properties.id = reservations.property_id
    JOIN property_reviews ON property_reviews.property_id = properties.id
    WHERE reservations.guest_id = $1
    AND reservations.end_date < Now()
    GROUP BY properties.id, reservations.id
    ORDER BY reservations.start_date
    LIMIT $2;
  `, [guest_id, limit])
    .then(res => res.rows);
};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 *
 * OPTIONS:
 * city,
 * owner_id,
 * minimum_price_per_night,
 * maximum_price_per_night,
 * minimum_rating
 */
const getAllProperties = function(options, limit = 10) {
  const optionArr = [];
  let queryString =  `
    SELECT properties.*, AVG(property_reviews.rating) AS average_rating
    FROM properties
    FULL OUTER JOIN property_reviews ON property_reviews.property_id = properties.id
  `;

  if (options.city || options.owner_id || options.minimum_price_per_night || options.maximum_price_per_night) queryString += 'WHERE ';

  if (options.city) {
    optionArr.push(`%${options.city}%`);
    queryString += `city LIKE $${optionArr.length}\n`;
  }

  if (options.owner_id) {
    if (optionArr.length >= 1) queryString += 'AND ';
    optionArr.push(options.owner_id);
    queryString += `owner_id = $${optionArr.length}\n`;
  }

  if (options.minimum_price_per_night) {
    if (optionArr.length >= 1) queryString += 'AND ';
    optionArr.push(options.minimum_price_per_night);
    queryString += `cost_per_night >= $${optionArr.length}\n`;
  }

  if (options.maximum_price_per_night) {
    if (optionArr.length >= 1) queryString += 'AND ';
    optionArr.push(options.maximum_price_per_night);
    queryString += `cost_per_night <= $${optionArr.length}\n`;
  }

  queryString += 'GROUP BY properties.id\n';

  if (options.minimum_rating) {
    optionArr.push(options.minimum_rating);
    queryString += `HAVING AVG(property_reviews.rating) >= $${optionArr.length}\n`;
  }

  queryString += 'ORDER BY properties.cost_per_night\n';

  optionArr.push(limit);
  queryString += `LIMIT $${optionArr.length};`;

  return pool.query(queryString, optionArr)
    .then(res => res.rows);
};
exports.getAllProperties = getAllProperties;

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  console.log('WHAT IS IN THIS: ', property);
  return pool.query(`
    INSERT INTO properties (
                            title, description, number_of_bedrooms, number_of_bathrooms,
                            parking_spaces, cost_per_night, thumbnail_photo_url, cover_photo_url,
                            street, country, city, province, post_code, owner_id
                           )
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
    RETURNING *;
  `, Object.values(property))
    .then(res => res.rows[0]);
};


exports.addProperty = addProperty;