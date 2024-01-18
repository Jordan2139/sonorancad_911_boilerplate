RegisterNetEvent("drugs_creator:alertedPolice", function(coords, message)
    TriggerClientEvent("drugs_creator:triggerPoliceAlert", source)
end)
