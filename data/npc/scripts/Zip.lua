local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = "I've got.. Bags an stuff!"} }
npcHandler:addModule(VoiceModule:new(voices))

-- Basic
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = "Bags, ropes, shovels.. What else could you need?"})


npcHandler:setMessage(MESSAGE_GREET, "Zippy convenience at your service!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Need a rope? Don't get stuck in a cave!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Byeeeeeeee.")

npcHandler:addModule(FocusModule:new())
