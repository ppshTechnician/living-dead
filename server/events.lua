-- Handle player drop event
AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("esx_zombiesystem:clear", source)
    TriggerClientEvent("esx_zombiesystem:playerupdate", -1, players)
end)