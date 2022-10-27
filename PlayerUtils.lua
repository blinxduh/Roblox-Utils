local player = {
    ["PLAYER"] = game:GetService("Players").LocalPlayer,
    ["PLAYERS"] = game:GetService("Players"):GetPlayers(),
    ["PLAYER_SV"] = game:GetService("Players")
}

player["GET_PLAYER"] = function()
    return player.PLAYER
end

player["GET_PLAYERS"] = function()
    return player.PLAYERS
end

player["GET_PLAYER_BY_ID"] = function(ID)
    return player.PLAYER_SV:GetPlayerByUserId(ID)
end

player["GET_PLAYER_FROM_CHARACTER"] = function(CHARACTER)
    return player.PLAYER_SV:GetPlayerFromCharacter(CHARACTER)
end

player["GET_PLAYER_HEALTH"] = function()
    return player.PLAYER.Character.Humanoid.Health
end

player["ON_HEALTH_CHANGED"] = function(METHOD)
    player.PLAYER.Character.Humanoid.HealthChanged:Connect(function(health)
        pcall(METHOD, health)
    end)
end

player["GET_PLAYER_DISPLAY_NAME"] = function()
    return player.PLAYER.Character.Humanoid.DisplayName
end

player["IS_PLAYER_ALIVE"] = function()
    if player.GET_PLAYER_HEALTH ~= 0 then
        return true
    end
end

player["IS_PLAYER_DEAD"] = function()
    if player.GET_PLAYER_HEALTH == 0 then
        return true
    end
end

return player
