local teleportPosition = Position(33075, 31878, 12)

local function transformTeleport()
	local teleportItem = Tile(teleportPosition):getItemById(1387)
	if not teleportItem then
		return
	end

	teleportItem:transform(18463)
end

function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'versperoth' then
		return true
	end

	setGlobalStorageValue(3147, 2)
	addEvent(setGlobalStorageValue, 30 * 60 * 1000, 3147, 0)
	doRemoveItem(getTileItemById({x=33075, y=31878, z=12, stackpos = 253}, 18462).uid,1)
	tp = doCreateItem(1387, teleportPosition)
	doSetItemActionId(tp, 5161)
	addEvent(transformTeleport, 45 * 1000)
	return true
end
