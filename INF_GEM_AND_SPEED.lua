while true do
    -- Gems
    local args1 = {
        [1] = "collectOrb",
        [2] = "Gem",
        [3] = "City"
    }

    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args1))

    -- Speed
    local args2 = {
        [1] = "collectOrb",
        [2] = "Orange Orb",
        [3] = "City"
    }

    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args2))

    -- Wait for 0.01 seconds before repeating
    wait(0.01)
end
