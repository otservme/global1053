function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local targetItem = Item(itemEx.uid)
	if player:getStorageValue(12001) >= 21 then
		if itemEx.itemid == 7106 and item.itemid == 7286 then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:say("You take some hot water from the geyser.", TALKTYPE_ORANGE_1)
			Item(item.uid):transform(7246)
		elseif itemEx.itemid == 7261 and item.itemid == 2566 then
			if player:getStorageValue(12004) < 1 then
				player:addItem(7248, 1)
				player:setStorageValue(12004, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:say("You cut a leaf from a frostbite herb.", TALKTYPE_ORANGE_1)
			end
		elseif itemEx.itemid == 388 and item.itemid == 2565 then
			if player:getStorageValue(12005) < 1 then
				player:addItem(8301, 1)
				player:setStorageValue(12005, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say("You retrive a fine sulphur from a lava hole.", TALKTYPE_ORANGE_1)
			end
		elseif itemEx.itemid == 2733 and item.itemid == 2566 then
			if player:getStorageValue(12006) < 1 then
				player:addItem(7245, 1)
				player:setStorageValue(12006, 1)
				targetItem:transform(2723)
				addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getTopVisibleThing() if thing and thing:isItem() then thing:transform(2733) end end end, 60 * 1000)			
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say("You cut a flower from a cactus.", TALKTYPE_ORANGE_1)
			end
		elseif itemEx.itemid == 4184 and item.itemid == 2565 then
			if player:getStorageValue(12007) < 1 then
				player:addItem(7251, 1)
				player:setStorageValue(12007, 1)
				toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
				player:say("You retrive spores from a mushroom.", TALKTYPE_ORANGE_1)
			end
		elseif itemEx.itemid == 4017 and item.itemid == 2566 then
			if player:getStorageValue(12008) < 1 then
				player:addItem(7249, 1)
				player:setStorageValue(12008, 1)
				targetItem:transform(4014)
				addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getTopVisibleThing() if thing and thing:isItem() then thing:transform(4017) end end end, 60 * 1000)			
				toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				player:say("You cut a flower from a bush.", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end