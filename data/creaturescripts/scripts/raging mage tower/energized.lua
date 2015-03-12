function onKill(cid, target, damage, flags)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "energized raging mage" and getGlobalStorageValue(673003) > 1999) then
			 doSummonCreature("Raging Mage", getThingPos(cid))
			 doCreatureSayWithRadius(cid, "GNAAAAAHRRRG!! WHAT? WHAT DID YOU DO TO ME!! I... I feel the energies crawling away... from me... DIE!!!", TALKTYPE_ORANGE_1, 33143, 31527, {x =  33143, y = 31527, z = 2})
			 setGlobalStorageValue(673003, 0)
		end
	end
	return true
end
