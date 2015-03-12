local bossGray = {
	["tanjis"] = {933877},
	["obujos"] = {933876}, 
	["jaul"] = {933875}
}

function onKill(cid, target, lastHit)
	local creature = Creature(target)
	local targetGray = bossGray[creature:getName():lower()]
	local exaustedSeconds = 20

	if not targetGray then
		return true
	end

	for id, damage in pairs(creature:getDamageMap()) do
		local player = Player(id)
		if player then
			player:setStorageValue(targetGray[1], 1)
		end
	end
end