local setting = {
	[60604] = Position(33211, 33128, 5),
	[60605] = Position(33158, 33121, 8)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local toPosition = setting[item.uid]
	if not toPosition then
		return true
	end

	player:teleportTo(toPosition)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end