taskcustom = {	
	['Pirate buccaneer'] = {storage = 14005, amount = 3000},
	['Pirate corsair'] = {storage = 14005, amount = 3000},
	['Pirate cutthroat'] = {storage = 14005, amount = 3000},
	['Pirate ghost'] = {storage = 14005, amount = 3000},
	['Pirate marauder'] = {storage = 14005, amount = 3000},
	['Pirate skeleton'] = {storage = 14005, amount = 3000},

	['Minotaur'] = {storage = 14004, amount = 5000},
	['Minotaur Archer'] = {storage = 14004, amount = 5000},
	['Minotaur Guard'] = {storage = 14004, amount = 5000},
	['Minotaur Mage'] = {storage = 14004, amount = 5000},

	['Necromancer'] = {storage = 14003, amount = 4000},
	['Priestess'] = {storage = 14003, amount = 4000}
}

function onKill(cid, target, lastHit)
	local creature = taskcustom[getCreatureName(target)]
	if creature then
		if isInArray({-1, creature.amount}, getPlayerStorageValue(cid, creature.storage)) or (not isInArray({14003, 14004, 14005,}, creature.storage) and getPlayerStorageValue(cid, 14500) ~= creature.storage) then
			return true
		end

		local newValue = getPlayerStorageValue(cid, creature.storage) + 1
		setPlayerStorageValue(cid, creature.storage, newValue)
		end
	return true
end