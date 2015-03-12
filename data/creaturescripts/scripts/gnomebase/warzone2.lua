function onKill(cid, target)
	if(string.lower(getCreatureName(target)) == "parasite" and getGlobalStorageValue(3149) < 1) then
		pos = {
			{x = 33097, y = 31976, z = 11},
			{x = 33097, y = 31977, z = 11},
			{x = 33097, y = 31978, z = 11},
			{x = 33097, y = 31979, z = 11}
		}
		barrier = false
		for i = 1, 4 do
			if(getCreaturePosition(target).x == pos[i].x and
				getCreaturePosition(target).y == pos[i].y and
				getCreaturePosition(target).z == pos[i].z
			) then
				barrier = true
			end
		end	
		last = false
			if(barrier == true) then
					doRemoveItem(getTileItemById({x = 33098, y = 31976, z = 11}, 18459).uid, 1)
					doRemoveItem(getTileItemById({x = 33098, y = 31977, z = 11}, 18459).uid, 1)
					doRemoveItem(getTileItemById({x = 33098, y = 31978, z = 11}, 18459).uid, 1)
					doRemoveItem(getTileItemById({x = 33098, y = 31979, z = 11}, 18459).uid, 1)
					addEvent(doCreateItem, 40 * 1000, 18459, {x = 33098, y = 31976, z = 11})
					addEvent(doCreateItem, 40 * 1000, 18459, {x = 33098, y = 31977, z = 11})
					addEvent(doCreateItem, 40 * 1000, 18459, {x = 33098, y = 31978, z = 11})
					addEvent(doCreateItem, 40 * 1000, 18459, {x = 33098, y = 31979, z = 11}) 
					addEvent(doSummonCreature, 45*1000, "Gnomevil", {x = 33117, y = 31956, z = 11})     	
					last = true
				end
			end
			if(barrier == true and last == true) then
				setGlobalStorageValue(3149, 1)
				addEvent(setGlobalStorageValue, 30 * 60 * 1000, 3149, 0)  	
		end
	return true
end