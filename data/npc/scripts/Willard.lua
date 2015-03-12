local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	

	if(msgcontains(msg, "package for rashid")) then
		if(getPlayerStorageValue(cid, 85) == 3) then
			selfSay("Oooh, damn, I completely forgot about that. I was supposed to pick it up from the Outlaw Camp. ...", cid)
			selfSay("I can't leave my shop here right now, please go and talk to Snake Eye about that package... I promise he won't make any trouble. ...", cid)
			npcHandler:say("Don't tell Rashid! I really don't want him to know that I forgot his order. Okay?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Thank you, I appreciate it. Don't forget to mention the package to Snake.", cid)
			setPlayerStorageValue(cid, 85, 4)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())