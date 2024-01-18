-- REPLACE YOUR FUNCTION WITH THIS ONE
function OnPlayerDeath(stagetwo)
	if not isDead or isDead ~= 'dead' then
		isDead = 'dead'
		TriggerServerEvent('wasabi_ambulance:setDeathStatus', 'dead', true)
		DrugIntake = {}
		if not stagetwo then
			StartDeathTimer()
		end
		startDeathAnimation(false)
	else
		startDeathAnimation(true)
	end
	local pos = GetEntityCoords(PlayerPedId())
	local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
	local street1 = GetStreetNameFromHashKey(s1)
	local street2 = GetStreetNameFromHashKey(s2)
	local streetLabel = street1
	if street2 ~= nil then
		streetLabel = streetLabel .. ' ' .. street2
	end
	TriggerServerEvent('SonoranScripts::Call911', 'LifeAlert', 'I\'ve fallen and I can\'t get up! I\'m at ' .. streetLabel, exports['nearest-postal']:getPostal(), nil)
	if Config.CompleteDeath.enabled and wsb.framework == 'esx' then
		TriggerServerEvent('wasabi_ambulance:deathCount')
	end
end
