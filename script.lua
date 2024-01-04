-- This file was generated using Luraph Obfuscator v13.6.7

local Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/SDCLxD/SDCL/main/script.lua")))()

repeat task.wait() until game.Players.LocalPlayer
if not getgenv().tvk then
    getgenv().tvk ={}
end
for k,v in pairs(getgenv().tvk) do v.On=false end
local plr = game.Players.LocalPlayer
local data = game.ReplicatedStorage["Stats"..game.Players.LocalPlayer.Name]

local Settings = {
    AutoStat = {
        Strength = false,
        Stamina = false,
        Defense = false,
        GunMastery = false,
        SwordMastery = false
    }
}
local Temp = {
    Nodrown = {},
    Noclip = {},
    DashNoStam = {},
    NoFallDame = {},
    Drown={}
}

for k,v in pairs(getgenv().tvk) do 
    v.On = false 
end

function TableToSave(tb) 
    local cac = {}
    for k,v in pairs(tb) do
        if type(v)=="vector" then 
            cac[k]={v.X,v.Y,v.Z,"Vector3"}
        else
            cac[k]=v
        end
    end
    return cac
end

function SaveToTable(tb) 
    local cac = {}
    for k,v in pairs(tb) do
        if type(v)=="table" and #v==4 and v[4]=="Vector3" then 
            cac[k]=Vector3.new(v[1],v[2],v[3])
        else
            cac[k]=v
        end
    end
    return cac
end

local SaveFileName = game.Players.LocalPlayer.Name.."_GPO.json"

function SaveSettings()
    local HttpService = game:GetService("HttpService")
    if not isfolder("Said Hub") then
        makefolder("Said Hub")
    end
    writefile("Said Hub/" .. SaveFileName, HttpService:JSONEncode(TableToSave(Settings)))
end

function ReadSetting() 
    local s,e = pcall(function() 
        local HttpService = game:GetService("HttpService")
        if not isfolder("Said Hub") then
            makefolder("Said Hub")
        end
        return HttpService:JSONDecode(readfile("Said Hub/" .. SaveFileName))
    end)
    if s then return e 
    else
        SaveSettings()
        return ReadSetting()
    end
end

local tvkdumb = {On = true }
function tvkdumb:cac(self) 
    spawn(function() 
        while task.wait(1) and self.On do SaveSettings() end
        print("Stopped")
    end)
end

tvkdumb:cac(tvkdumb)
table.insert(getgenv().tvk, tvkdumb)
Settings = SaveToTable(ReadSetting())
repeat wait() until game:IsLoaded()

repeat wait(.25)
until game.Players.LocalPlayer:FindFirstChild("Loaded")
and game.Players.LocalPlayer.Loaded.Value == true
and game.Players.LocalPlayer.Character
and game.Players.LocalPlayer:FindFirstChild("Backpack")
and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Notifications")
and #game.Players.LocalPlayer.Backpack:GetChildren() ~= 0 and pcall(function() 
    return game.Players.LocalPlayer.Idled
end)

local function FireButton(x)
    for i, v in pairs(getconnections(x.MouseButton1Click)) do 
        v:Function()
    end
end

function pscode()
    if game.PlaceId==1730877806 then
        repeat wait() until game:GetService("ReplicatedStorage").Events:FindFirstChild("reserved")
        if Settings.PSCode and Settings.PSCode~="" then
            while task.wait(2) do 
                game:GetService("ReplicatedStorage").Events.reserved:InvokeServer(Settings.PSCode)
                pcall(function() 
                    FireButton(game:GetService("Players").LocalPlayer.PlayerGui.chooseType.Frame.regular)
                end)
            end
        else
            while task.wait(2) do 
                game:GetService("ReplicatedStorage").Events.playgame:FireServer()
            end
        end
        return
    end
end

local request=request
if syn then request=syn.request end
local StoringDF = false
for i, v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable()
end
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)

local FindNearest
for k, v in pairs(getgc()) do
    if debug.getinfo(v).name == "FindNearest" and tostring(getfenv(v).script) == "Hitbox" then
        FindNearest = v
        break
    end
end
if not FindNearest then
    game.Players.LocalPlayer:Kick("Script error when loading, rejoin and try again")
end
MucTieu = {}
MucTieu.old =
    hookfunction(
    FindNearest,
    function(a, b)
        if MucTieu.MucTieu then
            return MucTieu.MucTieu
        end
        return MucTieu.old(a, b)
    end
)
local secure_call = (syn and syn.secure_call) or function(f)
    setthreadcontext(2)
        f()
    setthreadcontext(7)
end

local old = getrenv()._G.hitbox.start
getrenv()._G.hitbox.start = function(...)
    local arg = {...}
    arg[3] = Vector3.new(30, 30, 30)
    return old(unpack(arg))
end

function CheckEN(str)
    local cac = Temp[str]
    for k, v in pairs(cac) do
        if v then
            return true
        end
    end
    return false
end

function IsFishMan(pos)
    return pos.Y < -2000
end

local matema = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = plr.Character.HumanoidRootPart:FindFirstChild(matema) or Instance.new("BodyVelocity")
    BV.Parent = plr.Character.HumanoidRootPart
    BV.Name = matema
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end
function TweenFloat(tf)
    if tf and not plr.Character.HumanoidRootPart:FindFirstChild(matema..matema) then
        local BV = Instance.new("BodyVelocity")
        BV.Parent = plr.Character.HumanoidRootPart
        BV.Name = matema..matema
        BV.MaxForce = Vector3.new(100000, 100000, 100000)
        BV.Velocity = Vector3.new(0, 0, 0)
    else
        if not tf and  plr.Character.HumanoidRootPart:FindFirstChild(matema..matema) then 
            plr.Character.HumanoidRootPart[matema..matema]:Destroy()
        end
    end
end

function SetEN(str, cac, rac)
    Temp[str][cac] = rac
end

local DisableNoDrown = false

local old
old = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(...)
    local Self = ...
    if CheckEN("Nodrown")
    and tostring(Self) == "swim" then
        return nil
    end

    return old(...)
end))

local old
old = hookmetamethod(game, "__namecall", function(...)
    local Self = ...
    local NamecallMethod = getnamecallmethod()

    if CheckEN("NoFallDame")
    and tostring(Self) == "FallDmg" then
        return nil
    end
    if CheckEN("DashNoStam")
    and tostring(Self) == "takestam" then
        return nil
    end
    if  CheckEN("Nodrown")
    and tostring(Self) == "swim" then
        return nil
    end

    local args = {...}
    if getnamecallmethod()=="InvokeServer" and tostring(Self)=="Skill" and args[2]=="Blocking " then
        return
    end

    return old(...)
end)

local tvktrumskid = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)
function CreateTweenFloat()
    local BV = plr.Character.HumanoidRootPart:FindFirstChild(tvktrumskid) or Instance.new("BodyVelocity")
    BV.Parent = plr.Character.HumanoidRootPart
    BV.Name = tvktrumskid
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end
function TweenFloat(tvk)
    if tvk and not plr.Character.HumanoidRootPart:FindFirstChild(tvktrumskid..tvktrumskid) then
        local BV = Instance.new("BodyVelocity")
        BV.Parent = plr.Character.HumanoidRootPart
        BV.Name = tvktrumskid..tvktrumskid
        BV.MaxForce = Vector3.new(100000, 100000, 100000)
        BV.Velocity = Vector3.new(0, 0, 0)
    else
        if not tvk and  plr.Character.HumanoidRootPart:FindFirstChild(tvktrumskid..tvktrumskid) then 
            plr.Character.HumanoidRootPart[tvktrumskid..tvktrumskid]:Destroy()
        end
    end
end
function QuayNgang(pos) 
    local bulon = CFrame.new(pos.X,pos.Y,pos.Z,-0.008880537, 0.999960601, -6.28793302e-08, -5.37608429e-08, -5.96046448e-08, -0.99999994, -0.999960601, -0.008880537, 6.35593764e-08)
    return bulon
end
function GetAllState() 
    local cac = {}
    for k,v in pairs(Enum.HumanoidStateType:GetEnumItems()) do 
        if plr.Character:FindFirstChild("Humanoid") then 
            cac[v]=plr.Character.Humanoid:GetStateEnabled(v)
        end
    end
    return cac
end
function SetAllState(rac) 
    local cac = {}
    for k,v in pairs(Enum.HumanoidStateType:GetEnumItems()) do 
        if plr.Character:FindFirstChild("Humanoid") then 
           plr.Character.Humanoid:SetStateEnabled(v,rac)
        end
    end
    return cac
end
local speaker = game.Players.LocalPlayer
local StopFloat=false

game:GetService("RunService").Stepped:Connect(
    function()
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and
        game.Players.LocalPlayer.Character.Parent == game.Workspace.PlayerCharacters and
        not plr.PlayerGui:FindFirstChild("DEATHGUI") then 
            if CheckEN("Noclip") then 
                if (not setfflag or (identifyexecutor and identifyexecutor():upper() == "KRNL")) then
                    if
                        speaker.Character ~= nil and CheckEN("Noclip") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and
                            game.Players.LocalPlayer.Character.Parent == game.Workspace.PlayerCharacters and
                            not plr.PlayerGui:FindFirstChild("DEATHGUI")
                     then
                        if not StopFloat then 
                            CreateTweenFloat()
                        end
                        
        
                        for _, child in pairs(speaker.Character:GetDescendants()) do
                            if child:IsA("BasePart") and child.CanCollide == true then
                                child.CanCollide = false
                            end
                        end
                    else
                        if plr.Character.HumanoidRootPart:FindFirstChild(tvktrumskid) then
                            plr.Character.HumanoidRootPart[tvktrumskid]:Destroy()
                           
                        end
                    end
                else
                    if CheckEN("Noclip") then
                        if not StopFloat then 
                            plr.Character.Humanoid:ChangeState(11)
                        end
                        for _, child in pairs(plr.Character:GetDescendants()) do
                            if child:IsA("BasePart") and child.CanCollide == true then
                                child.CanCollide = false
                            end
                        end
                    end
                end
            else
                if plr.Character.HumanoidRootPart:FindFirstChild(tvktrumskid) then
                    plr.Character.HumanoidRootPart[tvktrumskid]:Destroy()
                end
            end
        end
        
        
        pcall(
            function()
                -- if CheckEN("Nodrown") then
                --     plr.Character.HumanoidRootPart.SwimPosition.Position = Vector3.new(0, -2.71834, 0)
                -- end

                if CheckEN("Nodrown") and not DisableNoDrown then
                    plr.Character.HumanoidRootPart.SwimPosition.Position = Vector3.new(0, -2.71834, 0)
                end
                if CheckEN("Drown") then
                    plr.Character.HumanoidRootPart.SwimPosition:Destroy()
                end
            end
        )
    end
)

if not Settings.vt then Settings.vt=80 end
function RayCast2(a, b, c)
    local ignored = {game.Players.LocalPlayer.Character, game:GetService("Workspace").Effects, part0}

    local raycastParameters = RaycastParams.new()
    raycastParameters.FilterDescendantsInstances = ignored
    raycastParameters.FilterType = Enum.RaycastFilterType.Blacklist
    raycastParameters.IgnoreWater = false
    local rels = workspace:Raycast(a, b, raycastParameters)
    return rels
end
function IsSea()
    local t = RayCast2(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(0, -500, 0))
    --print(t.Instance)
    if t == nil or t.Instance.Name == "InvisSandd" then
        return true
    end
    return false
end
local tvk = function(f) f() end
local plr = game:service "Players".LocalPlayer
local tween_s = game:service "TweenService"
function Tween2(t, cb)
    local plr = game:service "Players".LocalPlayer
    local tween_s = game:service "TweenService"
    local info =
        TweenInfo.new(
        (game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - t.p).magnitude / Settings.vt,
        Enum.EasingStyle.Linear
    )
    local tic_k = tick()
    local cframe = t
    local tween, err =
    tvk(
        function()
            local tween = tween_s:Create(plr.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = cframe})
            local done = false
            tween.Completed:Connect(
                function()
                    done = true
                end
            )
            cb(
                function()
                    done = true
                    tween:Cancel()
                end
            )
            noclip = true
            tween:Play()
            while (done == false) do
                SetEN("Noclip", "Tween", true)
                if not( game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and
                game.Players.LocalPlayer.Character.Parent == game.Workspace.PlayerCharacters and
                not plr.PlayerGui:FindFirstChild("DEATHGUI")) then done = true
                    tween:Cancel() return end               
                if (plr.Character.HumanoidRootPart.Position-t.Position).magnitude <40 then 
                    plr.Character.HumanoidRootPart.CFrame=t
                    tween:Cancel()
                    return
                end
                wait()
            end

            noclip = false
        end
    )

end
spawn(function() 
    while wait() do 
        if plr.Character:FindFirstChild("Humanoid") then 
            if plr.Character.Humanoid.Sit then 
                StopFloat=true
                wait(.1)
                plr.Character.Humanoid.Sit=false
                StopFloat=false
            end
        end
    end
end)
function y0(vc) 
    return Vector3.new(vc.X,0,vc.Z)
end
local DisableSafeMode = false
local Last
local FishUp = CFrame.new(8585.81641, -2136.12305, -17087.8145, 1, 0, 0, 0, 1, 0, 0, 0, 1)
function FireTouch(part)
    if plr.Character:FindFirstChild("HumanoidRootPart") then
        firetouchinterest(plr.Character:WaitForChild("HumanoidRootPart"), part, 0)
        firetouchinterest(plr.Character:WaitForChild("HumanoidRootPart"), part, 1)
    end
end
function tpT(Pos,k,Origin,dieukien,DisableBypass,Float)
    if Last then
        Last()
        Last = nil
    end
    if not plr.Character:FindFirstChild("HumanoidRootPart") then return end
    if (plr.Character.HumanoidRootPart.Position-Pos.Position).magnitude <40 then 
        plr.Character.HumanoidRootPart.CFrame=Pos
        --tween:Cancel()
        return
    end
    if not Float then 
        StopFloat=true
    else
        StopFloat=false
    end   
    local tvk = function() 
        if not IsFishMan(Pos) and IsFishMan(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position) then
            tpT(FishUp,nil,nil,dieukien,DisableBypass,Float)
            DisableSafeMode=true
            FireTouch(game:GetService("Workspace").Fishman.Part2)
            wait(1)
            if not IsFishMan(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position) then
                DisableSafeMode=false
                return tpT(Pos,nil,nil,dieukien,DisableBypass,Float)
            end
        end
        if IsFishMan(Pos) and not IsFishMan(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position) then
            tpT(CFrame.new(5682.19, 5, -16458.479),dieukien,DisableBypass,Float)
            SetEN("Drown","Tween",true)
            tpT(CFrame.new(5639.86865, -92.762001, -16611.4688, -1, 0, 0, 0, 1, 0, 0, 0, -1),nil,nil,dieukien,DisableBypass,Float)
            
            DisableSafeMode=true
            FireTouch(game:GetService("Workspace").Fishman.Part)
    
            wait(1)
            SetEN("Drown","Tween",true)
            if IsFishMan(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position) then
                DisableSafeMode=false
                return tpT(Pos,nil,nil,dieukien,DisableBypass,Float)
            end
        end
        if (IsFishMan(Pos) and IsFishMan(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)) or (not IsFishMan(Pos) and not IsFishMan(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)) then 
            
            if not Origin then
                Origin = Pos
            end
        
            local info = TweenInfo.new((plr.Character.HumanoidRootPart.Position - Pos.p).magnitude / Settings.vt, Enum.EasingStyle.Linear)
            if k == nil then
                k = 1
            end
            local tween_s = game:service "TweenService"
            local tween = game:service "TweenService":Create(plr.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = Pos})
            local done = false
            tween.Completed:Connect(
                function()
                    done = true
                end
            )
            tween:Play()
            local Stop = function()
                tween:Cancel()
                done = true
                SetEN("Noclip", "Tween", false)
            end
            Last = Stop
            while (done == false) do
                if dieukien and not dieukien() then Stop() return end
                SetEN("Noclip", "Tween", true)
                if not( game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and
                game.Players.LocalPlayer.Character.Parent == game.Workspace.PlayerCharacters and
                not plr.PlayerGui:FindFirstChild("DEATHGUI")) then Stop() return end
                if not plr.Character:FindFirstChild("Humanoid") then Stop() return end
        
                if math.abs(Pos.Position.Y-plr.Character.HumanoidRootPart.Position.Y)>50 then
                    StopFloat=false 
                else
                    if not Float then 
                        StopFloat=true
                    else
                        StopFloat=false
                    end
                end
                wait(.1)
                if sp and not part.Parent then
                    return
                end
                if done then return end
                if (plr.Character.HumanoidRootPart.Position-Pos.Position).magnitude <40 then 
                    plr.Character.HumanoidRootPart.CFrame=Pos
                    tween:Cancel()
                    return
                end
                do 
                    local hp = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local p1 = Vector3.new(Origin.X, 0, Origin.Z)
                    local p2 = Vector3.new(hp.X, 0, hp.Z)
                    if (p1 - p2).magnitude < 200 then
                        tween:Cancel()
                        return tpT(Origin,nil,Origin,dieukien,true,true)
                    end
                end
                if not DisableBypass then 
                    local pos = -2.7848949432373
                    if
                        not IsFishMan(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position) and IsSea() and
                            math.abs(plr.Character.HumanoidRootPart.Position.Y - pos) > .1
                     then
                        tween:Cancel()
                        local cf = plr.Character.HumanoidRootPart.CFrame      
                        return tpT(
                            CFrame.new(Pos.X, cf.Y, Pos.Z),
                            k,
                            Origin,
                            dieukien,DisableBypass,Float
                        )
                    end
                    if not IsSea() and (game.Players.LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air) then
                        --print("bu cu")
                        local tss = RayCast2(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,3,0), Vector3.new(0, -500, 0))
                        local tvk = RayCast2(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,3,0), Vector3.new(0, -7, 0))
                        if not tvk then 
                            if tss and tss.Instance then 
                                tween:Cancel()
                                local cf = plr.Character.HumanoidRootPart.CFrame
                                return tpT(CFrame.new(Pos.X,  cf.Y, Pos.Z), k, Origin,dieukien,DisableBypass,Float)
                            end
                        end
                    end
                end
                if not done then 
                    return tpT(CFrame.new(Pos.X,  Pos.Y, Pos.Z), k, Origin,dieukien,DisableBypass,Float)
                end
            end
        end
        
    end
    tvk()
    StopFloat=false
end
function TpTween(cf,checkfunc)
    SetEN("Nodrown", "Tween", true)
    SetEN("Noclip", "Tween", true)
    tpT(cf,nil,cf,checkfunc)
    SetEN("Noclip", "Tween", false)
    SetEN("Nodrown", "Tween", false)
end
function Tp(pos, checkfunc)
    if Last then
        Last()
        Last = nil
    end
    TpTween(pos,checkfunc)
end

function GetSword()
    for k, v in pairs(plr.Character:GetChildren()) do
        if v:FindFirstChild("SwordEquip") then
            return v, true
        end
    end
    for k, v in pairs(plr.Backpack:GetChildren()) do
        if v:FindFirstChild("SwordEquip") then
            return v, false
        end
    end
end

function CheckInven(item) 
    local cac = game:GetService("HttpService"):JSONDecode(data.Inventory.Inventory.Value)
    for k,v in pairs(cac) do 
        if k==item then 
            return k
        end
    end
end

local function GetNearestChest()
	local Chest
	for i, v in ipairs(game.workspace.Env:GetChildren()) do
		if plr.Character:FindFirstChild("HumanoidRootPart") and v.Name == "Chest" and v:IsA("Model") and v:FindFirstChild("MeshPart") then
			if not Chest then
                Chest=v 
            end
            if (v.MeshPart.Position - plr.Character.HumanoidRootPart.Position).magnitude<(Chest.MeshPart.Position - plr.Character.HumanoidRootPart.Position).magnitude then 
                Chest=v 
            end
		end
	end
	return Chest
end
function IsChestAlive(chest) 
    if chest.Parent and chest:FindFirstChild("MeshPart") then 
        return true
    end
    return false
end

function CollectChest(chest) 
    Tp(chest.MeshPart.CFrame * CFrame.new(0, 5, 0),function() 
        if not IsChestAlive(chest) then
            return false 
        end
        if GetNearestChest()~=chest then 
            return false
        end
        return true
    end)
    if IsChestAlive(chest) then 
        wait(1)
        for i, v in ipairs(game.workspace.Env:GetChildren()) do 
            if v:FindFirstChild("ClickDetector") then 
                if (v.Position - plr.Character.HumanoidRootPart.Position).magnitude <10 then 
                    fireclickdetector(v.ClickDetector, 2)
                end
            end
        end
    end    
end

function GetCurrentQuest()
    local rac
    rac=data
    return tostring(rac.Quest.CurrentQuest.Value)
end

function GetQuest(quest, rac)
    local t = tick()
    repeat
        wait()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.T, false, game)
    until game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT") or tick() - t > 3
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT") and plr.Character:FindFirstChild("HumanoidRootPart") then
        local cur = plr.Character.HumanoidRootPart.CFrame

        repeat
            wait()
            if plr.Character:FindFirstChild("HumanoidRootPart") and rac then
                plr.Character.HumanoidRootPart.CFrame = cur + Vector3.new(0, -11, 0)
            end
            pcall(
                function()
                    for k, v in pairs(
                        getconnections(
                            game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT").Frame.go.MouseButton1Click
                        )
                    ) do
                        v:Fire()
                    end
                end
            )
        until not game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT")
    end
end

local Ui = Library:AddWindow("Said Hub", "Grand Piece Online")

local Farm = Ui:AddTab("Main")
local MainFarm = Farm:AddSection("Rifle Farm")
local Stats = Ui:AddTab("Stats")
local Statss = Stats:AddSection("Auto Stats : Input")
local PL = Ui:AddTab("Player")
local LP = PL:AddSection("Local Player")
local ShipFarm = Ui:AddTab("Ship Farm")
local SF = ShipFarm:AddSection("Ship Farm Configuration")
local Misc = Ui:AddTab("Misc")
local Teleport = Misc:AddSection("Teleport")
local SETT = Ui:AddTab("Settings")
local CF = SETT:AddSection("Script Config")

for k, v in pairs(Settings.AutoStat) do
    Statss:AddToggle(k, {Description = "", Toggled = v}, function(state)
        Settings.AutoStat[k] = state
    end)
end

function autostats()
    spawn(function()
        while task.wait(.5) do
            if Settings.AutoStat then
                for k, v in pairs(Settings.AutoStat) do
                    if v and data.Stats.SkillPoints.Value > 0 then
                        game.ReplicatedStorage.Events.stats:FireServer(k, nil, 1)
                    end
                end
            end
        end
    end)
end

autostats()

LocationsCoord = {
    ["Town of Beginnings"] = CFrame.new(965.146, 10, 1195.127),
    ["Marine Fort F-1"] = CFrame.new(2904.113, 25, -994.2),
    ["Sandora"] = CFrame.new(-1316.089, 15, 1129.95),
    ["Shell's Town"] = CFrame.new(-605.248, 15, -4430.41),
    ["Zou"] = CFrame.new(-4458.681, 10, -2502.741),
    ["Restaurant Baratie"] = CFrame.new(-3909.713, 55, -5569.912),
    ["Orange Town"] = CFrame.new(-6999.987, 10, -5345.705),
    ["Mysterious Cliff"] = CFrame.new(2180.005, 415, -8628.285),
    ["Roca Island"] = CFrame.new(5426.218, 20, -4918.854),
    ["Colosseum"] = CFrame.new(-2019.975, 10, -7661.091),
    ["Sphinx Island"] = CFrame.new(-6327.812, 45, -10129.278),
    ["Kori Island"] = CFrame.new(-6684.44, 10, 1828.623),
    ["Arlong Park"] = CFrame.new(652.855, 15, -13122.346),
    ["Land of the Sky"] = CFrame.new(9016.793, 1440, -10542.829),
    ["Knock-Up Stream Rock"] = CFrame.new(8116, 10, -9819),
    ["Gravito's Fort"] = CFrame.new(2611.159, 15, -15359.032),
    ["Fishman Cave"] = CFrame.new(5682.19, 5, -16458.479),
    ["Fishman Island"] = CFrame.new(8003.553, -2150, -17056.971),
    ["Marine Base G-1"] = CFrame.new(-9955.175, 70, -14910.613),
    ["Coco Island"] = CFrame.new(-4262.249, 10, -15531.864),
    ["Reverse Mountain"] = CFrame.new(-14338, 20, -9446),
    ["Shrine"] = CFrame.new(-12184.12890625, 3.2737002372742, -18545.69921875)
}

function WTS(part, toggle)
    local screen = workspace.CurrentCamera:WorldToViewportPoint(part)
    return Vector2.new(screen.x, screen.y)
end

local esplist = {}
game:GetService("RunService").Stepped:connect(
    function()
        for k, v in pairs(esplist) do
            v()
        end
    end
)

function ESP(part, text, color, toggle)
    local name = Drawing.new("Text")
    name.Text = text
    name.Color = color
    name.Position = WTS(part)
    name.Size = 20.0
    name.Outline = true
    name.Center = true
    name.Visible = true

    table.insert(
        esplist,
        function()
            pcall(
                function()
                    if part ~= nil then
                        name.Position = WTS(part)
                    end
                    local _, screen = workspace.CurrentCamera:WorldToViewportPoint(part)
                    if screen and Settings[toggle] then
                        name.Visible = true
                    else
                        name.Visible = false
                    end
                end
            )
        end
    )
end
for k, v in pairs(LocationsCoord) do
    ESP(Vector3.new(v.X, v.Y, v.Z), k, Color3.fromRGB(255, 255, 255), "IslandE")
end
local rac = {}
for k, v in pairs(LocationsCoord) do
    table.insert(rac, k)
end

Teleport:AddDropdown("Teleport", {
    List = rac,
    Default = ""
}, function(item)
    if item and item~="" then
        local s,e = xpcall(function()Tp(LocationsCoord[item]) end,function(e) 
            print(e)
            print(debug.traceback())
        end)
    end
end)

CF:AddSlider("Tween Speed", {Min = 10, Max = 120, DefaultValue = Settings.vt}, function(value)
    Settings.vt = value
end)

CF:AddToggle("Auto Store DF", {Toggled = Settings.AutoStoreDF, Description = "Auto store fruits if you have an fruit bag."}, function(state)
    Settings.AutoStoreDF = state
end)

CF:AddTextbox("Web Hook Url", "Enter here!", function(args)
    Settings.WebHookUrl = args
end,Settings.WebHookUrl)

CF:AddToggle("Mention Everyone", {Toggled = Settings.MentionEveryone,Description = "Will mention everyone when you get a fruit."}, function(state)
    Settings.MentionEveryone = state
end)

CF:AddToggle("DF Webhook", {Toggled = Settings.DFWebHook, Description = "Will notify when you have DF."}, function(state)
    Settings.DFWebHook = state
end)

CF:AddTextbox("PS Code", "(Leave if you want rejoin to normal server)", function(args)
    Settings.PSCode=args
end,Settings.PSCode)

CF:AddToggle("Auto Rejoin", {Toggled = Settings.AutoRejoin, Description = "You will rejoin if got disconnected."}, function(state)
    Settings.AutoRejoin = state
end)

function autorejoin()
    game.CoreGui.DescendantAdded:Connect(function()
        task.wait(2)
        pcall(function()
            if game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
            and Settings.AutoRejoin then
                while task.wait() do
                    game:GetService("TeleportService"):Teleport(1730877806, plr)
                    task.wait(5)
                end
            end
        end)
    end)
end

autorejoin()

LP:AddToggle("No Drown", {Toggled = Settings.Nodrown, Description = "Make you cant drown in water."}, function(state)
    Settings.Nodrown = state
    SetEN("Nodrown", "Setting", state)
end)

LP:AddToggle("No Fall Damage", {Toggled = Settings.NoFallDame, Description = "Make you get no damage when fall."}, function(state)
    Settings.NoFallDame = state
    SetEN("NoFallDame", "Setting", state)
end)

LP:AddToggle("Dash No Stamina", {Toggled = Settings.DashNoStam, Description = "Dashing wont take stamina."}, function(state)
    Settings.DashNoStam = state
    SetEN("DashNoStam", "Setting", state)
end)

MainFarm:AddToggle("Fast Farm", {Toggled = Settings.FastFarm, Description = "Farm peli, and go to fishman island farm until level max."}, function(state)
    Settings.FastFarm = state
    SetEN("NoFallDame",state)
end)

MainFarm:AddToggle("Chest", {Toggled = Settings.Chest, Description = "Farm peli"}, function(state)
    Settings.Chest = state
    SetEN("NoFallDame",state)
end)

MainFarm:AddButton("Fishman Island TP", function(state)
    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
    local location = CFrame.new(5639.86865, -92.762001, -16611.4688, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    pl.CFrame = location
end)

local DoneSeq="0 1 1 1 0 1 1 1 1 0 "
function IsSkillUnlocked(skill)
    if plr.PlayerGui:FindFirstChild("Keys") then
        if plr.PlayerGui.Keys:FindFirstChild("Frame") then
            if plr.PlayerGui.Keys.Frame:FindFirstChild(skill) then
                if plr.PlayerGui.Keys.Frame[skill].TextLabel.TextLabel.Text ~= "???" then
                    return true
                end
            end
        end
    end
    return false
end

function IsSkillReady(skill)
    if plr.PlayerGui:FindFirstChild("Keys") then
        if plr.PlayerGui.Keys:FindFirstChild("Frame") then
            if plr.PlayerGui.Keys.Frame:FindFirstChild(skill) then
                if pcall(function() return plr.PlayerGui.Keys.Frame[skill].TextLabel.Frame.UIGradient.Color end) then 
                    if tostring(plr.PlayerGui.Keys.Frame[skill].TextLabel.Frame.UIGradient.Color)==DoneSeq then 
                        return true
                    end
                end
            end
        end
    end
    return false
end

SF:AddToggle("Ship Farm", {Toggled = Settings.ShipFarm, Description = "Ship Farm will spawn a ship and kill the marine/pirate ships."}, function(state)
    Settings.ShipFarm = state
    SetEN("Noclip", "ShipFarm", state)
    SetEN("NoFallDame","ShipFarm",state)
end)

SF:AddDropdown("Ship Farm Method", {
    List = {"Sword","Black Leg"},
    Default =  Settings.ShipFarmMode
}, function(item)
    Settings.ShipFarmMode = item
end)
SF:AddToggle("Kill Cannoners", {Toggled = Settings.KillCannon, Description = "Will kill cannoners then kill marine boss."}, function(state)
    Settings.KillCannon = state
end)

SF:AddButton("Set Ship Spawn Location", function(args)
    Settings.ShipPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end)

function TpE(e,f)
    if e:FindFirstChild("HumanoidRootPart") then 
        repeat wait() 
        spawn(function() 
            if e:FindFirstChild("HumanoidRootPart") then 
                Tp(e.HumanoidRootPart.CFrame*CFrame.new(0, -0.75, 3))
            end
        end)
        until not e:FindFirstChild("HumanoidRootPart") or not pcall(function() return game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end) or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-e.HumanoidRootPart.Position).magnitude<5 or not e.Parent or not f()
    end
end

local function KillCaMap()
    for i, v in ipairs(game.workspace.NPCs:GetChildren()) do
		if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Name == "Shark" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health ~= 0 then
			local magnitude = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
			if magnitude < 10 then
				game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, true, game, 1)
			end
		end
    end
end
function EquipWpShip()
    if StoringDF then return end
    if Settings.ShipFarmMode == "Black Leg" then
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Backpack:FindFirstChild("BlackLeg") then
            plr.Character.Humanoid:EquipTool(plr.Backpack.BlackLeg)
        end
    else
        local sword, equip = GetSword()
        if sword and not equip then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(sword)
            end
        end
    end
end

function GetAllMobInShip(ship)
    local Mobs = {}
    for k,v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do 
        if v:FindFirstChild("assignedShip") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then 
            if v:FindFirstChild("HumanoidRootPart") then 
                if v.assignedShip.Value == ship then 
                    table.insert(Mobs,v)
                end
            end
        end
    end
    return Mobs
end

function Kill(v,f) 
    local tween = true
    repeat
        wait() 
        EquipWpShip()
        if v:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then 
            TpE(v,function() 
                return tween
            end) 
            if v:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).magnitude<5 then 
                MucTieu.MucTieu = v.HumanoidRootPart
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, true, game, 1)
                if Settings.ShipFarmMode=="Black Leg" then 
                    if IsSkillUnlocked("Party Table Kick Course") then
                        if data.Stamina.Value>40 then 
                            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer("Party Table Kick Course")
                        end
                    end
                end
                if Settings.ShipFarmMode=="Sword" then 
                    if IsSkillUnlocked("Rapid Slashes") then
                        if data.Stamina.Value>20 then 
                            game:GetService("ReplicatedStorage").Events.Skill:InvokeServer("Rapid Slashes")
                        end
                    end
                end
                
            end
        end
    until f(v)
    MucTieu.MucTieu = nil
    tween = false
end

--[[game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(fruit)
if fruit:FindFirstChild("FruitModel") then
    spawn(function()
        if Settings.AutoStoreDF then 
            local s, DFBackpackOwn = pcall(game:GetService("MarketplaceService").UserOwnsGamePassAsync, game:GetService("MarketplaceService"), plr.UserId, 12776768)
            if (s and DFBackpackOwn)
            or string.find(data.Inventory.Inventory.Value, "Fruit Bag") then
                local v = fruit
                StoringDF = true
                local t = tick()
                    
                repeat task.wait(1)
                    plr.Character.Humanoid:EquipTool(v)
                    wait(.5)
                    if pcall(function() return plr.PlayerGui.storefruit.TextButton end) and plr.PlayerGui.storefruit.TextButton.Visible == true then
                        FireButton(plr.PlayerGui.storefruit.TextButton)
                    end
                until not v
                or not v.Parent
                or not Settings.AutoStoreDF or tick()-t > 5
                StoringDF = false
            end
        end
    end)
    if Settings.DFWebHook then 
        if Settings.WebHookUrl then 
            local request = http_request or request or (http and http.request) or (syn and syn.request)
            local plr = game.Players.LocalPlayer
            local msg = {
                ["content"] = (Settings.MentionEveryone and "@everyone") or "",
                ["embeds"] = {{
                        ["title"] = "Grand Piece Online",
                        ["description"] = "Webhook notified something.",
                        ["type"] = "rich",
                        ["color"] = tonumber(0x9925be),
                        ["footer"] = {
                            ["text"] = "Said Client",
                            ["icon_url"] = "https://cdn.discordapp.com/attachments/1069737282908737697/1077973243085996093/Said_Client_g.png"
                        },
                            ["fields"] = {
                            {
                                ["name"] = "Player Name",
                                ["value"] = "Seu pai",
                                ["inline"] = false
                            },
                            {
                                ["name"] = "Fruit",
                                ["value"] = fruit.Name,
                                ["inline"] = false
                            },
                            {
                                ["name"] = "Time",
                                ["value"] = (function()
                                local function format(num, digits)
                                    return string.format("%0" .. digits .. "i", num);
                                end;
                                
                                local osDate = os.date("!*t")
                                local year, mon, day = osDate["year"], osDate["month"], osDate["day"]
                                local hour, min, sec = osDate["hour"], osDate["min"], osDate["sec"]
                                return year .. "/" .. format(mon, 2) .. "/" .. format(day, 2) .. " | " .. format(hour, 2) .. ":" .. format(min, 2) .. ":" .. format(sec, 2) .. ""
                                end)();
                            ["inline"] = false
                        }
                    },
                }}
            }

            local function SendWebHook()
                request({
                    Url = Settings.WebHookUrl,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode(msg)
                })
            end
                SendWebHook()
            end
        end
    end
end)--]]

function GetMob(name,stud)
    for k,v in pairs(game.Workspace.NPCs:GetChildren()) do 
        if v.Name == name and v:FindFirstChild("HumanoidRootPart") then 
            if plr.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).magnitude < stud then 
                return v
            end
        end
    end
end

function ShipGetNearestMobSM(mob)
    local nr = nil
    for k, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        if string.match(v.Name, mob) and v:FindFirstChild("assignedShip") then
            if
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and
                    v:FindFirstChild("Humanoid") and
                    v.Humanoid.Health > 0
             then
                if not nr then
                    nr = v
                end
                if
                    nr and nr:FindFirstChild("HumanoidRootPart") and
                        (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude <
                            (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - nr.HumanoidRootPart.Position).magnitude
                 then
                    nr = v
                end
            end
        end
    end
    if nr then 
        if
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and nr:FindFirstChild("HumanoidRootPart") and
        nr:FindFirstChild("Humanoid") and
        nr.Humanoid.Health > 0 then 
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - nr.HumanoidRootPart.Position).magnitude <1000 then 
                    return nr
                end
            end
    end
    --return nr
end

spawn(function() 
    while wait(.5) do 
        if Settings.ShipFarm then
            if Settings.ShipPos and Settings.ShipPos ~= Vector3.new(0,0,0) and not ShipGetNearestMobSM("Captain") then
                if Settings.KillCannon then 
                    if not ShipGetNearestMobSM("Cannoneer") then 
                        Tp(CFrame.new(Settings.ShipPos))
                    end
                else
                    Tp(CFrame.new(Settings.ShipPos))
                end
            end

            if not game.workspace.Ships:FindFirstChild(game.Players.LocalPlayer.Name.."Ship") then 
                game:GetService("ReplicatedStorage").Events.ShipEvents.Spawn:InvokeServer("true")
            end

            EquipWpShip()
            KillCaMap()
            local v = ShipGetNearestMobSM("Captain")
            if v then 
                if v:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).magnitude<1000 then 
                    if v.Name=="Marine Captain" or v.Name=="Pirate Captain" and Settings.ShipFarm and v:FindFirstChild("assignedShip") then
                        local ship = v.assignedShip.Value
                        if ship then 
                            local function dk(v) 
                                return not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health==0 or not Settings.ShipFarm
                            end
                            Kill(v,dk)
                        end
                    end
                end
            else
                if Settings.KillCannon then 
                    if Settings.ShipFarm then 
                        local v=ShipGetNearestMobSM("Cannoneer")
                        if v and v:FindFirstChild("HumanoidRootPart") then 
                            local function dk(v) 
                                return not v.Parent or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health==0 or not Settings.ShipFarm
                            end
                            Kill(v,dk)
                        end
                        
                    end
                end
            end
        end
        if not Settings.ShipFarm then 
            AutoClick=false
        end
    end
end)

spawn(function()
    while task.wait() do
        if Settings.FastFarm then
            function backpos()
                    local vt = 10000
                    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
                    local CFrameEnd = CFrame.new(8002.84766, -2153.8291, -17152.8047)
                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude / vt,Enum.EasingStyle.Linear)
                    local tween = game:GetService("TweenService"):Create(pl, info, {CFrame = CFrameEnd})
                    tween:Play()
                    tween.Completed:Wait()
                
                if tween.completed then
                    local vt = 10000
                    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
                    local CFrameEnd = CFrame.new(7856.00391, -2153.8291, -17158.3359)
                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude / vt,Enum.EasingStyle.Linear)
                    local tween = game:GetService("TweenService"):Create(pl, info, {CFrame = CFrameEnd})
                    tween:Play()
                    tween.Completed:Wait()
                
                    if tween.completed then
                        local vt = 5000
                        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
                        local CFrameEnd = CFrame.new(7826.61865, -2129.48486, -17134.5547)
                        local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude / vt,Enum.EasingStyle.Linear)
                        local tween = game:GetService("TweenService"):Create(pl, info, {CFrame = CFrameEnd})
                        tween:Play()
                        tween.Completed:Wait()
                    end
                end
            end
                
            function quest()
                local data = game.ReplicatedStorage["Stats"..game.Players.LocalPlayer.Name]
                if data.Stats.Level.Value > 189 and GetCurrentQuest()=="None" then
                    if GetCurrentQuest()~="None" then 
                        game:GetService("ReplicatedStorage").Events.Quest:InvokeServer({"quit"})
                    end

                    local vt = 10000
                    local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
                    local CFrameEnd = CFrame.new(7731.00537, -2175.83203, -17222.9922, 0.0361520983, -2.75714633e-08, 0.999346316, 5.89703824e-08, 1, 2.54562007e-08, -0.999346316, 5.80115369e-08, 0.0361520983)
                    local info = TweenInfo.new((game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude / vt,Enum.EasingStyle.Linear)
                    local tween = game:GetService("TweenService"):Create(pl, info, {CFrame = CFrameEnd})
                    tween:Play()
                    tween.Completed:Wait()
                    if tween.Completed then
                        GetQuest("Help becky", true)
                    end
                end
            end
                
            function balaa()
                while true and task.wait(.4) do
                    local head = game.Workspace.NPCs["Fishman Karate User"].HumanoidRootPart.Position
                    local args = {
                        [1] = "reload",
                        [2] = {
                            ["Gun"] = "Rifle"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").Events.CIcklcon.gunFunctions:InvokeServer(unpack(args))
                    local args = {
                        [1] = "fire",
                        [2] = {
                            ["Start"] = CFrame.new(7826.61865, -2129.48486, -17134.5547),
                            ["Gun"] = "Rifle",
                            ["joe"] = "true",
                            ["Position"] = Vector3.new(head.X, head.Y, head.Z)
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").Events.CIcklcon:FireServer(unpack(args))
                end
            end
        
            while Settings.FastFarm and task.wait() do
            pcall(function()
                    backpos()
                    balaa()
                    quest()
                end)
            end
        end
    end
end)

spawn(function()
    while task.wait() do
    if Settings.Chest then
        local chest = GetNearestChest()
            if chest and data.Stats.Peli.Value < 300 then
                CollectChest(chest)
            end
        end
    end
end)
