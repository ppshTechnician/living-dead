Config = {}
require('config')

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

require('server/events')
require('server/functions')

local players = {}
local entities = {}

-- Register a new player
RegisterServerEvent("esx_zombiesystem:newplayer")
AddEventHandler("esx_zombiesystem:newplayer", function(id)
    players[source] = id
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

-- Handle player drop event
AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("esx_zombiesystem:clear", source)
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)

-- Clear data on resource stop
AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        TriggerClientEvent("esx_zombiesystem:clear", -1)
    end
end)

-- Helper function to send notifications
local function sendNotification(playerId, message)
    TriggerClientEvent("esx:showNotification", playerId, message)
end

-- Handle money loot event
RegisterServerEvent('esx_zombiesystem:moneyloot')
AddEventHandler('esx_zombiesystem:moneyloot', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomAmount = math.random(1, 20)
    xPlayer.addMoney(randomAmount)
    sendNotification(xPlayer.source, 'You found ~g~$' .. randomAmount .. ' dollars')
end)

-- Handle item loot event
RegisterServerEvent('esx_zombiesystem:itemloot')
AddEventHandler('esx_zombiesystem:itemloot', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomAmount = math.random(1, 3)
    if xPlayer.canCarryItem(item, randomAmount) then
        xPlayer.addInventoryItem(item, randomAmount)
        sendNotification(xPlayer.source, 'You found ~y~' .. randomAmount .. 'x ~b~' .. item)
    else
        sendNotification(xPlayer.source, 'You cannot pick up that because your inventory is full!')
    end
end)

-- Register a new zombie entity
RegisterServerEvent("RegisterNewZombie")
AddEventHandler("RegisterNewZombie", function(entity)
    TriggerClientEvent("ZombieSync", -1, entity)
    table.insert(entities, entity)
end)

-- Clean up entities on resource stop
local function cleanUpEntities()
    for _, entity in pairs(entities) do
        if DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
    end
    entities = {}
end

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        cleanUpEntities()
    end
end)

-- Handle player death and drop items
AddEventHandler('esx:onPlayerDeath', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerItems = xPlayer.getInventory()

    for _, item in pairs(playerItems) do
        if item.count > 0 then
            table.insert(droppedItems, {
                playerId = source,
                item = item.name,
                count = item.count,
                dropTime = os.time()
            })
            xPlayer.removeInventoryItem(item.name, item.count)
        end
    end

    sendNotification(source, 'You have dropped your items. You have 20 minutes to retrieve them.')
end)

-- Allow player to pick up dropped items
RegisterServerEvent('esx_zombiesystem:pickupDroppedItems')
AddEventHandler('esx_zombiesystem:pickupDroppedItems', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local currentTime = os.time()
    local playerItemsToRemove = {}

    for index, drop in pairs(droppedItems) do
        if drop.playerId == source and (currentTime - drop.dropTime) <= 1200 then -- = 20 minutes
            if xPlayer.canCarryItem(drop.item, drop.count) then
                xPlayer.addInventoryItem(drop.item, drop.count)
                sendNotification(source, 'You have retrieved ' .. drop.count .. 'x ' .. drop.item)
                table.insert(playerItemsToRemove, index)
            else
                sendNotification(source, 'You cannot pick up ' .. drop.count .. 'x ' .. drop.item .. ' because your inventory is full!')
            end
        end
    end

    for _, index in pairs(playerItemsToRemove) do
        table.remove(droppedItems, index)
    end
end)