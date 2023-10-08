const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'test'
});

db.connect((error) => {
  if (error) throw error;
  console.log('Connected to the MySQL server.');
});

app.get('/whitelist/authentication', (req, res) => {
  const { key } = req.query;
  
  if (!key) {
    return res.status(400).json({ message: 'No key provided' });
  }

  const query = 'SELECT * FROM whitelist WHERE key = ?';
  db.query(query, [key], (error, results) => {
    if (error) throw error;

    if (results.length > 0) {
      res.status(200).json('successfully whitelisted');
    } else {
      res.status(403).json({ message: 'Key not found in whitelist' });
    }
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`)); 