local config = {
	[7737] = {'orc warrior', 'pirate cutthroat', 'dworc voodoomaster', 'dwarf guard', 'minotaur mage'}, -- common
	[7739] = {'serpent spawn', 'demon', 'juggernaut', 'behemoth', 'ashmunrah'}, -- uncommon
	[9076] = {'quara hydromancer', 'diabolical imp', 'banshee', 'frost giant', 'lich'} -- deluxe
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local monsterNames = config[item.itemid]
	if not monsterNames then
		return true
	end

	doSetMonsterOutfit(cid, monsterNames[math.random(#monsterNames)], 5 * 60 * 60 * 1000)

	local player = Player(cid)
	local cStorage = player:getStorageValue(Storage.Achievements.Masquerader)
	if cStorage < 100 then
		player:setStorageValue(Storage.Achievements.Masquerader, math.max(1, cStorage) + 1)
	elseif cStorage == 100 then
		player:addAchievement('Doctor! Doctor!')
		player:setStorageValue(Storage.Achievements.Masquerader, 101)
	end

	local useItem = Item(item.uid)
	useItem:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	useItem:remove()
	return true
end