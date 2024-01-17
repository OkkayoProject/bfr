
	-- Create a ScreenGui named "ScriptMain" in StarterGui
	local screenGui = Instance.new("ScreenGui", game.StarterGui)
	screenGui.Name = "ScriptMain"

	-- Create a Frame named "FrameMain" within the ScreenGui
	local frameMain = Instance.new("Frame", screenGui)
	frameMain.Name = "FrameMain"
	frameMain.Transparency = 0.75
	frameMain.Position = UDim2.new(0.25, 0, 0.2, 0)
	frameMain.Size = UDim2.new(0, 500, 0, 400)

	-- Create a TextButton named "AutoChest" within the Frame
	local autoChestButton = Instance.new("TextButton", frameMain)
	autoChestButton.Name = "AutoChest"

	-- Create a Script named "ScriptOfFarm" within the TextButton
	local scriptOfFarm = Instance.new("Script", autoChestButton)
	scriptOfFarm.Name = "ScriptOfFarm"

	-- Set properties for the AutoChest TextButton
	autoChestButton.Size = UDim2.new(0.394, 0, 0.17, 0)
	autoChestButton.Position = UDim2.new(0, 0, 0, 0)
	autoChestButton.Text = "AutoChest"
	autoChestButton.TextSize = 17
	autoChestButton.AnchorPoint = Vector2.new(0, 0)
	autoChestButton.BackgroundColor3 = Color3.fromRGB(184, 184, 184)
	autoChestButton.BorderSizePixel = 6
	autoChestButton.BorderColor3 = Color3.fromRGB(8, 0, 255)
	autoChestButton.Font = Enum.Font.SourceSansBold
	autoChestButton.Visible = true
	autoChestButton.TextWrapped = false
	autoChestButton.TextDirection = Enum.TextDirection.Auto
	autoChestButton.AutoLocalize = true
	autoChestButton.BackgroundTransparency = 0

	-- Define Lua code in the Script
	scriptOfFarm.Source = [[
-- Localize the TextButton in the game
local textButton = script.Parent  -- Assuming the script is directly connected to the TextButton

-- Possible states
local states = {
    Active = "Active",
    Inactive = "Inactive"
}

-- Initial state
local currentState = states.Inactive

-- Function to toggle between states and move the "Chest" as needed
local function toggleState()
    if currentState == states.Inactive then
        currentState = states.Active
        moveChest()  -- Move the "Chest" when activated
    else
        currentState = states.Inactive
        -- Add logic here to reverse changes when deactivated if needed
    end

    print("Current State: " .. currentState)
end

-- Function to find the "Chest" and use Tween to move it
local function moveChest()
    local chest = workspace:FindFirstChild("Chest")

    if chest then
        -- Set the target position where the "Chest" should be moved
        local targetPosition = Vector3.new(0, 10, 0)  -- Replace with the desired position

        -- Create a Tween service to animate the movement
        local tweenService = game:GetService("TweenService")
        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)

        -- Configure the Tween
        local tweenGoal = {}
        tweenGoal.Position = targetPosition

        local tween = tweenService:Create(chest, tweenInfo, tweenGoal)

        -- Connect a function to reverse changes when the animation completes (optional)
        tween.Completed:Connect(function()
            if currentState == states.Inactive then
                -- Add logic here to reverse changes when deactivated if necessary
            end
        end)

        -- Start the Tween
        tween:Play()
    else
        warn("Chest not found in the Workspace.")
    end
end

-- Connect the function to the TextButton's MouseButton1Click event
textButton.MouseButton1Click:Connect(toggleState)
]]

	-- Adjust the button text for easier access (optional)
	autoChestButton.Text = "AutoChest"
