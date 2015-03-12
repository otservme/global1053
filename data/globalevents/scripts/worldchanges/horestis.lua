-- Script feito por Yuri Lagrotta --
-- Não retire os creditos --

jar1 = {x = 32991, y = 32721, z = 8, stackpos=1} 
jar2 = {x = 32940, y = 32778, z = 9, stackpos=1} 
jar3 = {x = 32985, y = 32772, z = 10, stackpos=1} 
jar4 = {x = 32936, y = 32752, z = 11, stackpos=1} 
jar5 = {x = 32979, y = 32737, z = 12, stackpos=1} 

function onTime(interval)
	jar1 = doCreateItem(13736, 1, jar1)
	doSetItemActionId(jar1, 56530)
	jar2 = doCreateItem(13500, 1, jar2)
	doSetItemActionId(jar2, 56531)
	jar3 = doCreateItem(13500, 1, jar3)
	doSetItemActionId(jar3, 56532)
	jar4 = doCreateItem(13500, 1, jar4)
	doSetItemActionId(jar4, 56533)
	jar5 = doCreateItem(13736, 1, jar5)
	doSetItemActionId(jar5, 56534)
end
