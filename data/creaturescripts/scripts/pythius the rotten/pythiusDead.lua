function onKill(cid, target, damage, flags)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "pythius the rotten") then
			doTeleportThing(cid, {x=32577, y=31403, z=15})
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doCreatureSay(target, "NICE FIGHTING LITTLE WORM, YOUR VICTORY SHALL BE REWARDED!", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 14201, 2)
		end
	end
	return true
end