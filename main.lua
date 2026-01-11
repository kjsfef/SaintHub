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
	["3808223175"] = { id = "4fe2dfc202115670b1813277df916ab2", keyless = true }, -- Jujutsu Infinite
	["994732206"]  = { id = "e2718ddebf562c5c4080dfce26b09398", keyless = true }, -- Blox Fruits
	["1650291138"] = { id = "9b64d07193c7c2aef970d57aeb286e70", keyless = true }, -- Demon Fall
	["5750914919"] = { id = "8bbc8a7c4e023bc0c80799fec3233162", keyless = true }, -- Fisch
	["3317771874"] = { id = "e95ef6f27596e636a7d706375c040de4", keyless = true }, -- Pet Simulator 99
	["1511883870"] = { id = "fefdf5088c44beb34ef52ed6b520507c", keyless = true }, -- Shindo Life
	["6035872082"] = { id = "3bb7969a9ecb9e317b0a24681327c2e2", keyless = true }, -- Rivals
	["245662005"]  = { id = "21ad7f491e4658e9dc9529a60c887c6e", keyless = true }, -- Jailbreak
	["7018190066"] = { id = "98f5c64a0a9ecca29517078597bbcbdb", keyless = true }, -- Dead Rails
	["7074860883"] = { id = "0c8fdf9bb25a6a7071731b72a90e3c69", keyless = true }, -- Arise Crossover
	["7436755782"] = { id = "e4ea33e9eaf0ae943d59ea98f2444ebe", keyless = true }, -- Grow a Garden
	["7326934954"] = { id = "00e140acb477c5ecde501c1d448df6f9", keyless = true }, -- 99 Nights in the Forest
	["8316902627"] = { id = "641e8d02ffba666d731614a32c08eacf", keyless = true }, -- Plants vs Brainrot
	["8321616508"] = { id = "2cd0668c5caf66913e7314cdb6d1eb9b", keyless = true }, -- Rogue Piece
	["3457700596"] = { id = "639c0b275001182cca67ac85f5bd529f", keyless = true }, -- Fruit Battlegrounds
	["7671049560"] = { id = "c0b41e859f576fb70183206224d4a75f", keyless = true }, -- The Forge
	["6760085372"] = { id = "e380382a05647eabda3a9892f95952c6", keyless = true }, -- Jujutsu: Zero
	["9266873836"] = { id = "3f9d315017ec895ded5c3350fd6e45a0", keyless = true }, -- Anime Fighting Simulator
}

-- ===================== GAME RESOLUTION =====================
local executor_name = (getexecutorname and getexecutorname():match("^%s*(.-)%s*$")) or "UnknownExecutor"
local game_id = tostring(game.GameId)
local game_cfg = ListGame[game_id]

if not game_cfg then
	Players.LocalPlayer:Kick("Saint Hub: This game is not supported.")
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

-- ===================== TASK & WINDOW =====================
function Task()
	local status, res1, res2 = pcall(function()
		local Task = {}
		local LSMT = game:GetObjects("rbxassetid://126113170246030")[1]

		local function Close(Objectftween)
			TweenService:Create(Objectftween, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(0, 10, 0, 10),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}):Play()
			task.wait(0.1)
			LSMT:Destroy()
		end

		if get_ui then
			LSMT.Parent = get_ui()
		elseif syn and syn.protect_gui then
			syn.protect_gui(LSMT)
			LSMT.Parent = CoreGui
		else
			LSMT.Parent = CoreGui
		end

		getgenv().SAINTHUB_UI = LSMT

		function Task:Window(config)
			config.DisplayName = config.DisplayName or "Saint Hub"
			config.Discord = config.Discord or ""
			config.MinIcon = config.MinIcon or "rbxassetid://100569530935041"
			config.Linkvertise = config.Linkvertise
			config.Rinku = config.Rinku

			local Main = LSMT.Main
			local DragBar = Main.Movebar
			local Top = Main.Top
			local Buttons = Main.ButtonContainer
			local CloseBT = Top.CloseButton
			local Title = Top.Title
			local icon = Top.Logo

			Top.Logo.Image = config.MinIcon
			Top.Title.Text = config.DisplayName

			CloseBT.ImageButton.MouseButton1Click:Connect(function()
				Close(Main)
			end)

			Buttons.Links.LootLabs.MouseButton1Click:Connect(function()
				setclipboard(config.Rinku)
			end)

			Buttons.Links.Linkvertise.MouseButton1Click:Connect(function()
				setclipboard(config.Linkvertise)
			end)

			Buttons.Discord.MouseButton1Click:Connect(function()
				setclipboard(tostring(config.Discord))
			end)

			local function DraggFunction(object, drag_object)
				local dragging = false
				local relative = nil
				UserInputService.InputBegan:Connect(function(input, processed)
					if processed then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
						relative = object.AbsolutePosition + object.AbsoluteSize * object.AnchorPoint - UserInputService:GetMouseLocation()
					end
				end)
				UserInputService.InputEnded:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
				RunService.RenderStepped:Connect(function()
					if dragging then
						local pos = UserInputService:GetMouseLocation() + relative
						object.Position = UDim2.fromOffset(pos.X, pos.Y)
					end
				end)
			end

			DraggFunction(Main, DragBar)
			return {}
		end

		return Task
	end)
	if not status then
		warn("Saint Hub failed to load:", res1)
	else
		return res1, res2
	end
end

local Task = Task()

local Window = Task:Window({
	Discord = "https://discord.gg/yourdiscord",
	DisplayName = "Saint Hub FREE 20+ Games",
	MinIcon = "rbxassetid://129420862771843",
	Linkvertise = "https://yourlink.com",
	Rinku = "https://yourlink.com",
})

-- ===================== LOAD LOADER =====================
loadstring(game:HttpGet("https://raw.githubusercontent.com/kjsfef/SaintHub/refs/heads/main/loader.lua"))()

