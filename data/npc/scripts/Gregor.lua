local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	

	local player = Player(cid)
	if msgcontains(msg, "addon") or msgcontains(msg, "outfit") then
		if player:getStorageValue(12060) < 1 then
			npcHandler:say("Only the bravest warriors may wear adorned helmets. They are traditionally awarded after having completed a difficult {task} for our guild.", player)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "task") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("You mean, you would like to prove that you deserve to wear such a helmet?", player)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "fang") or msgcontains(msg, "behemoth") then
		if player:getStorageValue(12060) == 1 then
			npcHandler:say("Have you really managed to fulfil the task and brought me 100 perfect behemoth fangs?", player)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "helmet") then
		if player:getStorageValue(12060) == 2 then
			npcHandler:say("Did you recover the helmet of Ramsay the Reckless?", player)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "sweat")  or msgcontains(msg, "flask") then
		if player:getStorageValue(12060) == 3 then
			npcHandler:say("Were you able to get hold of a flask with pure warrior's sweat?", player)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "steel") then
		if player:getStorageValue(12060) == 4 then
			npcHandler:say("Ah, have you brought the royal steel?", player)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then	
			selfSay("Well then, listen closely. First, you will have to prove that you are a fierce and restless warrior by bringing me 100 perfect behemoth fangs. ...", cid)
			selfSay("Secondly, please retrieve a helmet for us which has been lost a long time ago. The famous Ramsay the Reckless wore it when exploring an ape settlement. ...", cid)
			selfSay("Third, we need a new flask of warrior's sweat. We've run out of it recently, but we need a small amount for the show battles in our arena. ...", cid)
			selfSay("Lastly, I will have our smith refine your helmet if you bring me royal steel, an especially noble metal. ...", cid)
			npcHandler:say("Did you understand everything I told you and are willing to handle this task?", cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then	
			npcHandler:say("Alright then. Come back to me once you have collected 100 perfect behemoth fangs.", player)
			player:setStorageValue(12060, 1)
			player:setStorageValue(12010, 1) --this for default start of Outfit and Addon Quests
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if player:getItemCount(5893) >= 100 then
				npcHandler:say("I'm deeply impressed, (brave Knight) " .. player:getName() .. ". (Even if you are not a knight, you certainly possess knight qualities.) Now, please retrieve Ramsay's helmet.", player)
				player:removeItem(5893, 100)
				player:setStorageValue(12060, 2)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:getItemCount(5924) >= 1 then
				npcHandler:say("Good work, (brave Knight) " .. player:getName() .. "! Even though it is damaged, it has a lot of sentimental value. Now, please bring me warrior's sweat.", player)
				player:removeItem(5924, 1)
				player:setStorageValue(12060, 3)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:getItemCount(5885) >= 1 then
				npcHandler:say("Now that is a pleasant surprise, (brave Knight) " .. player:getName() .. "! There is only one task left now: Obtain royal steel to have your helmet refined.", player)
				player:removeItem(5885, 1)
				player:setStorageValue(12060, 4)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 7 then
			if player:getItemCount(5887) >= 1 then
				npcHandler:say("You truly deserve to wear an adorned helmet, (brave Knight) " .. player:getName() .. ". Please talk to Sam and tell him I sent you. I'm sure he will be glad to refine your helmet.", player)
				player:removeItem(5887, 1)
				player:setStorageValue(12060, 5)
				npcHandler.topic[cid] = 0	
			end
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
