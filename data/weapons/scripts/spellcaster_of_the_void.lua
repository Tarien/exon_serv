local area = createCombatArea({
 	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
 })

 local combat = Combat()
 combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
 combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
 combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
 combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
 combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 0, 1)
 combat:setArea(area)

-- function onGetFormulaValues(player, level, maglevel)
	-- local min = (level / 5) + (maglevel * 1.3) + 32
	-- local max = (level / 5) + (maglevel * 2.4) + 48
	-- return -min, -max
-- end

 function onUseWeapon(player, variant)
 	return combat:execute(player, variant)
 end
