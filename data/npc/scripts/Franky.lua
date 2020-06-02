local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = "This is fine."} }
npcHandler:addModule(VoiceModule:new(voices))

-- Basic
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = "Perhaps you'd like to take home some of my fine Art? It's all one of a kind!"})
keywordHandler:addKeyword({'need'}, StdModule.say, {npcHandler = npcHandler, text = "I'm $#@%in' NEED IT."})

-- local function creatureSayCallback(cid, type, msg)
	-- if not npcHandler:isFocused(cid) then
		-- return false
	-- end
	-- local player = Player(cid)
	-- if isInArray({"soft boots", "repair", "soft", "boots"}, msg) then
		-- npcHandler:say("Do you want to repair your worn soft boots for 100000 gold coins?", cid)
		-- npcHandler.topic[cid] = 1
	-- elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		-- npcHandler.topic[cid] = 0
		-- if player:getItemCount(10021) == 0 then
			-- npcHandler:say("Sorry, you don't have the item.", cid)
			-- return true
		-- end

		-- if not player:removeMoneyNpc(100000) then
			-- npcHandler:say("Sorry, you don't have enough gold.", cid)
			-- return true
		-- end

		-- player:removeItem(10021, 1)
		-- player:addItem(6132, 1)
		-- npcHandler:say("Here you are.", cid)
	-- elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		-- npcHandler.topic[cid] = 0
		-- npcHandler:say("Ok then.", cid)


	-- end

	-- return true
-- end


npcHandler:setMessage(MESSAGE_GREET, "Oh? How'd you get down here?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Uhh people don't really leave this place.. Best of luck..?")
npcHandler:setMessage(MESSAGE_WALKAWAY, "BYE! Watch out for Demons! AAHG DEMON!")

npcHandler:addModule(FocusModule:new())
