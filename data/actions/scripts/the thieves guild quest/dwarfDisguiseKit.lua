local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(5 * 60 * 1000) -- should be 5 minutes
condition:addOutfit({lookType = 66}) -- dwarf geomancer looktype

function onUse(cid, item, fromPosition, itemEx, toPosition)

	Player(cid):addCondition(condition)

	return true
end
