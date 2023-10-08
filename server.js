const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: '54.159.43.100',
  user: 'mqnvirtu',
  password: '1234',
  database: 'wlsaid'
});

db.connect((error) => {
  if (error) throw error;
  console.log('Connected to the MySQL server.');
});

app.get('/whitelist/authentication', (req, res) => {
  const { chave } = req.query;
  
  if (!chave) {
    return res.status(400).json({ message: 'No key provided' });
  }

  const query = 'SELECT * FROM whitelist WHERE chave = ?';
  db.query(query, [chave], (error, results) => {
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
