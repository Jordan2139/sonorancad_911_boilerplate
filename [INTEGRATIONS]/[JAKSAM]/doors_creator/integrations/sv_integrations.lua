RegisterNetEvent("doors_creator:alertedPolice", function(coords, message)
    TriggerClientEvent("doors_creator:triggerPoliceAlert", source)
end)
