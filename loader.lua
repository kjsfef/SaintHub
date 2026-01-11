-- Saint Hub Loader
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local CoreGui = gethui and gethui() or game:GetService("CoreGui")

-- Blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = 35 }):Play()

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SaintHubLoader"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local root = Instance.new("Frame")
root.Size = UDim2.new(1, 0, 1, 0)
root.BackgroundTransparency = 1
root.Parent = gui

-- Background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(15, 0, 25)
bg.BackgroundTransparency = 1
bg.ZIndex = 0
bg.Parent = root
TweenService:Create(bg, TweenInfo.new(0.25, Enum.EasingStyle.Sine), { BackgroundTransparency = 0.18 }):Play()

-- Title letters animation
local TITLE = "Saint Hub"
local labels = {}
local spacing = 48

for i = 1, #TITLE do
    local char = TITLE:sub(i,i)
    local lbl = Instance.new("TextLabel")
    lbl.Text = char
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextColor3 = Color3.fromRGB(255,255,255)
    lbl.TextTransparency = 1
    lbl.TextStrokeTransparency = 1
    lbl.TextSize = 44
    lbl.AnchorPoint = Vector2.new(0.5,0.5)
    lbl.Position = UDim2.new(0.5, (i - (#TITLE / 2 + 0.5))*spacing, 0.5, 0)
    lbl.BackgroundTransparency = 1
    lbl.Parent = root

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,200,0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
    })
    grad.Rotation = -45
    grad.Parent = lbl

    TweenService:Create(lbl, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        TextTransparency = 0,
        TextStrokeTransparency = 0.4,
        TextSize = 68
    }):Play()

    TweenService:Create(lbl, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        TextSize = 54
    }):Play()

    table.insert(labels, lbl)
    task.wait(0.09)
end

-- Continue button
local button = Instance.new("TextButton")
button.Text = "Continue"
button.Font = Enum.Font.GothamBold
button.TextSize = 28
button.TextColor3 = Color3.fromRGB(255,255,255)
button.BackgroundColor3 = Color3.fromRGB(50,0,100)
button.Size = UDim2.new(0,200,0,50)
button.AnchorPoint = Vector2.new(0.5,0.5)
button.Position = UDim2.new(0.5,0,0.75,0)
button.Parent = root

-- Hover effect
button.MouseEnter:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100,0,200)}):Play()
end)
button.MouseLeave:Connect(function()
    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50,0,100)}):Play()
end)

-- Fade out everything when clicked
button.MouseButton1Click:Connect(function()
    for _, lbl in ipairs(labels) do
        TweenService:Create(lbl, TweenInfo.new(0.2), {TextTransparency = 1, TextStrokeTransparency = 1, TextSize = 22}):Play()
    end
    TweenService:Create(bg, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    TweenService:Create(button, TweenInfo.new(0.2), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(blur, TweenInfo.new(0.2), {Size = 0}):Play()
    task.wait(0.25)
    gui:Destroy()
    blur:Destroy()
end)
