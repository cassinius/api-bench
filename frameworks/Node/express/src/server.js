const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const { pool } = require('./config')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors())

const getRetailer = (req, res, id=42) => {
  // id = Math.floor(Math.random()*100);

  /**
   * @todo figure out if this has significant performance implications
   */
  // pool.query("SELECT * FROM retailer WHERE id=$1", [id], (error, results) => {
  // // pool.query("SELECT * FROM retailer WHERE id=" + id, (error, results) => {
  //   if (error) {
  //     // throw error
  //     console.log(error);
  //   }
  //   res.status(200).json(results.rows);
  // });

  return res.status(200).json({msg: 'blahoo'});
}

app.get('/retailer/:id', getRetailer);


// Start server
const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}.`)
});
