-- Config
local tplist = {

	-- Top Floor
    [40000] = {name = "Tombs", positions = {{x = 33025, y = 32869, z = 8}, {x = 33231, y = 32702, z = 8}, {x = 33280, y = 32741, z = 10}, {x = 33250, y = 32833, z = 8}, {x = 33206, y = 32578, z = 8}, {x = 33131, y = 32567, z = 8}, {x = 33132, y = 32642, z = 8}, {x = 33142, y = 32837, z = 7}, {x = 33038, y = 32707, z = 6}}, subareas = {'Peninsula Tomb', 'Tarpit Tomb', 'Stone Tomb', 'Shadow Tomb', 'Ruins Tomb', 'Mountain Tomb', 'Oasis Tomb', 'Library Tomb', 'Horestis Tomb'}},
    [40001] = {name = "Gnomebase", positions = {{x = 32797, y = 31774, z = 10}, {x = 33749, y = 32183, z = 14}}, subareas = {'Gnomebase Alpha', 'Gnome Deep Hub'}},
	[40002] = {name = "Northern Darashia", positions = {{x = 33324, y = 32282, z = 7}, {x = 33031, y = 32436, z = 7}}, subareas = {'Minotaur Piramid', 'Drefia'}},
	[40003] = {name = "Tiquanda", positions = {{x = 32823, y = 32532, z = 6}, {x = 32847, y = 32867, z = 7}, {x = 32984, y = 32679, z = 7}}, subareas = {'Banuta', 'Giant Spiders', 'Hydras'}},
	[40004] = {name = "Orc Fortress", positions = {{x = 32891, y = 31767, z = 5}}, subareas = {}},
	[40005] = {name = "Nargor Pirates", positions = {{x = 31993, y = 32827, z = 6}}, subareas = {}},
	[40006] = {name = "Sea Serpents", positions = {{x = 33406, y = 31863, z = 14}}, subareas = {}},
	[40007] = {name = "Cyclopolis", positions = {{x = 33298, y = 31689, z = 13}}, subareas = {}},
	[40008] = {name = "Muggy Plains", positions = {{x = 33189, y = 31348, z = 7}}, subareas = {}},
	[40009] = {name = "Fenrock", positions = {{x = 32605, y = 31406, z = 13}}, subareas = {}},
	[40010] = {name = "Level Rewards", positions = {{x = 33295, y = 32982, z = 7}}, subareas = {}},
	[40011] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	
	-- Second Floor
	[40013] = {name = "Edron Areas", positions = {{x = 33166, y = 31649, z = 13}, {x = 33219, y = 31648, z = 6}}, subareas = {'Demon Hell', 'Old Fortress'}},
	[40014] = {name = "Razachai", positions = {{x = 33011, y = 31172, z = 5}}, subareas = {}},
	[40015] = {name = "Placeholder", positions = {{x = 31172, y = 32436, z = 7}}, subareas = {}},
	[40016] = {name = "Goroma", positions = {{x = 32099, y = 32565, z = 12}}, subareas = {}},	
	[40017] = {name = "The Spike", positions = {{x = 32243, y = 32607, z = 8}}, subareas = {}},
	[40018] = {name = "Deeplings", positions = {{x = 33509, y = 31326, z = 8}}, subareas = {}},
	[40019] = {name = "Under Construction", positions = {{x = 33583, y = 32906, z = 6}}, subareas = {}},
	[40020] = {name = "Thais Minotaur Cultists", positions = {{x = 31935, y = 32500, z = 8}}, subareas = {}},
	[40021] = {name = "Ab'Dendriel Devotees", positions = {{x = 32722, y = 31531, z = 9}}, subareas = {}},
	[40022] = {name = "Formorgar Mines", positions = {{x = 32142, y = 31127, z = 9}}, subareas = {}},
	[40023] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40024] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	
	-- Third Floor
	[40025] = {name = "Hell Hub", positions = {{x = 33327, y = 32317, z = 13}}, subareas = {}},
	[40026] = {name = "Rathleton Catacombs", positions = {{x = 33459, y = 31715, z = 9}}, subareas = {}},
	[40027] = {name = "Pits of Inferno", positions = {{x = 32833, y = 32275, z = 9}}, subareas = {}},
	[40028] = {name = "Dark Torturers etc", positions = {{x = 33357, y = 33151, z = 7}}, subareas = {}},
	[40029] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40030] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40031] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40032] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40033] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40034] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40035] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}},
	[40036] = {name = "Placeholder", positions = {{x = 31715, y = 33151, z = 7}}, subareas = {}}
	
}
local firstid = 40000 -- Put your first action id used here
local lastid = 40036 -- Put your last action id used here

-- Config End
local teleports = MoveEvent()
function teleports.onStepIn(player, item, position, fromPosition)
    if not player:isPlayer() then
        return false
    end
  
    local tp = tplist[item.actionid]
    local quantity = #tp.positions
  
    player:registerEvent("Teleport_Modal_Window")
  
    local title = "Teleport"
    local message = "List of ".. tp.name .." Spawns"
      
    local window = ModalWindow(item.actionid, title, message)
    window:addButton(100, "Go")
    window:addButton(101, "Cancel")
      
    for i = 1, quantity do
        if tp.subareas[i] == nil then
            window:addChoice(i,"".. tp.name .." ".. i .."")
        else
            window:addChoice(i,"".. tp.subareas[i] .."")
        end
    end
  
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(101)
  
    if tp and quantity < 2 then
        player:unregisterEvent("Teleport_Modal_Window")
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tp.name ..'.')
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        player:teleportTo(tp.positions[1])
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        window:sendToPlayer(player)
    end
    return true
end

for j = firstid, lastid do
    teleports:aid(j)
end

teleports:type("stepin")
teleports:register()

local modalTp = CreatureEvent("Teleport_Modal_Window")
modalTp:type("modalwindow")

function modalTp.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("Teleport_Modal_Window")
    if modalWindowId >= firstid and modalWindowId <= lastid then
        if buttonId == 100 then
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            player:teleportTo(tplist[modalWindowId].positions[choiceId])
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            if tplist[modalWindowId].subareas[choiceId] == nil then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tplist[modalWindowId].name ..' '.. choiceId ..'.')
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Teleported to '.. tplist[modalWindowId].subareas[choiceId] ..'.')
            end
        end
    end
    return true
end

modalTp:register()