-- function onKill(player, target)
	-- Monster verify
	-- if not target:isMonster() or target:getMaster() then
		-- return true
	-- end
	-- local probability = math.random(0, 10000)
	-- if (probability > 99800) then
		-- player:sendTextMessage(MESSAGE_HEALED, "You found a surprise Jar!")
		-- target:say("Surprise Jar!", TALKTYPE_MONSTER_SAY)
		-- local item = corpse:addItem(32014)
	-- end
	-- return true
-- end


-- local probability = math.random(0, 10000)

-- function onKill(creature, player, target, corpse)
	-- Monster verify
	-- if not creature then
		-- return true
	-- end
	-- if not creature:getType():getLoot() then
		-- return true
	-- end
	-- target:say("Surprise Jar!", TALKTYPE_MONSTER_SAY)
	-- player:sendTextMessage(MESSAGE_HEALED, "You found a surprise Jar!")
	-- local probability = math.random(0, 10000)
	-- if not target:isMonster() or target:getMaster() then
		-- return true
	-- end
	-- if (probability > 5000) then
		-- target:registerEvent('onDeath')
		-- player:sendTextMessage(MESSAGE_HEALED, "You found a surprise Jar!")
		-- target:say("Surprise Jar!", TALKTYPE_MONSTER_SAY)
		-- addEvent(corpse:addItem(0, 32014, 1, CONST_ME_MAGIC_BLUE))
		
	-- end
	-- return true
-- end

-- function onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	-- if not creature then
		-- return true
	-- end
	-- if not creature:getType():getLoot() then
		-- return true
	-- end
	-- if (probability > 9500) then
		-- local item = corpse:addItem(32014)
	-- end
	-- return true
	
	-- return creature:conjureItem(0, 32014, 1, CONST_ME_MAGIC_BLUE)
-- end




-- function onKill(creature, target)
    -- if not target:isMonster() then
        -- return true
    -- end

    -- local monsters = {
        -- [1] = { name = "rat",      min_gold = 1, max_gold = 100 },
        -- [2] = { name = "cave rat", min_gold = 1, max_gold = 100 }
    -- }

    -- for i = 1, #monsters do
        -- if monsters[i].name == target:getName():lower() then
            -- local value = math.random(monsters[i].min_gold, monsters[i].max_gold)
            -- player:sendTextMessage(MESSAGE_HEALED, "You found a surprise Jar!")
            -- break
        -- end
    -- end

    -- return true
-- end


local mobs = {
	['rat'] = 200,
	['rabbit'] = 201,
	['deer'] = 202,
	['cat'] = 203,
	['dog'] = 203,
	['husky'] = 204,
	['slime'] = 205
}

function onKill(player, target, creature)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local targetName = targetMonster:getName():lower()
	local mobStorage = mobs[targetName]
	
	if mobStorage then
		return true
	end
	
	local probability = math.random(0, 10000)
	if probability > 9980 then
		player:say('You found a Surprise Jar!', TALKTYPE_MONSTER_SAY)
		return player:addItem(32014, 1)
	end
	return true
end



