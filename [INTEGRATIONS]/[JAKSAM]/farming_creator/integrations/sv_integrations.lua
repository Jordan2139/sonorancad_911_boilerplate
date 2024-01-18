RegisterNetEvent("farming_creator:alertedPolice", function(coords, message)
    TriggerClientEvent('farming_creator:triggerPoliceAlert', source)
end)