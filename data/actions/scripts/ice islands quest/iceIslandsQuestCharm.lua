function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local obelisk1 = {x = 32138, y = 31113, z = 14}
local obelisk2 = {x = 32119, y = 30992, z = 14}
local obelisk3 = {x = 32180, y = 31069, z = 14}
local obelisk4 = {x = 32210, y = 31027, z = 14}
	if  player:getStorageValue(12001) == 39 then
		if item.itemid == 7289 then
			if itemEx.itemid == 1354 then
				if toPosition.x == obelisk1.x and toPosition.y == obelisk1.y and toPosition.z == obelisk1.z then
					if player:getStorageValue(12004) < 5 then
						player:setStorageValue(12004, 5)
						player:setStorageValue(12036, player:getStorageValue(12036) + 1) -- Questlog The Ice Islands Quest, Formorgar Mines 4: Retaliation
						toPosition:sendMagicEffect(CONST_ME_FIREWORK_BLUE)
						player:say("You mark an obelisk with the frost charm.", TALKTYPE_ORANGE_1)
					end
				elseif toPosition.x == obelisk2.x and toPosition.y == obelisk2.y and toPosition.z == obelisk2.z then
					if player:getStorageValue(12005) < 5 then
						player:setStorageValue(12005, 5)
						player:setStorageValue(12036, player:getStorageValue(12036) + 1) -- Questlog The Ice Islands Quest, Formorgar Mines 4: Retaliation
						toPosition:sendMagicEffect(CONST_ME_FIREWORK_BLUE)
						player:say("You mark an obelisk with the frost charm.", TALKTYPE_ORANGE_1)
					end
				elseif toPosition.x == obelisk3.x and toPosition.y == obelisk3.y and toPosition.z == obelisk3.z then
					if player:getStorageValue(12006) < 5 then
						player:setStorageValue(12006, 5)
						player:setStorageValue(12036, player:getStorageValue(12036) + 1) -- Questlog The Ice Islands Quest, Formorgar Mines 4: Retaliation
						toPosition:sendMagicEffect(CONST_ME_FIREWORK_BLUE)
						player:say("You mark an obelisk with the frost charm.", TALKTYPE_ORANGE_1)
					end
				elseif toPosition.x == obelisk4.x and toPosition.y == obelisk4.y and toPosition.z == obelisk4.z then
					if player:getStorageValue(12007) < 5 then
						player:setStorageValue(12007, 5)
						player:setStorageValue(12036, player:getStorageValue(12036) + 1) -- Questlog The Ice Islands Quest, Formorgar Mines 4: Retaliation
						toPosition:sendMagicEffect(CONST_ME_FIREWORK_BLUE)
						player:say("You mark an obelisk with the frost charm.", TALKTYPE_ORANGE_1)
					end
				end
			end
		end
	end
	return true
end