function onStepIn(cid, item, position, lastPosition)
	local p = Player(cid)
	if not p then
		return true
	end

	if(item.actionid == 8816) then
		if(p:getStorageValue(8816) ~= 1) then
			p:setStorageValue(8816, 1)
			p:setStorageValue(39822, 2) -- quest log
			p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You discovered a shortcut to the pits of inferno.")
		end
	elseif(item.actionid == 8817) then
		if(p:getStorageValue(8817) ~= 1) then
			p:setStorageValue(8817, 1)
			p:setStorageValue(39822, 1) -- quest log
			p:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You discovered a shortcut to the pits of inferno.")
		end
	end
return true
end