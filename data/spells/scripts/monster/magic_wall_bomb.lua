local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1497)
local area = createCombatArea({

	{1, 1, 1, 1, 1},
	{1, 0, 0, 0, 1},
	{1, 0, 2, 0, 1},
	{1, 0, 0, 0, 1},
	{0, 0, 0, 0, 0}

})
setCombatArea(combat, area)
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end