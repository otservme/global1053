local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)          npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end

local lastSound = 0

function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say('Passages to Ab\'Dendriel, Carlin, Edron, Liberty Bay, Port Hope, Roshamuul, Oramond, Svargrond, Venore and Yalahar.', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end


local travelNode = keywordHandler:addKeyword({'carlin'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Carlin?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 32387, y = 31820, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'ab\'dendriel'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Ab\'Dendriel?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 32734, y = 31668, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'edron'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Edron?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 33175, y = 31764, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'venore'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Venore?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 32954, y = 32022, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'port hope'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Port Hope?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 32527, y = 32784, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'roshamuul'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Roshamuul?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 33494, y = 32567, z = 7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'svargrond'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Svargrond?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 32341, y = 31108, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'liberty bay'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Liberty Bay?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 32285, y = 32892, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'yalahar'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Yalahar?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 32816, y = 31272, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
	
local travelNode = keywordHandler:addKeyword({'oramond'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Oramond?', cost = 0, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, discount = TravelLib.postmanDiscount, destination = {x = 33481, y = 31986, z = 7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My name is Captain Bluebear from the Royal Tibia Line.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Royal Tibia Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We can transport everything you want.'})
keywordHandler:addKeyword({'passenger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We would like to welcome you on board.'})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Edron}, {Venore}, {Port Hope}, {Liberty Bay}, {Yalahar}, {Roshamuul} or {Svargrond}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Edron}, {Venore}, {Port Hope}, {Liberty Bay}, {Yalahar}, {Roshamuul} or {Svargrond}?'})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Edron}, {Venore}, {Port Hope}, {Liberty Bay}, {Yalahar}, {Roshamuul} or {Svargrond}?'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Edron}, {Venore}, {Port Hope}, {Liberty Bay}, {Yalahar}, {Roshamuul} or {Svargrond}?'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Edron}, {Venore}, {Port Hope}, {Liberty Bay}, {Yalahar}, {Roshamuul} or {Svargrond}?'})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Carlin}, {Ab\'Dendriel}, {Edron}, {Venore}, {Port Hope}, {Liberty Bay}, {Yalahar}, {Roshamuul} or {Svargrond}?'})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there.'})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there.'})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Many people who sailed to Darashia never returned because they were attacked by a ghostship! I\'ll never sail there!'})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'This is Thais. Where do you want to go?'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, |PLAYERNAME|. Where can I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')

npcHandler:addModule(FocusModule:new())
