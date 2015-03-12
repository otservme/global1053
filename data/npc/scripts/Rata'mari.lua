local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                            npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	
	
	-- GREET
	if(msg == "PIEDPIPER") and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart+2) == 1) then
			npcHandler:addFocus(cid)
			npcHandler:say("Meep? I mean - hello! Sorry, " .. getCreatureName(cid) .. "... Being a rat has kind of grown on me.", cid)
			npcHandler:addFocus(cid)
			npcHandler.topic[cid] = 1
		end
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if(msgcontains(msg, "spy report")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("You have come for the report? Great! I have been working hard on it during the last months. And nobody came to pick it up. I thought everybody had forgotten about me! ...", cid)
			selfSay("Do you have any idea how difficult it is to hold a pen when you have claws instead of hands? ...", cid)
			selfSay("But - you know - now I have worked so hard on this report I somehow don't want to part with it. Atleast not without some decent payment. ...", cid)
			selfSay("All right - listen - I know Fa'hradin would not approve of this, but I can't help it. I need some cheese! I need it now! ...", cid)
			npcHandler:say("And I will not give the report to you until you get me some! Meep!", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Ok, have you brought me the cheese, I've asked for?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 3) then
			if(doPlayerRemoveItem(cid, 2696, 1)) then
				npcHandler:say("Meep! Meep! Great! Here is the spyreport for you!","Meep!", cid)
				npcHandler.topic[cid] = 0
				setPlayerStorageValue(cid, BlueDjinn.MissionStart+2, 2)
				doPlayerAddItem(cid, 2345, 1)
			else
				npcHandler:say("Come back when you have brought the cheese.", cid)
				npcHandler.topic[cid] = 2
			end
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Meep!", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)