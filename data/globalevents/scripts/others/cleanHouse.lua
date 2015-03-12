local days = 20 -- Se ele estiver 20 dias sem logar, ele perde a house

function onStartup()
	local resultId = db.storeQuery("SELECT `owner`,`id` FROM `houses`;")

	if resultId then
		repeat
			local aux = db.storeQuery("SELECT `lastlogin` FROM `players` WHERE `id` = ".. result.getDataString(resultId, "owner") .. ";")

			if aux then
				if result.getDataInt(aux, "lastlogin") < os.time() - (days * 86400) then
					House(result.getDataInt(resultId, "id")):setOwnerGuid(-1)
				end
			end

		until not result.next(resultId)
	end
	saveServer()

	return true
end
