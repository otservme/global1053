function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = Item(itemEx.uid)
	if(itemEx.uid == 3110 and item.itemid == 7140) then
		player:say("You fill your horn with ale.", TALKTYPE_ORANGE_1)
		Item(item.uid):transform(7141)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	elseif(item.itemid == 7141 and itemEx.itemid == 7174) then
			player:say("The bear is now unconcious.", TALKTYPE_ORANGE_1)
			Item(item.uid):transform(7140)
			Item(itemEx.uid):transform(7175)
			toPosition:sendMagicEffect(CONST_ME_STUN)
	elseif(item.itemid == 7175) then
		if(player:getStorageValue(120) == 4) then
			player:say("You hug the unconcious bear.", TALKTYPE_ORANGE_1)
			player:setStorageValue(120, 5)
			player:setStorageValue(12023, 2) -- Questlog Barbarian Test Quest Barbarian Test 2: The Bear Hugging
			player:addAchievement('Bearhugger')
			targetItem:transform(7174)
			targetItem:decay()
			toPosition:sendMagicEffect(CONST_ME_SLEEP)
		else
			player:say("You don't feel like hugging an unconcious bear.", TALKTYPE_ORANGE_1)
		end
	elseif(item.itemid == 7174) then
		player:say("Grr.", TALKTYPE_ORANGE_1)
		player:say("The bear is not amused by the disturbance.", TALKTYPE_ORANGE_1)
		doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, player:getPosition(), 0, -10, -30, CONST_ME_POFF)
	elseif(item.itemid == 7176) then
		if(player:getStorageValue(120) == 6) then
			if(player:getCondition(CONDITION_DRUNK)) then
				player:say("You hustle the mammoth. What a fun. *hicks*.", TALKTYPE_ORANGE_1)
				player:setStorageValue(120, 7)
				player:setStorageValue(12024, 2) -- Questlog Barbarian Test Quest Barbarian Test 3: The Mammoth Pushing
				targetItem:transform(7177)
				targetItem:decay()
				addEvent(function(toPosition) toPosition:sendMagicEffect(CONST_ME_SLEEP) end, 60 * 1000, toPosition)
				toPosition:sendMagicEffect(CONST_ME_SLEEP)
			else
				player:say("You are not drunk enought to hustle a mammoth.", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end