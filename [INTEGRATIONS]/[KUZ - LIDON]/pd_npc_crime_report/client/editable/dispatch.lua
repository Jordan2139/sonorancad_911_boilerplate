-- REPLACE YOUR FUNCTION WITH THE ONE BELOW

function dispatch(playerCoords, eventInfo, eventName)

	if Config.dispatch == 'custom' then
		TriggerServerEvent('pd_npc_crime_report:sendAlert', playerCoords, eventInfo, eventName)

	elseif Config.dispatch == 'ps-dispatch' then
		exports['ps-dispatch']:CustomAlert({
			coords = playerCoords,
			message = eventInfo.blipName,
			dispatchCode = eventInfo.policeCode,
			description = eventInfo.description,
			radius = 0,
			sprite = eventInfo.blipSprite,
			color = eventInfo.blipColor,
			scale = eventInfo.blipScale,
			length = 3,
			recipientList = Config.policeRoles
		})

	elseif Config.dispatch == 'core-dispatch-old' then
		local hash, _ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		local street = GetStreetNameFromHashKey(hash)
		for _, job in ipairs(Config.policeRoles) do
			TriggerServerEvent('core_dispatch:addCall', eventInfo.policeCode, eventInfo.blipName, {
				{
					icon = 'fa-solid fa-user-police',
					info = street
				}
			}, {
				playerCoords[1],
				playerCoords[2],
				playerCoords[3]
			}, job, Config.blipTimeout * 1000, eventInfo.blipSprite, eventInfo.blipColor)
		end
	elseif Config.dispatch == 'core-dispatch-new' then
		local hash, _ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		local street = GetStreetNameFromHashKey(hash)
		for _, job in ipairs(Config.policeRoles) do
			exports['core_dispach']:addCall(eventInfo.policeCode, eventInfo.blipName, {
				{
					icon = 'fa-map-signs',
					info = street
				}
			}, {
				playerCoords[1],
				playerCoords[2],
				playerCoords[3]
			}, job, Config.blipTimeout * 1000, eventInfo.blipsprite, eventInfo.blipcolor)
		end

	elseif Config.dispatch == 'cd-dispatch' then
		local hash, _ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		local street = GetStreetNameFromHashKey(hash)

		local data = exports['cd_dispatch']:GetPlayerInfo()
		TriggerServerEvent('cd_dispatch:AddNotification', {
			job_table = Config.policeRoles,
			coords = playerCoords,
			title = eventInfo.policeCode,
			message = eventInfo.description .. ' at ' .. street,
			flash = 0,
			unique_id = tostring(math.random(0000000, 9999999)),
			blip = {
				sprite = eventInfo.blipSprite,
				scale = eventInfo.blipScale,
				colour = eventInfo.blipColor,
				flashes = false,
				text = eventInfo.blipName,
				time = Config.blipTimeout * 1000,
				sound = 1
			}
		})

	elseif Config.dispatch == 'mw-dispatch' then
		local new_jobs = {}
		for _, job in ipairs(Config.policeRoles) do
			new_jobs[job] = true
		end

		local pos = GetEntityCoords(PlayerPedId())
		local hash, _ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		local street = GetStreetNameFromHashKey(hash)
		local DispatchData = {
			jobs = new_jobs, -- enables every grade within job - ["police"] = {1,2,3} - would only allow grades 1, 2 and 3 to see the alert.
			code = eventInfo.policeCode, -- This is what comes up on the red box, usually 10 codes.
			callname = eventInfo.description, -- The title of the alert.
			coords = pos, -- Coords are needed to get the location which sets the blip location and gets the road name for the alert.
			info = {
				{
					icon = eventInfo.extraField3, -- Sets the alert icon for the third row of text in the alert (the alert info). You the icons here: https://fontawesome.com/icons
					label = eventInfo.description .. ' at ' .. street -- Sets the text for the alert info.
				}
			},
			blip = { -- All the blip settings.
				label = eventInfo.blipName,
				sprite = eventInfo.blipSprite,
				scale = eventInfo.blipScale,
				colour = eventInfo.blipColor,
				flash = false,
				fadeTime = Config.blipTimeout * 1000, -- about of time for the blip to fade away.
				leaveMiniMap = false -- sets if the blips stay on the mini map or not even if not close to the blip location.
			},
			sound = false
		}
		exports['mw-dispatch']:NewAlert(DispatchData)

	elseif Config.dispatch == 'NPC911' then
		local name = GetPlayerName(PlayerId())
		local x, y, z = table.unpack(playerCoord)
		local street = GetStreetNameAtCoord(x, y, z)
		local location = GetStreetNameFromHashKey(street)
		local msg = eventInfo.description
		TriggerServerEvent('911', location, msg, x, y, z, name)

	end

    TriggerServerEvent('SonoranScripts::Call911', 'Bystander', eventInfo.description, exports['nearest-postal']:getPostal(), nil)
end
