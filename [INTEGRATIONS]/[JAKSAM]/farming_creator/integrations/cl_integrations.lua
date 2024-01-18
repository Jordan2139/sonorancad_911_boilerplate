RegisterNetEvent('farming_creator:triggerPoliceAlert', function()
	local pos = GetEntityCoords(PlayerPedId())
	local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
	local street1 = GetStreetNameFromHashKey(s1)
	local street2 = GetStreetNameFromHashKey(s2)
	local streetLabel = street1
	if street2 ~= nil then
		streetLabel = streetLabel .. ' ' .. street2
	end
	local postal = exports['nearest-postal']:getPostal()
	TriggerServerEvent('SonoranScripts::Call911', 'Bystander', streetLabel, 'I think a field is burning!', postal, nil)
end)
