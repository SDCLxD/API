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

app.get('/get', function(req, res) {
  res.send("Olá");
});

app.post('/script/whitelist', (req, res) => {
  const { chave1, hwide } = req.body;
  const { chave } = req.query;

  if (!chave1 || !hwide) {
    return res.status(400).json({ message: 'Chave ou HWID não fornecido' });
  }

  const luaScript = `
          getgenv().fastfarm = true

function findneck()
	local old = game.Players.LocalPlayer.CameraMinZoomDistance
	local old2 = game.Players.LocalPlayer.CameraMaxZoomDistance
    local data = game.ReplicatedStorage["Stats"..game.Players.LocalPlayer.Name]

    if data.Stats.Peli.Value < 300 then
        local vt = 500
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local CFrameEnd = CFrame.new(1009.09015, 8.99998474, 1179.3689)
        local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude / vt,Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(pl, info, {CFrame = CFrameEnd})
        tween:Play()
        tween.Completed:Wait()

    if tween.Completed then
        task.wait(2)
        local args = {
            [1] = {
                [1] = "takequest",
                [2] = "Find Sarah's necklace"
            }
        }

        game:GetService("ReplicatedStorage").Events.Quest:InvokeServer(unpack(args))
        
        game.Players.LocalPlayer.CameraMinZoomDistance = 128
		game.Players.LocalPlayer.CameraMaxZoomDistance = 256
		game.Players.LocalPlayer.CameraMinZoomDistance = 256
        end
    end

	function GetNeak()
    if Workspace.Effects:FindFirstChild("Folder") then
		for i, v in ipairs(Workspace.Effects.Folder:GetDescendants()) do
			if v.Name == "Part" and v.Parent.Name == "Folder" and v:FindFirstChild("Mesh") and v.Mesh.TextureId == "http://www.roblox.com/asset/?id=28461501" and v:FindFirstChild("ClickDetector") then
				return v
			end
		end
	end
	end

    for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if child:IsA("BasePart") and child.CanCollide == true then
            child.CanCollide = false
        end
    end
           
	repeat wait()
    local cac = GetNeak()
	if cac then 
		local rac = cac.CFrame + Vector3.new(0,5,0)
		local vt = 500
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local CFrameEnd = CFrame.new(rac.X, rac.Y, rac.Z)
        local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude / vt,Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(pl, info, {CFrame = CFrameEnd})
        tween:Play()
        tween.Completed:Wait()
        wait(1)
		if cac:FindFirstChild("ClickDetector") then 
			fireclickdetector(cac.ClickDetector,2)
		end
	end
	
	until data.Quest.CurrentQuest.Value=="None" or data.Quest.QuestProgress.Value==1
	local vt = 250
	local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
	local CFrameEnd = CFrame.new(1009.09015, 8.99998474, 1179.3689)
    local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude / vt,Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(pl, info, {CFrame = CFrameEnd})
    tween:Play()
	tween.Completed:Wait()
	if tween.Completed then
        local args = {
            [1] = {
                [1] = "returnitem"
            }
        }

        game:GetService("ReplicatedStorage").Events.Quest:InvokeServer(unpack(args))
        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
        game.Players.LocalPlayer.CameraMaxZoomDistance = old2
        game.Players.LocalPlayer.CameraMinZoomDistance = old
    end
end

findneck()
        `;

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
        res.status(200).json({ message: 'User found!' });
      } else {
        res.status(403).json({ message: 'User not found.' });
      }
    });
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));
