-- ===================== SAINT HUB MAIN =====================
repeat wait() until game:IsLoaded()

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Destroy old loader or UI if exists
if CoreGui:FindFirstChild("SaintHubUI") then
    CoreGui.SaintHubUI:Destroy()
end

-- Main ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SaintHubUI"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Main Hub Frame
local main = Instance.new("Frame")
main.Name = "MainHub"
main.Size = UDim2.new(0, 600, 0, 400)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
main.BorderSizePixel = 0
main.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Text = "Saint Hub FREE 20+ Games"
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.Parent = main

-- Close Button
local close = Instance.new("TextButton")
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 20
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundColor3 = Color3.fromRGB(150, 0, 50)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -45, 0, 5)
close.Parent = main

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Example Game Button (you can add more)
local gameButton = Instance.new("TextButton")
gameButton.Text = "Play Example Game"
gameButton.Font = Enum.Font.GothamBold
gameButton.TextSize = 22
gameButton.TextColor3 = Color3.fromRGB(255,255,255)
gameButton.BackgroundColor3 = Color3.fromRGB(50,0,100)
gameButton.Size = UDim2.new(0,200,0,50)
gameButton.Position = UDim2.new(0.5,-100,0.5,-25)
gameButton.AnchorPoint = Vector2.new(0.5,0.5)
gameButton.Parent = main

gameButton.MouseEnter:Connect(function()
    TweenService:Create(gameButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100,0,200)}):Play()
end)
gameButton.MouseLeave:Connect(function()
    TweenService:Create(gameButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50,0,100)}):Play()
end)

gameButton.MouseButton1Click:Connect(function()
    print("Launch the game script here!")
    -- You can call your actual game functions here
end)
