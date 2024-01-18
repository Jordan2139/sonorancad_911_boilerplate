AddEventHandler('rahe-racing:server:raceStarted', function(startCoords, participants)
    TriggerClientEvent('rahe-racing:client:raceStarted', source)
end)
