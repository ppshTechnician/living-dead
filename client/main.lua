require('client/events')
require('client/functions')

RegisterCommand('pickupItems', function()
    TriggerServerEvent('esx_zombiesystem:pickupDroppedItems')
end, false)

-- add a notification or a marker to guide players to their dropped items.