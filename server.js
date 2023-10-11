const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const fs = require('fs');

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

app.get('/get', function(req, res) {
  res.send("Olá");
});

app.post('/script/whitelist.lua', (req, res) => {
  const { chave1, hwide } = req.body;
  const { chave } = req.query;

  if (!chave1 || !hwide) {
    return res.status(400).json({ message: 'Chave ou HWID não fornecido' });
  }

  fs.readFile('ap/script.lua', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao ler o arquivo' });
    return;
  }
  
  const luaScript = data;

  const query = 'SELECT * FROM whitelist WHERE chave = ?';
  db.query(query, [chave], (error, results) => {
  if (error) throw error;

  if (results.length > 0) {
    const whitelistEntry = results[0];
    if (whitelistEntry.hwid === null) {
      const updateQuery = 'UPDATE whitelist SET hwid = ? WHERE chave = ?';
      db.query(updateQuery, [hwide, chave], (updateError, updateResults) => {
        if (updateError) throw updateError;
        console.log('HWID atualizado para:', hwide);
      });
    } else if (whitelistEntry.hwid === hwide) {
      res.status(200).json({ suc: 'Whitelist realizada com sucesso', script: luaScript });
    } else if (chave === whitelistEntry.chave && whitelistEntry.hwid !== hwide) {
      res.status(403).json({ message: '[Verify] HWID does not match key, ask for an HWID reset' });
    } else if (chave !== whitelistEntry.chave && whitelistEntry.hwid !== null) {
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

app.post('/rc/snd', (req, res) => {
  const { key, hwid, i } = req.body;
  const chave1 = key;
  const hwid1 = hwid;
  const ip = i;
  const { chave } = req.query;
  
  if (!chave1 || !hwid1 || !ip) {
    return res.status(400).json({ message: 'Something went wrong.' });
  }

    const query = 'SELECT * FROM whitelist WHERE chave = ?';
    db.query(query, [chave1], (error, results) => {
        if (error) throw error;
    
        if (results.length > 0) {
        const user = results[0];
        if (user.hwid === null) {
          const updateQuery = 'UPDATE whitelist SET hwid = ? WHERE chave = ?';
          db.query(updateQuery, [hwid1, chave1], (updateError, updateResults) => {
            if (updateError) throw updateError;
              console.log('HWID atualizado para:', hwid1);
          });
        }
        res.status(200).json({ message: 'User found!', UserName: user.username, UserId: user.userid });
        console.log('Execução feita! Usuário:', user.username, 'UserID:', user.userid);
      } else {
        res.status(403).json({ message: 'User not found.' });
      }
    });
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));
