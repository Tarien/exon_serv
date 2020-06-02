local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = "I've got the best wares in the land, come see!"} }
npcHandler:addModule(VoiceModule:new(voices))

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if isInArray({"enchanted chicken wing", "boots of haste"}, msg) then
		npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wing?', cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"warrior sweat", "warrior helmet"}, msg) then
		npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', cid)
		npcHandler.topic[cid] = 2
	elseif isInArray({"fighting spirit", "royal helmet"}, msg) then
		npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', cid)
		npcHandler.topic[cid] = 3
	elseif isInArray({"magic sulphur", "fire sword"}, msg) then
		npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', cid)
		npcHandler.topic[cid] = 4
	elseif isInArray({"job", "items"}, msg) then
		npcHandler:say('I trade Enchanted Chicken Wing for Boots of Haste, Warrior Sweat for 4 Warrior Helmets, Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg,'yes') and npcHandler.topic[cid] <= 4 and npcHandler.topic[cid] >= 1 then
		local trade = {
				{ NeedItem = 2195, Ncount = 1, GiveItem = 5891, Gcount = 1}, -- Enchanted Chicken Wing
				{ NeedItem = 2475, Ncount = 4, GiveItem = 5885, Gcount = 1}, -- Flask of Warrior's Sweat
				{ NeedItem = 2498, Ncount = 2, GiveItem = 5884, Gcount = 1}, -- Spirit Container
				{ NeedItem = 2392, Ncount = 3, GiveItem = 5904, Gcount = 1}  -- Magic Sulphur
		}
		if player:getItemCount(trade[npcHandler.topic[cid]].NeedItem) >= trade[npcHandler.topic[cid]].Ncount then
			player:removeItem(trade[npcHandler.topic[cid]].NeedItem, trade[npcHandler.topic[cid]].Ncount)
			player:addItem(trade[npcHandler.topic[cid]].GiveItem, trade[npcHandler.topic[cid]].Gcount)
			return npcHandler:say('Here you are.', cid)
		else
			npcHandler:say('Sorry but you don\'t have the item.', cid)
		end
	elseif msgcontains(msg,'no') and (npcHandler.topic[cid] >= 1 and npcHandler.topic[cid] <= 5) then
		npcHandler:say('Ok then.', cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end


-- Basic
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = "Did you want one of these? Or these? Or THIS!?"})


npcHandler:setMessage(MESSAGE_GREET, "Welcome to financial freedom.")
npcHandler:setMessage(MESSAGE_FAREWELL, "You don't need that shiny armor, give us a look.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Yeah, fine. Bye. See ya.")

npcHandler:addModule(FocusModule:new())
