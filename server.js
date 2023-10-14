const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: '34.228.105.30',
  user: 'saidvm',
  password: 'senha123',
  database: 'wlsaid'
});

db.connect((error) => {
  if (error) throw error;
  console.log('Conectado ao servidor MySQL.');
});

app.post('/script/whitelist', (req, res) => {
  const { chave1, hwide, i } = req.body;
  const ip = i;
  const { chave } = req.query;

  if (!chave1 || !hwide || !ip) {
    return res.status(400).json({ message: 'Chave ou HWID não fornecido' });
  }

  const query = 'SELECT * FROM whitelist WHERE chave = ?';
  db.query(query, [chave], (error, results) => {
  if (error) throw error;

  if (results.length > 0) {
    const user = results[0];
    if (user.hwid === null) {
      const updateQuery = 'UPDATE whitelist SET hwid = ? WHERE chave = ?';
      db.query(updateQuery, [hwide, chave], (updateError, updateResults) => {
        if (updateError) throw updateError;
        console.log('HWID atualizado para:', hwide);
      });
    } else if (user.hwid === hwide) {
      res.status(200).json({ suc: 'Whitelist realizada com sucesso', username: user.username, userid: user.userid });
      console.log('Execução feita! Usuário:', user.username, 'UserID:', user.userid);
    } else if (chave === user.chave && user.hwid !== hwide) {
      res.status(403).json({ message: '[Verify] HWID does not match key, ask for an HWID reset' });
    } else if (chave !== user.chave && user.hwid !== null) {
      res.status(403).json({ message: '[Verify] Ur Key does not match hwid, ask for !getinfo at discord.' });
    }
  } else {
    res.status(403).json({ message: '[Possible Cracking] Ur IP will be blacklisted from whitelist permanently! if this is a mistake, contact Saidbr' });
  }
  });
});

app.post('/api/auth', (req, res) => {
  const { rng } = req.body;
  const rng_value = rng;
  const modifiedRng = (rng_value - 6 + 5 * 4 / 3) % 2;
  
  if (!rng) {
    return res.status(400).json({ message: 'RNG ausente' });
  }
  
  console.log('Valor RNG recebido:', rng);
  console.log('Valor RNG modificado:', modifiedRng);

  if (modifiedRng === 1.6666666666860692 ) {
      res.status(200).json({ rng: modifiedRng });
    } else {
      res.status(403).json({ message: 'Someone tried to crack, or just a whitelist error.' });
    }
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));
