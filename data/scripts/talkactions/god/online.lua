local talk = TalkAction("/online")

function onSay(player, words, param)
	print("Step 1")
    if not player:getGroup():getAccess() then
        return false
    end
    local players = Game.getPlayers()
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, #players .. " players online.")
    for k, v in pairs(players) do
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, k .. ". " .. v:getName() .. " " .. v:getLevel() .. " " .. os.time() - v:getLastLoginSaved())
    end
    return false
end

talk:register()
