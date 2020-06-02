local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = "I'm better than the fresh food people."} }
npcHandler:addModule(VoiceModule:new(voices))

-- Basic
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = "Need some apples?"})


npcHandler:setMessage(MESSAGE_GREET, "Hello, welcome to Cole's.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a nice day, mate.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "That's WAY too much toilet paper.")

npcHandler:addModule(FocusModule:new())
