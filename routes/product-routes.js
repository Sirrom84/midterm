const express = require('express');
const router  = express.Router();

// Get request to products(things to buy) from Home Page --> gets the list of products from the users(user_id)

module.exports = (db) => {
  router.get("/:id", (req, res) => {
    db.query(`
    SELECT *
    FROM products
    WHERE user_id = $1
    ORDER BY date_added;`, [req.params.id])
      .then(data => {
        const products = data.rows;
        res.json({ products });
      })
      .catch(err => {
        res
          .status(500)
          .json({ error: err.message});
      });
  });

  //post request to delete
  router.post("/:id/delete", (req,res) => {
    const userId = req.params.id;
    const itemId = req.body["itemId"];
    const values = [userId, itemId];
    console.log("Products post request:", values)

    db.query(`
    DELETE FROM products
    WHERE user_id = $1
    AND id = $2;`, values)
      .then(data => {
        const products = data.rows;
        res.json({ products });
        })
      .catch(err => {
        console.log(err)
        res.status(500).json({ error: err.message});
    });
  });

  return router;
};
