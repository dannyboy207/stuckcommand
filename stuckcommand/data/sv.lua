-- server script --
RegisterNetEvent('chatmessage:chat', function(playerId)
    TriggerClientEvent('chat:addMessage', -1, {
        color = { 255, 0, 0},
        args = {Config.commandName, "^3Player ID ^3[^1" ..playerId .. "^3] used /stuck"}
    })
end)