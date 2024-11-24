local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.8, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset/2, 0.5, -MainFrame.Size.Y.Offset/2)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(128, 0, 128) -- Purple
MainFrame.Visible = false

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Text = ""
ToggleButton.Size = UDim2.new(0.05, 0, 0.05, 0)
ToggleButton.Position = UDim2.new(0.01, 0, 0.01, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Tab Bar (Optional, if you want multiple tabs)
-- ...

-- Main Content
local MainContent = Instance.new("ScrollingFrame")
MainContent.Parent = MainFrame
MainContent.Size = UDim2.new(1, 0, 0.9, 0)
MainContent.Position = UDim2.new(0, 0, 0.1, 0)
MainContent.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
MainContent.CanvasSize = UDim2.new(0, 0, 0, 300)

-- Camlock Feature
local CamlockLabel = Instance.new("TextLabel")
CamlockLabel.Parent = MainContent
CamlockLabel.Text = "Camlock"
CamlockLabel.Size = UDim2.new(1, 0, 0, 20)
CamlockLabel.Position = UDim2.new(0, 0, 0, 0)

local CamlockToggle = Instance.new("TextButton")
CamlockToggle.Parent = MainContent
CamlockToggle.Text = "Off"
CamlockToggle.Size = UDim2.new(0.5, 0, 0, 20)
CamlockToggle.Position = UDim2.new(0.5, 0, 0.2, 0)
CamlockToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

-- Prediction and Jump Offset
local PredictionLabel = Instance.new("TextLabel")
PredictionLabel.Parent = MainContent
PredictionLabel.Text = "Prediction"
PredictionLabel.Size = UDim2.new(1, 0, 0, 20)
PredictionLabel.Position = UDim2.new(0, 0, 0.4, 0)

local PredictionSmoothnessInput = Instance.new("TextBox")
PredictionSmoothnessInput.Parent = MainContent
PredictionSmoothnessInput.Size = UDim2.new(0.5, 0, 0, 20)
PredictionSmoothnessInput.Position = UDim2.new(0, 0, 0.6, 0)

local JumpOffsetInput = Instance.new("TextBox")
JumpOffsetInput.Parent = MainContent
JumpOffsetInput.Size = UDim2.new(0.5, 0, 0, 20)
JumpOffsetInput.Position = UDim2.new(0.5, 0, 0.6, 0)

-- ... (Add more features and functionality as needed)

-- Draggability
local UserInputService = game:GetService("UserInputService")
local isDragging = false
local dragOffset = Vector2.new(0, 0)

MainFrame.MouseButton1Down:Connect(function()
    isDragging = true
    dragOffset = UserInputService:GetMouseLocation() - MainFrame.AbsolutePosition
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
        local newPos = input.Position - dragOffset
        MainFrame.Position = UDim2.new(0, newPos.X, 0, newPos.Y)
    end
end)

-- Toggle Button Click
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Camlock Toggle Click (Example)
CamlockToggle.MouseButton1Click:Connect(function()
    -- Your camlock logic here (e.g., enabling/disabling camlock)
    if CamlockToggle.Text == "Off" then
        CamlockToggle.Text = "On"
        -- Enable camlock
    else
        CamlockToggle.Text = "Off"
        -- Disable camlock
    end
end)
