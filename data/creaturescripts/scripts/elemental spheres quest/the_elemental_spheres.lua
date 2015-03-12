local boss = {
	["fire overlord"] = {g_storage = 40064, p_storage = 60027},
	["energy overlord"] = {g_storage = 40065, p_storage = 60028},
	["ice overlord"] = {g_storage = 40066, p_storage = 60029},
	["earth overlord"] = {g_storage = 40067, p_storage = 60030},
}


function onDeath(cid, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
	local pid = Player(mostdamagekiller)

	local t = boss[Creature(cid):getName():lower()]

	Player(pid):setStorageValue(t.p_storage, 1)
	setGlobalStorageValue(t.g_storage, -1)

	return true
end


function onKill(cid, target)
	if Creature(target):getName():lower() == "lord of the elements" then
		Player(cid):setStorageValue(60031, 1)
	end

	return true
end

function onLogin(cid)
	Player(cid):registerEvent("ElementalSpheresKill")
	return true
end
