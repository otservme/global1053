-- Script feito por Yuri Lagrotta --
-- Não retire os creditos --

function onStartup(interval)
	if (math.random(1,6) == 1) then -- venore
		setGlobalStorageValue(9710, 1)
		doCreateItem(7853, {x = 32833, y = 32081, z = 7})
		doCreateItem(7851, {x = 32834, y = 32081, z = 7})
		doCreateItem(5066, {x = 32834, y = 32081, z = 7})
		doCreateItem(5066, {x = 32833, y = 32081, z = 7})
	    gate1 = doCreateItem(6116, {x = 32834, y = 32081, z = 7})
		doSetItemActionId(gate1, 9710)
		print('>> Fury Gate hoje esta em venore.')
	elseif (math.random(1,6) == 2) then -- ab'dendriel
		setGlobalStorageValue(9711, 1)
		doCreateItem(7853, {x = 32679, y = 31719, z = 7})
		doCreateItem(7851, {x = 32680, y = 31719, z = 7})
		doCreateItem(5066, {x = 32680, y = 31719, z = 7})
		doCreateItem(5066, {x = 32679, y = 31719, z = 7})
		gate2 = doCreateItem(6116, {x = 32680, y = 31719, z = 7})
		doSetItemActionId(gate2, 9711)
		print('>> Fury Gate hoje esta em ab dendriel.')
	elseif (math.random(1,6) == 3) then -- thais
		setGlobalStorageValue(9712, 1)
		doCreateItem(5064, {x = 32264, y = 32163, z = 7})
		doCreateItem(5064, {x = 32264, y = 32164, z = 7})
		doCreateItem(7852, {x = 32264, y = 32164, z = 7})
		doCreateItem(7853, {x = 32264, y = 32163, z = 7})
		doCreateItem(5064, {x = 32265, y = 32163, z = 7})
		doCreateItem(5064, {x = 32265, y = 32164, z = 7})
		gate3 = doCreateItem(6117, {x = 32264, y = 32164, z = 7})
		doSetItemActionId(gate3, 9712)
		print('>> Fury Gate hoje esta em thais.')
	elseif (math.random(1,6) == 4) then -- carlin
		setGlobalStorageValue(9713, 1)
		doCreateItem(5066, {x = 32262, y = 31848, z = 7})
		doCreateItem(5066, {x = 32263, y = 31848, z = 7})
		doCreateItem(7853, {x = 32262, y = 31848, z = 7})
		doCreateItem(7851, {x = 32263, y = 31848, z = 7})
		gate4 = doCreateItem(6116, {x = 32263, y = 31848, z = 7})
		doSetItemActionId(gate4, 9713)
		print('>> Fury Gate hoje esta em carlin.')
	elseif (math.random(1,6) == 5) then -- edron
		setGlobalStorageValue(9714, 1)
		doCreateItem(5066, {x = 33220, y = 31922, z = 7})
		doCreateItem(5066, {x = 33221, y = 31922, z = 7})
		doCreateItem(7853, {x = 33220, y = 31922, z = 7})
		doCreateItem(7851, {x = 33221, y = 31922, z = 7})
		doCreateItem(5066, {x = 33220, y = 31923, z = 7})
		doCreateItem(5066, {x = 33221, y = 31923, z = 7})
		gate5 = doCreateItem(6116, {x = 33221, y = 31922, z = 7})
		doSetItemActionId(gate5, 9714)
		print('>> Fury Gate hoje esta em edron.')
	elseif (math.random(1,6) == 6) then -- kazordoon
		setGlobalStorageValue(9716, 1)
		doCreateItem(5066, {x = 32573, y = 31982, z = 7})
		doCreateItem(5066, {x = 32574, y = 31982, z = 7})
		doCreateItem(7853, {x = 32573, y = 31982, z = 7})
		doCreateItem(7851, {x = 32574, y = 31982, z = 7})
		gate6 = doCreateItem(6116, {x = 32574, y = 31982, z = 7})
		doSetItemActionId(gate6, 9716)
		print('>> Fury Gate hoje esta em kazordoon.')
	end
end