function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(getPlayerStorageValue(cid, 54885) < 999999999) then
		doPlayerAddItem(cid, 2160, 100)
		doPlayerAddItem(cid, 2471, 1)
		doPlayerAddItem(cid, 2494, 1)
		doPlayerAddItem(cid, 22424, 1)
		doPlayerAddItem(cid, 22421, 1)
		doPlayerAddItem(cid, 22418, 1)
		doPlayerAddItem(cid, 22415, 1)
		doPlayerAddItem(cid, 22412, 1)
		doPlayerAddItem(cid, 22409, 1)
		doPlayerAddItem(cid, 22406, 1)
		doPlayerAddItem(cid, 22400, 1)
		doPlayerAddOutfit(cid, 637, 3)
		doPlayerAddOutfit(cid, 636, 3)
		doPlayerAddOutfit(cid, 635, 3)
doPlayerAddOutfit(cid, 634, 3)
doPlayerAddOutfit(cid, 633, 3)
doPlayerAddOutfit(cid, 632, 3)
doPlayerAddOutfit(cid, 618, 3)
doPlayerAddOutfit(cid, 610, 3)
doPlayerAddMount(cid, 52)
doPlayerAddMount(cid, 51)
doPlayerAddMount(cid, 50)
doPlayerAddMount(cid, 49)
doPlayerAddMount(cid, 48)
doPlayerAddMount(cid, 47)
doPlayerAddMount(cid, 46)
		doPlayerAddExp(cid, 1000000000000, true, true)
	end
	return true
end
