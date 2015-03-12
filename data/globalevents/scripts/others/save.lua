local function executeSave1(save1)
	saveServer()
end

function onThink(interval)
	addEvent(executeSave1, 30*1000, save1)
	return true
end




