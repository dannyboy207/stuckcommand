-- client script --
CreateThread(function()
    while true do 
        TriggerEvent('chat:addSuggestion', '/stuck', 'Use this if you are stuck, It will send out a serverwide message stating that you used it', {
            { name="position", help="Positions: random, sandy, ls or paleto" },
        })
        Citizen.Wait(1000000)
    end
end)


RegisterCommand("stuck", function(source, args, raw)
	local coords = GetEntityCoords(PlayerPedId())
    local ped = PlayerPedId()
    local coordswmath = coords + 2
    local playerId = GetPlayerServerId(PlayerId())
    local radius = 100.0
    local x = coords.x + math.random(-radius, radius)
    local y = coords.y + math.random(-radius, radius)



    if args[1] == nil then
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            args = {Config.commandName, "Please give a location"}
        })
    end
    
    if Config.loc[args[1]] then
        SetEntityCoords(ped, Config.loc[args[1]], 1, 0, 0, 1)
        TriggerServerEvent('chatmessage:chat', playerId)
    end


    if args[1] == 'random' then
        local safecoord, NewCoords = GetSafeCoordForPed(x, y, coords.z, false, 16)
        print(NewCoords, safecoord)


        SetEntityCoords(ped, NewCoords, 1, 0, 0, 1)
        TriggerServerEvent('chatmessage:chat', playerId)
    end
end)