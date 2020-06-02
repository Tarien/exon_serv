local DamageTypes = {
    [1] = {DamageType = COMBAT_HOLYDAMAGE, DamageEffect = CONST_ANI_HOLY, DamageArea = CONST_ME_HOLYAREA},
    [2] = {DamageType = COMBAT_FIREDAMAGE, DamageEffect = CONST_ANI_FIRE, DamageArea = CONST_ME_FIREAREA},
    [3] = {DamageType = COMBAT_DEATHDAMAGE, DamageEffect = CONST_ANI_DEATH, DamageArea = CONST_ME_MORTAREA},
    [4] = {DamageType = COMBAT_POISONDAMAGE, DamageEffect = CONST_ANI_POISON, DamageArea = CONST_ME_SMALLPLANTS},
    [5] = {DamageType = COMBAT_ENERGYDAMAGE, DamageEffect = CONST_ANI_ENERGY, DamageArea = CONST_ME_ENERGYHIT},
    [6] = {DamageType = COMBAT_EARTHDAMAGE, DamageEffect = CONST_ANI_EARTH, DamageArea = CONST_ME_STONES},
    [7] = {DamageType = COMBAT_ICEDAMAGE, DamageEffect = CONST_ANI_ICE, DamageArea = CONST_ME_ICEAREA}
}


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

 

function onGetFormulaValues(player, level, maglevel)
	if DamageTypeWand.values == true then
		min = -(DamageTypeWand.wandMinDam)
		max = -(DamageTypeWand.wandMaxDam)
	else
		min = DamageTypeWand.formula.wandMinDam(level, maglevel)
		max = DamageTypeWand.formula.wandMaxDam(level, maglevel)
	end
    return min, max
end
 
local combat = {}
for k, dam_Table in pairs(DamageTypes) do
	combat[k] = Combat()
	combat[k]:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
	combat[k]:setParameter(COMBAT_PARAM_BLOCKSHIELD, 1)
	combat[k]:setParameter(COMBAT_PARAM_TYPE, dam_Table.DamageType)
	combat[k]:setParameter(COMBAT_PARAM_DISTANCEEFFECT, dam_Table.DamageEffect)	
	combat[k]:setParameter(COMBAT_PARAM_EFFECT, dam_Table.DamageArea)
	
	-- _G Is used to manually define 'onGetFormulaValues' in this loop in doesnt seem to be able to find the function. 
	_G['onGetFormulaValues' .. k] = onGetFormulaValues
	combat[k]:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues" .. k)
	combat[k]:setArea(area)
end

 
function onUseWeapon(player, var)
    local value = player:getStorageValue(10009)
    local combatUse = combat[value]
    if not combatUse then
        return true
    end
    return combatUse:execute(player, var)
end