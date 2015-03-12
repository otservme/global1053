local config = {
level1 = 8,     
msg1 = "Congratulations! You are ready to leave this island and choose a vocation now. Go see the Oracle over the academy in Rookgaard before you advance to level 10!", 
msgtype = MESSAGE_EVENT_ADVANCE,
}
 
function onAdvance(cid, oldLevel, newLevel)
	if getPlayerLevel(cid) >= config.level1 and getPlayerStorageValue(cid,655) ~= 1 then
		setPlayerStorageValue(cid,655,1)
		doPlayerSendTextMessage(cid, config.msgtype, config.msg1)
	end
return TRUE
end