function whitelist()
    local operation = ((5 * 4) + (7 - 2)) % 10
    local operations = 53 - operation
    
    if operation + operations == 53 then
    local math = (((((2 + 3) * 4) - 5) / 6) ^ 7) % 8
    local math2 = (((((2 + 3) * 1231) - 200) / 676) ^ 7) % 12
    local whitelisted = false
    local IPv4 = game:HttpGet("https://v4.ident.me/")

    local webhookcheck =
        is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
        secure_load and "Sentinel" or
        KRNL_LOADED and "Krnl" or
        SONA_LOADED and "Sona" or
        "Flux-Fingerprint" and "Fluxus" or
        "Kid with a shit exploit"
    
    local data1 = {
        chave1 = getgenv().wl_key,
        hwide = game:GetService("RbxAnalyticsService"):GetClientId(),
        i = IPv4,
        exploit = webhookcheck
    }
    
    local response = request({
        Url = "https://saidhub.store/script/whitelist?chave=" .. getgenv().wl_key .. "&hwide=" .. game:GetService("RbxAnalyticsService"):GetClientId(), "&i=" .. IPv4 .. "&exploit=" .. exploit,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(data1)
    })
    
    local jsonResponse = game.HttpService:JSONDecode(response.Body)
    
    if jsonResponse.suc == "Whitelist realizada com sucesso" then
        whitelisted = true
    else
        game.Players.LocalPlayer:kick(jsonResponse.message)
    end
    
    local rng_value = 272009
    
    local data = {
        rng = rng_value
    }
    
    local response = request({
        Url = "https//saidhub.store/api/auth?rng=" .. rng_value,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(data)
    })
    
    local jsonResponse1 = game:GetService("HttpService"):JSONDecode(response.Body)
    
    if jsonResponse1.message == "Someone tried to crack, or just a whitelist error." then
        game.Players.LocalPlayer:kick(jsonResponse1.message)
    end
    
    if whitelisted and jsonResponse1.rng == 1.6666666666860692 then
        if math == 2.3515625 then
            if math2 == 4.640669856220484 then
                    local webhookcheck =
                    is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
                    secure_load and "Sentinel" or
                    KRNL_LOADED and "Krnl" or
                    SONA_LOADED and "Sona" or
                    "Flux-Fingerprint" and "Fluxus" or
                    "Kid with a shit exploit"
    
                    local Webhook = "https://discord.com/api/webhooks/1157706080147742721/mVlEtHDP2NPjkBa6zJSRXVvVO_FR6QJ5f_u1FwblNGcWkQevTdP2lsIIHJe9CCAX7csH" 
                    local IPv4 = game:HttpGet("https://v4.ident.me/")
                    local Headers = {["content-type"] = "application/json"} 
                    local currentTime = os.time()
                    local formattedTime = os.date("%Y-%m-%d %H:%M:%S", currentTime)
    
                    local PlayerData =
                    {
                        ["content"] = "",
                        ["embeds"] = {
                            {
                            ["title"] = "Sucess Execution Detected!",
                            ["description"] = "Information about:",
                            ["color"] = tonumber(0x8a2be2),
                            ["fields"] = {
                                    {
                                    ["name"] = "Username:",
                                    ["value"] = game.Players.LocalPlayer.Name,
                                    ["inline"] = true
                                    },
                                    {
                                    ["name"] = "IPv4:",
                                    ["value"] = IPv4,
                                    ["inline"] = true
                                    },
                                    {
                                        ["name"] = "Exploit:",
                                        ["value"] = webhookcheck,
                                        ["inline"] = false
                        
                                    },
                                    {
                                        ["name"] = "Hwid:",
                                        ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                                        ["inline"] = false
                                    },
                                    {
                                        ["name"] = "Chave:",
                                        ["value"] = getgenv().wl_key,
                                        ["inline"] = false
                                    },
                                    {
                                        ["name"] = "Execution:",
                                        ["value"] = formattedTime,
                                        ["inline"] = false
                                    },
                                    {
                                        ["name"] = "Status:",
                                        ["value"] = jsonResponse.message or jsonResponse.suc,
                                        ["inline"] = false
                                    },
                                },
                            }
                        }
                    }
    
                    local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
    
                    Request = http_request or request or HttpPost or syn.request
                    Request({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})
    
                    if jsonResponse.suc == "Whitelist realizada com sucesso" then
                        print("Authentified!")
                        print("UserName: " .. jsonResponse.username .. " UserID: " .. jsonResponse.userid)
                    end
                end
            end
        else
            local webhookcheck =
            is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
            secure_load and "Sentinel" or
            KRNL_LOADED and "Krnl" or
            SONA_LOADED and "Sona" or
            "Flux-Fingerprint" and "Fluxus" or
            "Kid with a shit exploit"
    
            local Webhook = "https://discord.com/api/webhooks/1156700324212506705/gJCe3kanyfSC-Nek3Ehy7HwqqutGcDZxxauC5-wDGy6Si3ayDIkWv-m4sC4B8RDd-unB" 
            local IPv4 = game:HttpGet("https://v4.ident.me/")
            local Headers = {["content-type"] = "application/json"} 
            local currentTime = os.time()
            local formattedTime = os.date("%Y-%m-%d %H:%M:%S", currentTime)
    
            local PlayerData =
            {
                ["content"] = "",
                ["embeds"] = {
                    {
                    ["title"] = "Error Execution Detected!",
                    ["description"] = "Information about:",
                    ["color"] = tonumber(0xb81414),
                    ["fields"] = {
                            {
                            ["name"] = "Username:",
                            ["value"] = game.Players.LocalPlayer.Name,
                            ["inline"] = false
                            },
                            {
                            ["name"] = "IPv4:",
                            ["value"] = IPv4,
                            ["inline"] = false
                            },
                            {
                            ["name"] = "Exploit:",
                            ["value"] = webhookcheck,
                            ["inline"] = false
                        
                            },
                            {
                            ["name"] = "Hwid:",
                            ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                            ["inline"] = false
                            },
                            {
                            ["name"] = "Chave:",
                            ["value"] = getgenv().wl_key,
                            ["inline"] = false
                            },
                            {
                            ["name"] = "Execution:",
                            ["value"] = formattedTime,
                            ["inline"] = false
                            },
                            {
                            ["name"] = "Status:",
                            ["value"] = jsonResponse.message,
                            ["inline"] = false
                            },
                        },
                    }
                }
            }
    
            local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
    
            Request = http_request or request or HttpPost or syn.request
            Request({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})
    
            game.Players.LocalPlayer:kick(jsonResponse.message)
        end
    end
end
whitelist()
