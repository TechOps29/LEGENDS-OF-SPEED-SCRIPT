local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Function to handle the pressing of the Q key
local function onKeyPress(input)
    if input.KeyCode == Enum.KeyCode.Q then
        -- Pets action: Open the Electro Legends Crystal
        local args = {
            [1] = "openCrystal",
            [2] = "Electro Legends Crystal"
        }

        game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end
end

-- Connect to UserInputService to listen for the Q key press
UserInputService.InputBegan:Connect(onKeyPress)

-- Loop for Gems and Speed actions with the shortest cooldown
while true do
    -- Gems
    local args1 = {
        [1] = "collectOrb",
        [2] = "Gem",
        [3] = "Legends Highway"
    }

    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args1))

    -- Speed
    local args2 = {
        [1] = "collectOrb",
        [2] = "Orange Orb",
        [3] = "Legends Highway"
    }

    game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args2))

    -- Wait for 0.01 seconds before repeating
    wait(0.01)
end
