-- client.lua

local onDuty = false

-- Create the main menu
local mainMenu = NativeUI.CreateMenu("Police Menu", "Manage Police Actions")
local onDutyButton = NativeUI.CreateItem("Toggle Duty", "Go on/off duty")
local loadoutButton = NativeUI.CreateItem("Get Loadout", "Receive police loadout")

-- Add buttons to the menu
mainMenu:AddItem(onDutyButton)
mainMenu:AddItem(loadoutButton)

-- Event handler for button presses
mainMenu.OnItemSelect = function(menu, item, index)
    if item == onDutyButton then
        toggleDuty()
    elseif item == loadoutButton then
        giveLoadout()
    end
end

-- Function to toggle duty status (client-side logic)
function toggleDuty()
    onDuty = not onDuty

    if onDuty then
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "You are now on duty.")
    else
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "You are now off duty.")
    end
end

-- Function to give a loadout to the player (client-side logic)
function giveLoadout()
    TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Loadout given.")
    -- Add client-side logic for loadout if needed
end

-- Event handler for opening the menu with F1 key
RegisterKeyMapping("openPoliceMenu", "Open Police Menu", "keyboard", "F1")
RegisterCommand("openPoliceMenu", function()
    mainMenu:Visible(not mainMenu:Visible())
end, false)

-- Add the menu to the resource's Tick function
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        mainMenu:DrawInstructionalButton("~INPUT_CONTEXT~", "Open Police Menu")
        mainMenu:ProcessMenus()
    end
end)
