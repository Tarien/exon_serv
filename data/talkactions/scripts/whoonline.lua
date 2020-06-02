local maxPlayersPerMessage = 120

function onSay(player, words, param)
	
	if not player:getGroup():getAccess() then
        return false
    end
    local players = Game.getPlayers()
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, #players .. " players online.")
    for k, v in pairs(players) do
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, k .. ". " .. v:getName() .. " " .. v:getLevel() .. " " .. os.time() - v:getLastLoginSaved())
		-- print("!Online command:")
		print(k .. ". " .. v:getName() .. " " .. v:getLevel() .. " " .. os.time() - v:getLastLoginSaved())
    end
	
	
	
	
	
	
	
    -- local hasAccess = player:getGroup():getAccess()
    -- local players = Game.getPlayers()
    -- local onlineList = {}

    -- for _, targetPlayer in ipairs(players) do
        -- if hasAccess or not targetPlayer:isInGhostMode() then
            -- table.insert(onlineList, ("%s"):format(targetPlayer:getName()))
        -- end
    -- end

    -- local playersOnline = #onlineList
    -- player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, ("%d players online."):format(playersOnline))
 
    -- for i = 1, playersOnline, maxPlayersPerMessage do
		-- print("Step 2")
        -- local j = math.min(i + maxPlayersPerMessage - 1, playersOnline)
        -- local msg = table.concat(onlineList, ", ", i, j) .. "."
        -- player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
		
    -- end
	
	
	
	
	
    return false
end