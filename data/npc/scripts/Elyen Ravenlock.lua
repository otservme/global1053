local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local voices = {
	'<hums a dark tune>',
	'<chants> Re Ha, Omrah, Tan Ra...',
	'The rats... the rats in the walls...'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,9936) == 1 and getPlayerStorageValue(cid,9937) < 1 then
		npcHandler:say("Hello, brother. You come with a question to me, I believe?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 and getPlayerStorageValue(cid,9936) == 1 then
		npcHandler:say("And what is it you want? Do you bring news from the undead, or do you seek a dark {artefact}?", cid)
		player:setStorageValue(9921, 1)
		npcHandler.topic[cid] = 2
	elseif(msgcontains(msg, 'artefact') or msgcontains(msg, 'yes')) and npcHandler.topic[cid] == 2 and getPlayerStorageValue(cid,9936) == 1 and getPlayerStorageValue(cid,9937) < 1 then
		selfSay("The scroll piece there? The symbols look promising, but it is incomplete. ...", cid)
		selfSay("It is of little use to us. But it seems to be of interest to you ...", cid)
		npcHandler:say("In exchange for the scroll piece, you must assist me with something. {Agreed}?", cid)
		npcHandler.topic[cid] = 3
	elseif(msgcontains(msg, 'agreed') or msgcontains(msg, 'yes')) and npcHandler.topic[cid] == 3 and getPlayerStorageValue(cid,9936) == 1 and getPlayerStorageValue(cid,9937) < 1 then
		selfSay("I would have to sing to the Dark Shrines, but I cannot. ...", cid)
		selfSay("I... cannot bear Urgith's breed. Everywhere, I hear them - scrabbling, squeaking ...", cid)
		selfSay("Take this bone flute and play it in front of the five Dark Shrines so that they answer with song in return. You will find them in the Gardens of Night. ...", cid)
		npcHandler:say("If you have done that, you may have the scroll piece. Now go.", cid)
		player:setStorageValue(9937, 1)
		player:addItem(21249, 1)
		npcHandler.topic[cid] = 0
		
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'yes')) and getPlayerStorageValue(cid,9943) == 1 then
		npcHandler:say("Hello, brother. You have finished the dance?", cid)
		npcHandler.topic[cid] = 4
	elseif(msgcontains(msg, 'yes')) and npcHandler.topic[cid] == 4 and getPlayerStorageValue(cid,9943) == 1 then
		selfSay("You have indeed. The shrines have sung back to you. Well done, brother. Not many men take such an interest in our art. ...", cid)
		npcHandler:say("I will take the flute back. Our bargain stands. You may take the scroll.", cid)
		player:removeItem(21249, 1)
		player:setStorageValue(9944, 1)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "A shadow preceded you. You wish a {scroll} or a {mission}?")
npcHandler:addModule(FocusModule:new())