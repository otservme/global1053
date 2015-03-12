local boss = {
	["deathstrike"] = {924877, 524627},
	["gnomevil"] = {924878, 524628}, 
	["abyssador"] = {924879, 524629}
}

function onKill(cid, target, lastHit)
	local creature = Creature(target)
	local targetName = boss[creature:getName():lower()]
	local exaustedSeconds = 20

	if not targetName then
		return true
	end

	for id, damage in pairs(creature:getDamageMap()) do
		local player = Player(id)
		if player then
			player:setStorageValue(targetName[1], 1)
			player:setStorageValue(targetName[2], os.time()+exaustedSeconds*3600)
		end
	end
end