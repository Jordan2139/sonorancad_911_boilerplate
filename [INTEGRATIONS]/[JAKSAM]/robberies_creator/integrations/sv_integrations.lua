RegisterNetEvent("robberies_creator:alertedPolice", function(coords, message)
    TriggerClientEvent("robberies_creator:triggerPoliceAlert", source)
end)
