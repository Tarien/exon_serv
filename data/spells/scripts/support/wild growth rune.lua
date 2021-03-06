local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)

function onCreateMagicWall(creature, tile)
	local item = Game.createItem(ITEM_WILDGROWTH, 1, tile)
	item:setAttribute(ITEM_ATTRIBUTE_DURATION, math.random(38000, 45000))
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onCreateMagicWall")

function onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

-- spell:name("Wild Growth Rune")
-- spell:group("attack")
-- spell:id(94)
-- spell:cooldown(2 * 1000)
-- spell:groupCooldown(2 * 1000)
-- spell:level(27)
-- spell:magicLevel(8)
-- spell:runeId(2269)
-- spell:charges(2)
-- spell:isBlocking(true, true)
-- spell:allowFarUse(true)
-- spell:vocation("druid", "elder druid")
-- spell:register()