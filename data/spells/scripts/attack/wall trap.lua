local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_MAGICWALL)
combat:setArea(createCombatArea(AREA_SQUARE3x3))

function onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end
