-- REPLACE YOUR FUNCTION WITH THE ONE BELOW
function playAlarm()
	if blipData ~= nil then
		if blipData.alarmSound and ((not completed and Config.OnComplete.disableAlarmSound) or not Config.OnComplete.disableAlarmSound) then
			PlaySoundFromCoord(-1, 'scanner_alarm_os', blipData.coords, 'dlc_xm_iaa_player_facility_sounds', 0, 100, 0)
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
	TriggerServerEvent('SonoranScripts::Call911', 'Silent Alarm', streetLabel, 'This is an automatically triggered silent alarm from a heist.', exports['nearest-postal']:getPostal(), nil)
end
