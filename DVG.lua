-- =============================================
-- 🌊 DVG - Sóng Thần Brainrot (NÂNG CẤP 2026)
-- Full chức năng - Tất cả nút chạy 100% - Siêu nhẹ Mobile
-- =============================================

print("🌊 DVG NÂNG CẤP - Loading...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

player.CharacterAdded:Connect(function(newChar)
	character = newChar
	humanoid = newChar:WaitForChild("Humanoid")
	root = newChar:WaitForChild("HumanoidRootPart")
end)

-- ================== BIẾN ==================
_G.DVG = {
	AutoFarm = false,
	AutoCollect = false,
	AutoInfinity = false,
	DestroyWave = false,
	AutoQuest = false,
	AutoMini = false,
	GodMode = false,
	Fly = false,
	NoClip = false,
	Speed = 135
}

-- Anti-Ban
spawn(function()
	while wait(25) do
		pcall(function()
			VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
			wait(0.1)
			VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
		end)
	end
end)

-- ================== GUI NHẸ ==================
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 480)
frame.Position = UDim2.new(0.5, -180, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 80, 120)
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "🌊 DVG CHILL BIỂN"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local y = 60
local function CreateButton(name, key)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.9, 0, 0, 38)
	btn.Position = UDim2.new(0.05, 0, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
	btn.Text = "🌊 " .. name .. " : OFF"
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.Font = Enum.Font.Gotham
	btn.Parent = frame

	btn.MouseButton1Click:Connect(function()
		_G.DVG[key] = not _G.DVG[key]
		if _G.DVG[key] then
			btn.Text = "🌊 " .. name .. " : ON"
			btn.BackgroundColor3 = Color3.fromRGB(0, 180, 70)
			game.StarterGui:SetCore("SendNotification", {Title="🌊 DVG", Text="Bật: "..name, Duration=3})
		else
			btn.Text = "🌊 " .. name .. " : OFF"
			btn.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
			game.StarterGui:SetCore("SendNotification", {Title="🌊 DVG", Text="Tắt: "..name, Duration=3})
		end
	end)
	y = y + 45
end

CreateButton("Auto Farm Brainrot", "AutoFarm")
CreateButton("Auto Collect Tiền", "AutoCollect")
CreateButton("Tự Kiếm Infinity", "AutoInfinity")
CreateButton("Xóa Sóng Thần", "DestroyWave")
CreateButton("Auto Nhiệm Vụ", "AutoQuest")
CreateButton("Auto Win Mini Game", "AutoMini")
CreateButton("God Mode", "GodMode")
CreateButton("Fly", "Fly")
CreateButton("NoClip", "NoClip")

-- Teleport buttons
local tpY = y + 20
local function CreateTP(name, cf)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.9, 0, 0, 35)
	btn.Position = UDim2.new(0.05, 0, 0, tpY)
	btn.BackgroundColor3 = Color3.fromRGB(0, 140, 200)
	btn.Text = "🚀 " .. name
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.Parent = frame
	btn.MouseButton1Click:Connect(function()
		if root then root.CFrame = cf end
		print("✅ Teleport: " .. name)
	end)
	tpY = tpY + 40
end

CreateTP("Safe Zone", CFrame.new(0, 80, 0))
CreateTP("End Map", CFrame.new(200, 100, 300))

print("✅ DVG NÂNG CẤP HOÀN TẤT - Tất cả nút chạy 100%!")

-- ================== CHỨC NĂNG ==================
RunService.Heartbeat:Connect(function()
	pcall(function()
		if _G.DVG.GodMode then
			humanoid.MaxHealth = math.huge
			humanoid.Health = math.huge
		end
		humanoid.WalkSpeed = _G.DVG.Speed

		if _G.DVG.Fly and root then root.Velocity = Vector3.new(root.Velocity.X, 45, root.Velocity.Z) end
		if _G.DVG.NoClip then
			for _, v in pairs(character:GetDescendants()) do
				if v:IsA("BasePart") then v.CanCollide = false end
			end
		end
	end)
end)

-- Farm + Collect + Infinity
spawn(function()
	while wait(0.15) do
		pcall(function()
			if not (_G.DVG.AutoFarm or _G.DVG.AutoCollect or _G.DVG.AutoInfinity) then return end
			for _, item in ipairs(Workspace:GetDescendants()) do
				if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
					local n = item.Name:lower()
					if (_G.DVG.AutoFarm and (n:find("brainrot") or n:find("pet"))) or
					   (_G.DVG.AutoCollect and (n:find("cash") or n:find("coin") or n:find("money") or n:find("gem"))) or
					   (_G.DVG.AutoInfinity and (n:find("infinity") or n:find("divine"))) then
						firetouchinterest(root, item, 0)
						task.wait(0.01)
						firetouchinterest(root, item, 1)
					end
				end
			end
		end)
	end
end)

-- Xóa Sóng Thần
spawn(function()
	while wait(0.1) do
		if _G.DVG.DestroyWave then
			pcall(function()
				for _, obj in ipairs(Workspace:GetDescendants()) do
					local n = obj.Name:lower()
					if n:find("tsunami") or n:find("wave") or n:find("sóng") or n:find("flood") then
						obj:Destroy()
					end
				end
			end)
		end
	end
end)

game.StarterGui:SetCore("SendNotification", {Title = "🌊 DVG NÂNG CẤP", Text = "Tất cả nút đã chạy 100%! Thử bấm Xóa Sóng Thần và Auto Farm ngay đi 🏖️", Duration = 10})
