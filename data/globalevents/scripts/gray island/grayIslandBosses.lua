local config = {
	teleportId = 1387,
	days = {
		["Monday"] = { {x = 33649, y = 31261, z = 11}, {x = 33641, y = 31233, z = 11}, "tanjis", {x=33647, y=31242, z=11} },
		["Tuesday"] = { {x = 33649, y = 31261, z = 11}, {x = 33641, y = 31233, z = 11}, "tanjis", {x=33647, y=31242, z=11} }, 
		["Wednesday"] = { {x = 33649, y = 31261, z = 11}, {x = 33641, y = 31233, z = 11}, "tanjis", {x=33647, y=31242, z=11} }, 
		["Thursday"] = { {x = 33558, y = 31282, z = 11},{x = 33545, y = 31263, z = 11}, "jaul", {x=33541, y=31266, z=11} },
		["Friday"] = { {x = 33558, y = 31282, z = 11}, {x = 33545, y = 31263, z = 11}, "jaul", {x=33541, y=31266, z=11} },
		["Saturday"] = { {x=33438, y=31248, z=11}, {x=33419, y=31255, z=11}, "obujos", {x=33434, y=31262, z=11} }, 
		["Sunday"] = { {x=33438, y=31248, z=11}, {x=33419, y=31255, z=11} , "obujos", {x=33434, y=31262, z=11} } 
	}
}

function onStartup(interval)
	local i = config.days[os.date("%A")]
	doCreateTeleport(config.teleportId, i[2], i[1])		
end
