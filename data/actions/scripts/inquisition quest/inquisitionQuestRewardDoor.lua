function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 9021) then
		local player = Player(cid)
		if(player:getStorageValue(200) == 23) then
			return (player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You forgot to ask henricus for outfit."))
		end
		if(player:getStorageValue(200) >= 24) then
			if(item.itemid == 5105) then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end