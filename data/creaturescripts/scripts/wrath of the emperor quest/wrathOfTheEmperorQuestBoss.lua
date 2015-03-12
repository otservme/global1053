local boss = {
	["fury of the emperor"] = {pos = {x = 33048, y = 31085, z = 15}, storage = 3189},
	["wrath of the emperor"] = {pos = {x = 33094, y = 31087, z = 15}, storage = 3190},
	["scorn of the emperor"] = {pos = {x = 33095, y = 31110, z = 15}, storage = 3191},
	["spite of the emperor"] = {pos = {x = 33048, y = 31111, z = 15}, storage = 3192},
}

function onKill(cid, target)
	bossTmp = boss[string.lower(getCreatureName(target))]
	if(bossTmp) then	
		setGlobalStorageValue(bossTmp.storage, 0)
		addEvent(doTransformItem, 1*60*1000, getTileItemById(bossTmp.pos, 11753).uid, 12383)
	end
	return true
end