-- Helper function to send notifications
function sendNotification(playerId, message)
    TriggerClientEvent("esx:showNotification", playerId, message)
end