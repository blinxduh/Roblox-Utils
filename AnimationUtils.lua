local animation = 
{
    ["TWEEN"] = game:GetService("TweenService")
}

animation["NEW"] = function(Target, Time, Easing, Property)
    local target = Target
    local time = 1 or Time
    local easing = Enum.EasingStyle.Quad or Easing
    local property = {} or Property
    animation.TWEEN:Create(target, TweenInfo.new(time, easing), property):Play()
end

return animation
