local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = "I LOVE GOOOOLD!"} }
npcHandler:addModule(VoiceModule:new(voices))

-- Basic
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = "I'll take it all! I NEED MORE!"})


npcHandler:setMessage(MESSAGE_GREET, "Ugh what? Got any gold? Shinies? I'll take em.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yes. Go. Collect more, bring me MORE! MOOOOAARRRR!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Don't touch my gold.")

npcHandler:addModule(FocusModule:new())
