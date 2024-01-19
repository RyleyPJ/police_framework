-- server.lua

local onDuty = {}

RegisterCommand("toggleDuty", function(source)
    local playerId = source

    if onDuty[playerId] then
        onDuty[playerId] = false
        TriggerClientEvent("chatMessage", playerId, "SYSTEM", {255, 0, 0}, "You are now off duty.")
    else
        onDuty[playerId] = true
        TriggerClientEvent("chatMessage", playerId, "SYSTEM", {255, 0, 0}, "You are now on duty.")
    end
end, false)

RegisterCommand("giveLoadout", function(source)
    local playerId = source

    if onDuty[playerId] then
        -- Implement server-side logic to give a police loadout
        TriggerClientEvent("chatMessage", playerId, "SYSTEM", {255, 0, 0}, "Loadout given.")
    else
        TriggerClientEvent("chatMessage", playerId, "SYSTEM", {255, 0, 0}, "You must be on duty to receive a loadout.")
    end
end, false)

RegisterNetEvent("spawnPoliceVehicle")
AddEventHandler("spawnPoliceVehicle", function()
    local playerId = source

    if onDuty[playerId] then
        -- Implement server-side logic to spawn a police vehicle
        TriggerClientEvent("chatMessage", playerId, "SYSTEM", {255, 0, 0}, "Police vehicle spawned.")
    else
        TriggerClientEvent("chatMessage", playerId, "SYSTEM", {255, 0, 0}, "You must be on duty to spawn a vehicle.")
    end
end)
