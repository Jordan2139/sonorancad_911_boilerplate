AddEventHandler('rahe-boosting:client:importantBoostStarted', function(location, vehicleId, vehicleClass)
	if vehicleClass == 'A' or vehicleClass == 'B' then
		local pos = GetEntityCoords(PlayerPedId())
		local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
		local street1 = GetStreetNameFromHashKey(s1)
		local street2 = GetStreetNameFromHashKey(s2)
		local streetLabel = street1
		if street2 ~= nil then
			streetLabel = streetLabel .. ' ' .. street2
		end
		TriggerServerEvent('SonoranScripts::Call911', 'Bystander', streetLabel, 'A boosting job is in progress at ' .. streetLabel .. '.', exports['nearest-postal']:getPostal(), nil)
	end
end)

RegisterNetEvent('rahe-racing:client:raceStarted', function()
	local pos = GetEntityCoords(PlayerPedId())
	local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
	local street1 = GetStreetNameFromHashKey(s1)
	local street2 = GetStreetNameFromHashKey(s2)
	local streetLabel = street1
	if street2 ~= nil then
		streetLabel = streetLabel .. ' ' .. street2
	end
	TriggerServerEvent('SonoranScripts::Call911', 'Bystander', streetLabel, 'A street race is in progress at ' .. streetLabel .. '.', exports['nearest-postal']:getPostal(), nil)
end)