local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Whoah. That was a large shadow passing by.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local travelNode = keywordHandler:addKeyword({'calassa'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'That is quite a long unprofitable travel. I\'ll bring you to Calassa though. Do you want me to do it?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 200, destination = {x=31911, y=32710, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe another time, then.'})

local travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'That is quite a long unprofitable travel. I\'ll bring you to Yalahar. Is that ok with you?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 400, destination = {x=32816, y=31272, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Welcome on board, noble |PLAYERNAME|. I can bring you to {Calassa} or {Yalahar}, but only if you have the according mission from {Berenice} or {Wyrdin}.'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Welcome on board, noble |PLAYERNAME|. I can bring you to {Calassa} or {Yalahar}, but only if you have the according mission from {Berenice} or {Wyrdin}.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})

npcHandler:setMessage(MESSAGE_GREET, "Ahoy, |PLAYERNAME|. On a mission for the explorer society, eh?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:addModule(FocusModule:new())
