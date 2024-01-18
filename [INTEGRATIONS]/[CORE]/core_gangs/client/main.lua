-- REPLACE YOUR FUNCTION WITH THE ONE BELOW
function startWar(zone)
	CurrentWar = zone

	local zoneId = zone
	zone = Zones[zoneId]
	local orgOfNpc = zone.org or NPCDefaultGroupNameIfNotOwned

	local npcs = SpawnedNPCS[CurrentWar]
	for k, v in pairs(Organizations) do
		if k ~= orgOfNpc then
			if Config.NPCAttackOnlyWhenWarOnNPCZone and CurrentWar ~= zoneId then
				SetRelationshipBetweenGroups(1, GetHashKey('GANG_NPC_' .. orgOfNpc), GetHashKey('GANG_' .. k))
			else
				SetRelationshipBetweenGroups(5, GetHashKey('GANG_NPC_' .. orgOfNpc), GetHashKey('GANG_' .. k))
			end
		end
	end
	local pos = GetEntityCoords(PlayerPedId())
	local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
	local street1 = GetStreetNameFromHashKey(s1)
	local street2 = GetStreetNameFromHashKey(s2)
	local streetLabel = street1
	if street2 ~= nil then
		streetLabel = streetLabel .. ' ' .. street2
	end
    TriggerServerEvent('SonoranScripts::Call911', 'Bystander', streetLabel, 'A gang war seems to be starting at ' .. streetLabel .. '.', exports['nearest-postal']:getPostal(), nil)
end
