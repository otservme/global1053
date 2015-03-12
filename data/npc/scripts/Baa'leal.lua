local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	
	-- GREET
	if(msg == "DJANNI'HAH") and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, Factions) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, BlueDjinn.MissionStart) < 1 or not BlueOrGreen) then
				npcHandler:say("You know the code human! Very well then... What do you want, " .. getCreatureName(cid) .."?", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	-- Mission 1 - The Supply Thief 
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart) == 1 and getPlayerStorageValue(cid, GreenDjinn.MissionStart+1) < 1) then
			selfSay("Each mission and operation is a crucial step towards our victory! ...", cid)
			selfSay("Now that we speak of it ...", cid)
			npcHandler:say("Since you are no djinn, there is something you could help us with. Are you interested, human?", cid)
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, GreenDjinn.MissionStart+1) == 3) then
			npcHandler:say("Did you find the thief of our supplies?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "partos")) then
		if(npcHandler.topic[cid] == 3) then
			selfSay("You found the thief! Excellent work, soldier! You are doing well - for a human, that is. Here - take this as a reward. ...", cid) 
			selfSay("Since you have proven to be a capable soldier, we have another mission for you. ...", cid)
			npcHandler:say("If you are interested go to Alesar and ask him about it.", cid)
			npcHandler.topic[cid] = 4
		end
	elseif(msgcontains(msg, "hail malor")) then
		if(npcHandler.topic[cid] == 4) then
			npcHandler:say("Hail to our great leader!", cid)
			setPlayerStorageValue(cid, GreenDjinn.MissionStart+1, 4)
			npcHandler.topic[cid] = 0
		end
	-- Mission 1 - The Supply Thief 
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Well ... All right. You may only be a human, but you do seem to have the right spirit. ...", cid)
			selfSay("Listen! Since our base of operations is set in this isolated spot we depend on supplies from outside. These supplies are crucial for us to win the war. ...", cid)
			selfSay("Unfortunately, it has happened that some of our supplies have disappeared on their way to this fortress. At first we thought it was the Marid, but intelligence reports suggest a different explanation. ...", cid)
			selfSay("We now believe that a human was behind the theft! ...", "His identity is still unknown but we have been told that the thief fled to the human settlement called Carlin. I want you to find him and report back to me. Nobody messes with the Efreet and lives to tell the tale! ...", cid)
			npcHandler:say("Now go! Travel to the northern city Carlin! Keep your eyes open and look around for something that might give you a clue!", cid)
			npcHandler.topic[cid] = 0
			setPlayerStorageValue(cid, GreenDjinn.MissionStart+1, 1)
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Finally! What is his name then?", cid)
			npcHandler.topic[cid] = 3
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Stand down, soldier!", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)