repeat wait() until game:IsLoaded()

local cloneref = cloneref or function(o) return o end

Workspace = cloneref(game:GetService("Workspace"))
Players = cloneref(game:GetService("Players"))
PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
HttpService = cloneref(game:GetService("HttpService"))
TweenService = cloneref(game:GetService("TweenService"))
UserInputService = cloneref(game:GetService("UserInputService"))
Market = cloneref(game:GetService("MarketplaceService"))
RBXAnalyt = cloneref(game:GetService("RbxAnalyticsService"))
CoreGui = cloneref(game:GetService("CoreGui"))
RunService = cloneref(game:GetService("RunService"))
Replicated = cloneref(game:GetService("ReplicatedStorage"))

-- ===================== GAME LIST =====================
local ListGame = {
    ["3808223175"] = { id = "4fe2dfc202115670b1813277df916ab2" }, -- Jujutsu Infinite
    ["994732206"] = { id = "e2718ddebf562c5c4080dfce26b09398" }, -- Blox Fruits
    ["1650291138"] = { id = "9b64d07193c7c2aef970d57aeb286e70" }, -- Demon Fall
    ["5750914919"] = { id = "8bbc8a7c4e023bc0c80799fec3233162" }, -- Fisch
    ["3317771874"] = { id = "e95ef6f27596e636a7d706375c040de4" }, -- Pet Simulator 99
    ["1511883870"] = { id = "fefdf5088c44beb34ef52ed6b520507c" }, -- Shindo Life
    ["6035872082"] = { id = "3bb7969a9ecb9e317b0a24681327c2e2" }, -- Rivals
    ["245662005"] = { id = "21ad7f491e4658e9dc9529a60c887c6e" }, -- Jailbreak
    ["7018190066"] = { id = "98f5c64a0a9ecca29517078597bbcbdb" }, -- Dead Rails
    ["7074860883"] = { id = "0c8fdf9bb25a6a7071731b72a90e3c69" }, -- Arise Crossover
    ["7436755782"] = { id = "e4ea33e9eaf0ae943d59ea98f2444ebe" }, -- Grow a Garden
    ["7326934954"] = { id = "00e140acb477c5ecde501c1d448df6f9" }, -- 99 Nights in the Forest
    ["8316902627"] = { id = "641e8d02ffba666d731614a32c08eacf" }, -- Plants vs Brainrot
    ["8321616508"] = { id = "2cd0668c5caf66913e7314cdb6d1eb9b" }, -- Rogue Piece
    ["3457700596"] = { id = "639c0b275001182cca67ac85f5bd529f" }, -- Fruit Battlegrounds
    ["7671049560"] = { id = "c0b41e859f576fb70183206224d4a75f" }, -- The Forge
    ["6760085372"] = { id = "e380382a05647eabda3a9892f95952c6" }, -- Jujutsu: Zero
    ["9266873836"] = { id = "3f9d315017ec895ded5c3350fd6e45a0" }, -- Anime Fighting Simulator
}

-- ===================== GAME RESOLUTION =====================
local executor_name = getexecutorname():match("^%s*(.-)%s*$") or "Unknown"
local game_id = tostring(game.GameId)
local game_cfg = ListGame[game_id]

if not game_cfg then
    Players.LocalPlayer:Kick("This game is not supported.")
end

local script_id = game_cfg.id

if CoreGui:FindFirstChild("System") then
    CoreGui.System:Destroy()
end

for _, exec in ipairs({"Xeno", "Solara"}) do
    if string.find(executor_name, exec) then
        workspace:SetAttribute("low", true)
        break
    end
end

-- ===================== TASK =====================
local Task = {}

function Task()
    local status, res1, res2 = pcall(function()
        local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
        api.script_id = script_id
        pcall(function() api.load_script() end)
        
        -- ===================== GUI =====================
        local LSMT = game:GetObjects("rbxassetid://126113170246030")[1]
        
        local function Close(Objectftween)
            TweenService:Create(Objectftween, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.new(0, 10, 0, 10), Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
            task.wait(0.1)
            LSMT:Destroy()
        end
        
        local NotificationGUI = PlayerGui:FindFirstChild("Notifications") or Instance.new("ScreenGui")
        NotificationGUI.Name = "Notifications"
        NotificationGUI.Parent = PlayerGui
        
        local Container = NotificationGUI:FindFirstChild("Container") or Instance.new("Frame")
        Container.Name = "Container"
        Container.AnchorPoint = Vector2.new(1, 0)
        Container.Position = UDim2.new(1, -25, 0, 25)
        Container.BackgroundTransparency = 1
        Container.Size = UDim2.fromOffset(350, 600)
        Container.Parent = NotificationGUI
        
        if not Container:FindFirstChild("UIListLayout") then
            local Layout = Instance.new("UIListLayout")
            Layout.SortOrder = Enum.SortOrder.LayoutOrder
            Layout.Padding = UDim.new(0, 8)
            Layout.VerticalAlignment = Enum.VerticalAlignment.Top
            Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
            Layout.Parent = Container
        end
        
        local function NotifyCustom(title, content, duration)
            duration = duration or 5
            local color = Color3.fromRGB(255, 188, 254)
            local Notification = Instance.new("Frame")
            Notification.Name = "Notification"
            Notification.BackgroundTransparency = 0.06
            Notification.AutomaticSize = Enum.AutomaticSize.Y
            Notification.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
            Notification.BorderSizePixel = 0
            Notification.Size = UDim2.fromOffset(320, 70)
            Notification.Parent = Container

            local NotifCorner = Instance.new("UICorner")
            NotifCorner.CornerRadius = UDim.new(0, 8)
            NotifCorner.Parent = Notification

            local NotifStroke = Instance.new("UIStroke")
            NotifStroke.Color = Color3.fromRGB(158, 114, 158)
            NotifStroke.Transparency = 0.8
            NotifStroke.Parent = Notification

            local TitleText = Instance.new("TextLabel")
            TitleText.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
            TitleText.Text = title
            TitleText.TextColor3 = Color3.fromRGB(199, 199, 203)
            TitleText.TextSize = 16
            TitleText.TextXAlignment = Enum.TextXAlignment.Left
            TitleText.BackgroundTransparency = 1
            TitleText.Size = UDim2.new(1, -20, 0, 20)
            TitleText.Position = UDim2.fromOffset(10, 6)
            TitleText.Parent = Notification

            local ContentText = Instance.new("TextLabel")
            ContentText.FontFace = Font.new("rbxassetid://12187365364")
            ContentText.Text = content
            ContentText.TextColor3 = Color3.fromRGB(180, 180, 185)
            ContentText.TextSize = 14
            ContentText.TextXAlignment = Enum.TextXAlignment.Left
            ContentText.TextYAlignment = Enum.TextYAlignment.Top
            ContentText.BackgroundTransparency = 1
            ContentText.AutomaticSize = Enum.AutomaticSize.Y
            ContentText.TextWrapped = true
            ContentText.Size = UDim2.new(1, -20, 0, 0)
            ContentText.Position = UDim2.fromOffset(10, 28)
            ContentText.Parent = Notification

            local ProgressBar = Instance.new("Frame")
            ProgressBar.BackgroundColor3 = Color3.fromRGB(44, 38, 44)
            ProgressBar.BorderSizePixel = 0
            ProgressBar.Size = UDim2.new(1, -20, 0, 6)
            ProgressBar.Position = UDim2.new(0, 10, 1, -12)
            ProgressBar.Parent = Notification

            local ProgressFill = Instance.new("Frame")
            ProgressFill.BackgroundColor3 = color
            ProgressFill.BorderSizePixel = 0
            ProgressFill.Size = UDim2.fromScale(1, 1)
            ProgressFill.Parent = ProgressBar

            local ProgressFillCorner = Instance.new("UICorner")
            ProgressFillCorner.Parent = ProgressFill

            TweenService:Create(ProgressFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()

            task.delay(duration, function()
                TweenService:Create(Notification, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
                task.wait(0.3)
                Notification:Destroy()
            end)

            return Notification
        end

        -- ===================== FINAL SETUP =====================
        LSMT.Enabled = false
        if get_ui then
            LSMT.Parent = get_ui()
        elseif syn and syn.protect_gui then
            syn.protect_gui(LSMT)
            LSMT.Parent = CoreGui
        else
            LSMT.Parent = CoreGui
        end

        RenameAllChildren(LSMT)

        return {
            Window = function(config)
                config.DisplayName = config.DisplayName or "SaintHub"
                config.Discord = config.Discord or ""
                config.MinIcon = config.MinIcon or "rbxassetid://100569530935041"

                local Main = LSMT.Main
                local DragBar = Main.Movebar
                DraggFunction(Main, DragBar, true, 0)

                return Main
            end
        }
    end)
end

Task = Task()
local Window = Task.Window({
    Discord = "https://discord.gg/sainthub",
    DisplayName = "SaintHub FREE 20+ Games",
    MinIcon = "rbxassetid://129420862771843"
})
