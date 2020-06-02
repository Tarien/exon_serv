local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

local function activeBasin(position)
	local basinOne = Tile(Position(position.x - 1, position.y - 2, position.z)):getItemById(12450)
	local basinTwo = Tile(Position(position.x, position.y - 2, position.z)):getItemById(12451)
	local basinThree = Tile(Position(position.x - 1, position.y - 1, position.z)):getItemById(12452)
	local basinFour = Tile(Position(position.x, position.y - 1, position.z)):getItemById(12453)
	basinOne:transform(12458)
	basinTwo:transform(12459)
	basinThree:transform(12460)
	basinFour:transform(12461)
end

local function revertBasin(position)
	local basinOne = Tile(Position(position.x - 1, position.y - 2, position.z)):getItemById(12458)
	local basinTwo = Tile(Position(position.x, position.y - 2, position.z)):getItemById(12459)
	local basinThree = Tile(Position(position.x - 1, position.y - 1, position.z)):getItemById(12460)
	local basinFour = Tile(Position(position.x, position.y - 1, position.z)):getItemById(12461)
	basinOne:transform(12450)
	basinTwo:transform(12451)
	basinThree:transform(12452)
	basinFour:transform(12453)
end

function revertStorages()
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Four, 0)
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Done, 0)
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player or Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active) >= 1 then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	if item.itemid == 9562 then
		local leverFirst = Tile(Position(33651, 32661, 13)):getItemById(10029)
		or Tile(Position(33651, 32661, 13)):getItemById(10030) -- lever red
		local leverSecond = Tile(Position(33671, 32638, 13)):getItemById(10029)
		or Tile(Position(33671, 32638, 13)):getItemById(10030) -- lever blue
		local leverThird = Tile(Position(33613, 32691, 13)):getItemById(10029)
		or Tile(Position(33613, 32691, 13)):getItemById(10030) -- lever green
		local leverFour = Tile(Position(33671, 32688, 13)):getItemById(10029)
		or Tile(Position(33671, 32688, 13)):getItemById(10030) -- lever green
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First, 1) -- red
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second, 3) -- blue
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third, 2) -- green
		Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Four, 4) -- blood
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You hear a whisper: \z
		'You will not be guided but your path shines in the colours red, blue and green. Heed this hierarchy.'")
		leverFirst:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.First))
		leverSecond:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Second))
		leverThird:setActionId(53820 + Game.getStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Third))
		leverFour:setActionId(53824)
	end
	Game.setStorageValue(GlobalStorage.FerumbrasAscendantQuest.Elements.Active, 1)
	item:transform(9564)
	addEvent(activeBasin, 1 * 1000, position)
	addEvent(revertBasin, 60 * 60 * 1000, position)
	addEvent(revertStorages, 60 * 60 * 1000)
	addEvent(revertItem, 60 * 60 * 1000,  position, 9564, item.itemid)
	return true
end
