local mouse = {
    ["USERINPUTSERVICE"] = game:GetService("UserInputService"),
    ["MOUSE_ENTERED"] = false
}

mouse["MOUSE_CLICK"] = function(Target, Method)
    Target.MouseEnter:Connect(function() mouse.MOUSE_ENTERED = true end)
    Target.MouseLeave:Connect(function() mouse.MOUSE_ENTERED = false end)
    mouse.USERINPUTSERVICE.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            pcall(Method)
        end
    end)
end

mouse["MOUSE_CLICK2"] = function(Target, Method)
    Target.MouseEnter:Connect(function() mouse.MOUSE_ENTERED = true end)
    Target.MouseLeave:Connect(function() mouse.MOUSE_ENTERED = false end)
    mouse.USERINPUTSERVICE.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            pcall(Method)
        end
    end)
end

mouse["MOUSE_DOWN"] = function(Target, Method)
    Target.MouseEnter:Connect(function() mouse.MOUSE_ENTERED = true end)
    Target.MouseLeave:Connect(function() mouse.MOUSE_ENTERED = false end)
    mouse.USERINPUTSERVICE.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if mouse.USERINPUTSERVICE:IsKeyDown(input.KeyCode) then
                pcall(Method)
            end
        end
    end)
end

mouse["MOUSE_UP"] = function(Target, Method)
    Target.MouseEnter:Connect(function() mouse.MOUSE_ENTERED = true end)
    Target.MouseLeave:Connect(function() mouse.MOUSE_ENTERED = false end)
    mouse.USERINPUTSERVICE.InputEnded:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if mouse.USERINPUTSERVICE:IsKeyDown(input.KeyCode) then
                pcall(Method)
            end
        end
    end)
end

mouse["VMOUSE_CLICK"] = function(METHOD)
    mouse.USERINPUTSERVICE.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            pcall(METHOD)
        end
    end)
end

mouse["VMOUSE_CLICK2"] = function(METHOD)
    mouse.USERINPUTSERVICE.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            pcall(METHOD)
        end
    end)
end

mouse["VMOUSE_DOWN"] = function(METHOD)
    mouse.USERINPUTSERVICE.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if mouse.USERINPUTSERVICE:IsKeyDown(input.KeyCode) then
                return true
            end
        end
    end)
end

mouse["VMOUSE_UP"] = function(METHOD)
    mouse.USERINPUTSERVICE.InputEnded:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if mouse.USERINPUTSERVICE:IsKeyDown(input.KeyCode) then
                return true
            end
        end
    end)
end

mouse["VMOUSE_DOWN2"] = function(METHOD)
    mouse.USERINPUTSERVICE.InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            if mouse.USERINPUTSERVICE:IsKeyDown(input.KeyCode) then
                return true
            end
        end
    end)
end

mouse["VMOUSE_UP2"] = function(METHOD)
    mouse.USERINPUTSERVICE.InputEnded:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            if mouse.USERINPUTSERVICE:IsKeyDown(input.KeyCode) then
                return true
            end
        end
    end)
end

return mouse
