local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_WILDGROWTH)
combat:setArea(createCombatArea(AREA_MAZE6X6))

function onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end
