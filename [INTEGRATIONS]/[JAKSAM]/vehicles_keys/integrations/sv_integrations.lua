RegisterNetEvent("vehicles_keys:alertedPolice", function(coords, message)
    TriggerClientEvent("vehicles_keys:triggerPoliceAlert", source)
end)
