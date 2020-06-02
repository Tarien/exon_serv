local t = {
	Position(33248, 33189, 4), -- stone position
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local tile = t[1]:getTile()
		if tile then
			local stone = tile:getItemById(19376)
			if stone then
				stone:remove()
			end
		end

	elseif item.itemid == 1946 then
		-- local tile = t[2]:getTile()
		-- t[2]:sendMagicEffect(CONST_ME_POFF)
		Game.createItem(19376, 1, t[1])
	end
	return item:transform(item.itemid == 1945 and 1946 or 1945)
end
