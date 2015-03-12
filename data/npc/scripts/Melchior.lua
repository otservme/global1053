local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
 
	-- WORD OF GREET
	if(msgcontains(msg, "word of greeting")) then
		if(getPlayerStorageValue(cid, Factions) < 1) then
			npcHandler.topic[cid] = 0
			selfSay("The djinns have an ancient code of honour. This code includes a special concept of hospitality. Anybody who utters the word of greeting must not be attacked even if he is an enemy. Well, at least that is what the code says. ...", cid)
			selfSay("I have found out, though, that this does not work at all times. There is no point to say the word of greeting to an enraged djinn. ...", cid)
			selfSay("I can tell you the word of greeting if you're interested. It is {DJANNI'HAH}. Remember this word well, stranger. It might save your life one day. ...", cid)
			npcHandler:say("And keep in mind that you must choose sides in this conflict. You can only follow the Efreet or the Marid - once you have made your choice there is no way back. I know from experience that djinn do not tolerate double-crossing.", cid)
			setPlayerStorageValue(cid, Factions, 2)
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())