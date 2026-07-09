local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- GUI Creation
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 150, 0, 40)
frame.Position = UDim2.new(0, 10, 0.5, -20)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 1, 0)
button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
button.Text = "Firefly Jump"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18
button.Parent = frame

-- Auto Jump Logic
local autoJumpEnabled = false
local jumpConnection

local function fireflyJump()
    if autoJumpEnabled then
        autoJumpEnabled = false
        button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        button.Text = "Firefly Jump"
        return
    end

    if not character:FindFirstChild("Firefly") then
        button.Text = "Need Firefly!"
        task.wait(1)
        button.Text = "Firefly Jump"
        return
    end

    autoJumpEnabled = true
    button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    button.Text = "Jumping..."

    task.spawn(function()
        while autoJumpEnabled do
            local char = player.Character
            if char and char:FindFirstChild("Firefly") and char:FindFirstChild("Humanoid") then
                local humanoid = char.Humanoid
                if humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
           
