-- REPLACE YOUR FUNCTION WITH THE ONE BELOW

RegisterServerEvent("BCallpilot:policecall")
AddEventHandler("BCallpilot:policecall", function()
    if Config.framework == 'esx' then

        local xPlayer  = ESX.GetPlayerFromId(source)
        local xPlayers = ESX.GetPlayers()
        local ubi = xPlayer.getCoords()

        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == 'police' then
                SendServerNotification(xPlayers[i], "info", Config.Translations[Config.Translations['language']][11], time)
                TriggerClientEvent('BCallpilot:polblip', xPlayers[i], ubi)
            end
        end

    elseif Config.framework == 'qbcore' then

        local src = source
        local get = GetPlayerPed(src)
        local coords = GetEntityCoords(get)
        local Player = QBCore.Functions.GetPlayer(src)
        local xPlayers = QBCore.Functions.GetPlayers()
        local ubi = GetEntityCoords(get, coords)

        for i=1, #xPlayers, 1 do
            local xPlayer = QBCore.Functions.GetPlayers(xPlayers[i])
            if Player.PlayerData.job.name == 'police' or Player.PlayerData.job.name == 'sheriff' or Player.PlayerData.job.name == 'security' then
                SendServerNotification(xPlayers[i], "info", Config.Translations[Config.Translations['language']][11], time)
                TriggerClientEvent('BCallpilot:polblip', xPlayers[i], ubi)
            end
        end

    end
    TriggerClientEvent('BCallpilot:sendCall', source)
end)