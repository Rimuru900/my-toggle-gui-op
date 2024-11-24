local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.8, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset/2, 0.5, -MainFrame.Size.Y.Offset/2)
MainFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MainFrame.Visible = false

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Text = ""
ToggleButton.Size = UDim2.new(0.05, 0, 0.05, 0)
ToggleButton.Position = UDim2.new(0.01, 0, 0.01, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Add a TextLabel inside the ToggleButton for a cleaner look
local ToggleButtonText = Instance.new("TextLabel")
ToggleButtonText.Parent = ToggleButton
ToggleButtonText.Text = "Toggle"
ToggleButtonText.Size = UDim2.new(1, 0, 1, 0)
ToggleButtonText.BackgroundColor3 = Color3.fromRGB(0, 0, 0, 0) -- Transparent background
ToggleButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButtonText.TextScaled = true -- Adjust text size to fit the button

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)