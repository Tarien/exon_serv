local setting = {
	[60601] = {
		storage = Storage.Aurelius.AureliusCarpet,
		text = "You have gained access to Aurelius!",
		effect = CONST_ME_ENERGYAREA,
	
	}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local throne = setting[item.uid]
	if not throne then
		return true
	end

	if player:getStorageValue(Storage.Aurelius.AureliusCarpet) ~= 1 then
		player:setStorageValue(Storage.Aurelius.AureliusCarpet, 1)
		player:getPosition():sendMagicEffect(throne.effect)
		player:say(throne.text, TALKTYPE_MONSTER_SAY)
	-- else
		-- player:teleportTo(throne.toPosition)
		-- player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		-- player:say("Begone!", TALKTYPE_MONSTER_SAY)
	end
	return true
end
