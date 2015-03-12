function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'drillworm' then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.spikeTask.Killing) > 0 and player:getStorageValue(Storage.spikeTask.Killing) < 8 then
		player:setStorageValue(Storage.spikeTask.Killing, player:getStorageValue(Storage.spikeTask.Killing) + 1)
	end

	return true
end
