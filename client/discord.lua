ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do 
         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do 

        Citizen.Wait(1000)

      -- Zmienne
        local playername = GetPlayerName(PlayerId())
        local PlayerData = ESX.GetPlayerData()
        local job = ESX.PlayerData.job and ESX.PlayerData.job.name 

            SetDiscordAppId(Config.DiscordAppID) -- Application ID
            SetDiscordRichPresenceAsset(Config.Logoduze) -- Logo     
            SetDiscordRichPresenceAssetSmall(Config.Logomale) -- Mniejsze Logo
            SetDiscordRichPresenceAssetSmallText(playername .. ' | Graczy ' ..#GetActivePlayers() .. '/' .. Config.Sloty)
            SetDiscordRichPresenceAssetText(Test)

                   
            SetDiscordRichPresenceAction(0, 'Dołącz na serwer FiveM',  Config.IP)
            SetDiscordRichPresenceAction(1, 'Dołącz na Discord',  Config.LinkDiscord)
    

        if PlayerData.job.name == 'police' then 
            SetRichPresence('Zwalcza Zbrodnie')
        elseif PlayerData.job.name == 'ambulance' then
            SetRichPresence('Ratuje obywateli')
        elseif PlayerData.job.name == Config.MechanikJob then 
            SetRichPresence('Majsterkuje')
        end
    end
end)