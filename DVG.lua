-- =============================================
-- 🌊 DVG MATRIX ULTIMATE 2026 - PHIÊN BẢN CUỐI
-- Có nút bật/tắt menu bằng phím INSERT
-- Code dài, uy tín, pro - Tất cả chức năng chạy thật
-- =============================================

print("🌊 DVG MATRIX ULTIMATE 2026 - Đang load...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

player.CharacterAdded:Connect(function(new)
	character = new
	humanoid = new:WaitForChild("Humanoid")
	root = new:WaitForChild("HumanoidRootPart")
end)

_G.DVG = {
	AutoFarm = false, AutoCollect = false, AutoInfinity = false, DestroyWave = false,
	GodMode = false, Fly = false, NoClip = false, Speed = 145
}

-- ================== GUI NEON ==================
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 550)
main.Position = UDim2.new(0.5, -200, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(8, 8, 28)
main.BorderSizePixel = 0
main.Parent = sg

-- Glow
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1,30,1,30)
glow.Position = UDim2.new(0,-15,0,-15)
glow.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
glow.BackgroundTransparency = 0.75
glow.ZIndex = -1
glow.Parent = main

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1,0,0,55)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
titleBar.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "🌊 DVG MATRIX ULTIMATE"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.Parent = titleBar

-- Kéo thả
local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)
titleBar.InputChanged:Connect(function(input)
	if dragging then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
titleBar.InputEnded:Connect(function() dragging = false end)

local y = 70
local function AddBtn(name, key)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.92, 0, 0, 45)
	btn.Position = UDim2.new(0.04, 0, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 45)
	btn.Text = "🌊 " .. name .. "   [OFF]"
	btn.TextColor3 = Color3.fromRGB(0, 255, 200)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold
	btn.Parent = main

	btn.MouseButton1Click:Connect(function()
		_G.DVG[key] = not _G.DVG[key]
		btn.Text = "🌊 " .. name .. "   [" .. (_G.DVG[key] and "ON" or "OFF") .. "]"
		btn.BackgroundColor3 = _G.DVG[key] and Color3.fromRGB(0,200,100) or Color3.fromRGB(20,20,45)
	end)
	y = y + 52
end

AddBtn("Auto Farm Brainrot", "AutoFarm")
AddBtn("Auto Collect Tiền", "AutoCollect")
AddBtn("Tự Kiếm Infinity", "AutoInfinity")
AddBtn("XÓA SÓNG THẦN (FIX)", "DestroyWave")
AddBtn("God Mode", "GodMode")
AddBtn("Fly", "Fly")
AddBtn("NoClip", "NoClip")

StarterGui:SetCore("SendNotification", {Title = "🌊 DVG MATRIX", Text = "MENU LOAD XONG!\nNhấn INSERT để bật/tắt menu", Duration = 10})

-- ================== BẬT/TẮT MENU BẰNG PHÍM INSERT ==================
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.Insert then
		sg.Enabled = not sg.Enabled
		StarterGui:SetCore("SendNotification", {
			Title = "🌊 DVG",
			Text = sg.Enabled and "MENU ĐÃ HIỆN" or "MENU ĐÃ ẨN",
			Duration = 2
		})
	end
end)

-- ================== CHỨC NĂNG ==================
RunService.Heartbeat:Connect(function()
	pcall(function()
		if _G.DVG.GodMode then
			humanoid.MaxHealth = math.huge
			humanoid.Health = math.huge
		end
		humanoid.WalkSpeed = _G.DVG.Speed

		if _G.DVG.Fly and root then root.Velocity = Vector3.new(root.Velocity.X, 52, root.Velocity.Z) end
		if _G.DVG.NoClip then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = false end
			end
		end
	end)
end)

-- Auto Farm
spawn(function()
	while wait(0.11) do
		pcall(function()
			if not (_G.DVG.AutoFarm or _G.DVG.AutoCollect or _G.DVG.AutoInfinity) then return end
			for _, item in ipairs(Workspace:GetDescendants()) do
				if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
					local n = item.Name:lower()
					if (_G.DVG.AutoFarm and (n:find("brainrot") or n:find("pet"))) or
					   (_G.DVG.AutoCollect and (n:find("cash") or n:find("coin") or n:find("money") or n:find("gem"))) or
					   (_G.DVG.AutoInfinity and (n:find("infinity") or n:find("divine"))) then
						firetouchinterest(root, item, 0)
						task.wait(0.008)
						firetouchinterest(root, item, 1)
					end
				end
			end
		end)
	end
end)

-- Xóa Sóng Thần (không chết)
spawn(function()
	while wait(0.08) do
		if _G.DVG.DestroyWave then
			pcall(function()
				for _, obj in ipairs(Workspace:GetDescendants()) do
					local n = obj.Name:lower()
					if n:find("tsunami") or n:find("wave") or n:find("sóng") or n:find("flood") then
						obj:Destroy()
					end
				end
				if root then root.CFrame = root.CFrame + Vector3.new(0, 28, 0) end
			end)
		end
	end
end)

print("✅ DVG MATRIX ULTIMATE - MENU ĐÃ CÓ BẬT/TẮT BẰNG PHÍM INSERT!")
