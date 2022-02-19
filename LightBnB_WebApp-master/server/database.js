const properties = require('./json/properties.json');
const users = require('./json/users.json');
const { Pool, Client } = require('pg');

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});


/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = (email) => {
  const values = [email];
  return pool.query(`
  SELECT *
  FROM users
  WHERE email = $1;
  `, values)
  .then((res) => {
    return res.rows[0];
  })
  .catch((err) => {
    return null;
  })
};

exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = (userId) => {
  const values = [userId]
  return pool.query(`
  SELECT *
  FROM users
  WHERE id = $1;
  `, values)
  .then((res) => {
    return res.rows[0];
  })
  .catch((err) => {
    return null;
  })
};
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = (user) => {
  const values = [user.name, user.email, user.password]
  return pool.query(`
  INSERT INTO users (name, email, password)
  VALUES ($1, $2, $3)
  RETURNING *;
  `, values)
  .then((res) => {
    return res.rows
  })
  .catch((err) => {
    console.log(err.message);
  })
};

exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = (guest_id) => {
  const values = [guest_id]
  return pool.query(`
  SELECT *
  FROM reservations
  WHERE reservations.guest_id = $1
  LIMIT 10;
  `, values)
  .then((res) => {
    return (res.rows);
  })
  .catch((err) => {
    console.log(err.message);
  })
}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = (options, limit = 10) => {
  const queryParams = [];
  let queryString = `SELECT properties.*, AVG(property_reviews.rating) AS average_rating
  FROM properties
  JOIN property_reviews
  ON properties.id = property_reviews.property_id
  WHERE 1=1`;
  // checking for filter params
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `AND city LIKE $${queryParams.length}`;
  }

  if (options.owner_id) {
    queryParams.push(options.owner_id);
    queryString += `AND owner_id = $${queryParams.length}`;
  }

  if (options.minimum_price_per_night) {
    const cost = options.minimum_price_per_night * 100;
    queryParams.push(cost);
    queryString += `AND cost_per_night >= $${queryParams.length}`;
  }

  if (options.maximum_price_per_night) {
    const cost = options.maximum_price_per_night * 100
    queryParams.push(cost);
    queryString += `AND cost_per_night <= $${queryParams.length}`;
  }
  queryString += `
  GROUP BY properties.id `

  if (options.minimum_rating) {
    queryParams.push(options.minimum_rating);
    queryString += `HAVING AVG(property_reviews.rating) >= $${queryParams.length}`;
  }
//finishing the queryString after all filters have been applied
queryParams.push(limit);
queryString += `
ORDER BY cost_per_night
LIMIT $${queryParams.length}`;

  return pool.query(queryString, queryParams)
      .then((res) => {
        return res.rows;
      })
      .catch((err) => {
        console.log(`ERROR: ${err}!`);
      })
};

exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = (property) => {
  console.log(property);
  const values = Object.values(property);

  return pool.query(`
  INSERT INTO properties (title, description, number_of_bedrooms, number_of_bathrooms, parking_spaces, cost_per_night, thumbnail_photo_url, cover_photo_url, street, country, city, province, post_code, owner_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING *`, values)
  .then((res) => {
    return res.rows;
  })
  .catch((err) => {
    console.log(err.message);
  })
};
exports.addProperty = addProperty;
