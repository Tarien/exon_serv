local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Passages to Vanguard.'} }
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, cost, destination, action, condition)
	if condition then
		keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry but I don\'t sail there.'}, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination}, nil, action)
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
end

addTravelKeyword('vanguard', 120, Position(33371, 33002, 6))
addTravelKeyword('aurelius', 250, Position(33206, 33232, 6))

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(32320, 32219, 6), Position(32321, 32210, 6)}})

-- Basic
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'My name is Captain Cautious, I play it safe.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the captain of this sailing-ship.'})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, text = 'The East Vanguardian Trading Company connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, text = 'The East Vanguardian Trading Company connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, text = 'The East Vanguardian Trading Company connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = 'The East Vanguardian Trading Company Line connects all seaside towns of Tibia.'})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, text = 'We can transport everything you want.'})
keywordHandler:addKeyword({'passenger'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to welcome you on board.'})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to go to {Vanguard}?'})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to go to {Vanguard}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to go to {Vanguard}?'})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to go to {Vanguard}?'})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to go to {Vanguard}?'})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to go to {Vanguard} or {Aurelius}?'})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to go to {Vanguard}?'})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m sorry, but we don\'t serve the routes to the Ice Islands.'})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'roshamuul'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'liberty bay'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'oramond'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'krailos'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'Yeah, nah. I don\'t take no chances. To Vanguard and Aurelius is all I do. Safe as houses.'})
-- keywordHandler:addKeyword({'darashia', 'carlin', 'ab\'dendriel', 'edron', 'venore', 'port hope', 'roshamuul', 'svargrond', 'liberty bay', 'yalahar', 'oramond', 'krailos', 'thais'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. I don\'t take no chances. To Vanguard and back is all I do. Safe as houses.'})

keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m not sailing there. This route is afflicted by a ghostship! However I\'ve heard that Captain Fearless from Venore sails there.'})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, text = 'Many people who sailed to Darashia never returned because they were attacked by a ghostship! I\'ll never sail there!'})
keywordHandler:addKeyword({'haven'}, StdModule.say, {npcHandler = npcHandler, text = 'This is Haven. Where do you want to go?'})

npcHandler:setMessage(MESSAGE_GREET, 'Wha-? Oh, it\'s just you, |PLAYERNAME|. Where can I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Don\'t forget to give us 5 stars on Tripadvisor!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Watch out for sharks! And everything else!')

npcHandler:addModule(FocusModule:new())
