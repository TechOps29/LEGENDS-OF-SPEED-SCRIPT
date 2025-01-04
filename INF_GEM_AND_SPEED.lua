local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Variables to control the state and args count
local isRunning = false
local connection
local argsMultiplier = 1 -- Initial multiplier for args

-- Function to show a notification
local function showNotification(message)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Script Status",
        Text = message,
        Duration = 3 -- Duration of the notification in seconds
    })
end

-- Function to toggle the script
local function toggleScript()
    if isRunning then
        -- Stop the script
        if connection then
            connection:Disconnect()
            connection = nil
        end
        isRunning = false
        showNotification("Script Stopped")
    else
        -- Start the script
        connection = RunService.Heartbeat:Connect(function()
            for i = 1, argsMultiplier do
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
            end
        end)
        isRunning = true
        showNotification("Script Started with " .. argsMultiplier .. " multipliers")
    end
end

-- Function to adjust the args multiplier
local function adjustMultiplier(amount)
    argsMultiplier = math.max(1, argsMultiplier + amount) -- Ensure multiplier doesn't go below 1
    showNotification("Args Multiplier: " .. argsMultiplier)
end

-- Listen for key presses
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.Q then
            toggleScript()
        elseif input.KeyCode == Enum.KeyCode.G then
            adjustMultiplier(1) -- Increase multiplier
        elseif input.KeyCode == Enum.KeyCode.H then
            adjustMultiplier(-1) -- Decrease multiplier
        end
    end
end)
