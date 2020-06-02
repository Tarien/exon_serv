function onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    if player:getStorageValue(60500) >= os.time() then
        player:say('You already have boosted experience!', TALKTYPE_MONSTER_SAY)
        return true
    end

    player:setStorageValue(60500, os.time() + 1800)
    Item(item.uid):remove(1)
    player:say('Your 30 minutes of boosted experience has started!', TALKTYPE_MONSTER_SAY)
    return true
end