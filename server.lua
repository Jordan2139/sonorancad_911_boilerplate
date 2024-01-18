function call911(caller, location, description, postal, plate, cb)
	exports['sonorancad']:performApiRequest({
		{
			['serverId'] = GetConvar('sonoran_serverId', 1),
			['isEmergency'] = true,
			['caller'] = caller,
			['location'] = location,
			['description'] = description,
			['metaData'] = {
				['plate'] = plate,
				['postal'] = postal
			}
		}
	}, 'CALL_911', cb)
end

RegisterNetEvent('SonoranScripts::Call911', function(caller, location, description, postal, plate, cb)
	call911(caller, location, description, postal, plate, function(response)
		json.encode(response) -- Not, CB's can only be used on the server side, so we just print this here for you to see.
	end)
end)