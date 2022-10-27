local this = {
    ['prefix'] = '&',
    ['sep'] = " ",
    ['del'] = {}
}

this['ArgumentsText'] = function(...)
    return table.concat({...}, " ")
end

this['TrimArguments'] = function(args)
    if args[2] ~= "" or args[#args] ~= "" then return end
    table.remove(args, 2)
end

this['StripPrefix'] = function(text)
    return text:sub(#this.prefix + 1)
end

this['HasPrefix'] = function(text)
    return text:sub(1, #this.prefix) == this.prefix
end

this['TrimStartSpace'] = function(text)
    return text:gsub("^%s+", "")
end

local function searchCommand(command)
    if not command then return nil end
    command = command:lower()
    for func, method in this.del do 
        if command == func.lower() and typeof(method) == "function" then
            return method
        end
    end
    return nil
end

local function call(player, command, ...)
    local method = searchCommand(command)
    if not method then return end
    method(player, ...)
end

game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        msg = this.TrimStartSpace(msg)
        if not this.HasPrefix(msg:lower()) then return end
        msg = this.StripPrefix(msg)
        local args = msg:split(this.sep)
        this.TrimArguments(args)
        call(player, table.unpack(args))
    end)
end)

return this
