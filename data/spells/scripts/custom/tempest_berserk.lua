local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

	arr = {
		{1, 1, 1},
		{1, 3, 1},
		{1, 1, 1}
	}

local area = createCombatArea(arr)
combat:setArea(area)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end