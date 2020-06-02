local blessings = {1, 2, 3, 4, 5, 6, 7, 8}
function getCost(level)
    if level <= 30 then
        return 2000 * 5
    elseif level >= 120 then
        return 10000 * 10
    else
        return ((level - 20) * 200 * 5)
    end
end
function onSay(player, words, param)
    if player:isPzLocked() then
        player:sendCancelMessage("You can't buy bless, when you are in a battle.")
        return false
    end
   if player:hasBlessing(#blessings) then
       player:sendCancelMessage("You have already been blessed by the gods.")
       return false
   end
   
    local cost = getCost(player:getLevel())
    if player:removeMoney(cost) then
        for b = 1, 8 do
            player:addBlessing(b, 1)
        end
        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been blessed by the Gods! Let's be careful this time.")
    else
        player:sendCancelMessage("You need "..cost.." gold coins to buy all blessings.")
    end
    return false
end