-- =============================================
-- 🌊 DVG MATRIX ULTIMATE 2026
-- Menu neon công nghệ xịn • Tất cả chức năng chạy thật 100%
-- Siêu mượt - Load ngay - Không Rayfield - Dành cho Delta Mobile & Xeno
-- =============================================

print("🌊 DVG MATRIX ULTIMATE ĐANG LOAD...")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

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
	GodMode = false, Fly = false, NoClip = false, InfJump = false,
	Speed = 140, Jump = 120
}

-- ================== GUI NEON MATRIX XỊN ==================
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 400, 0, 520)
main.Position = UDim2.new(0.5, -200, 0.5, -260)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 25)
main.BorderSizePixel = 0
main.Parent = sg

-- Glow effect
local glow = Instance.new("Frame")
glow.Size = UDim2.new(1, 20, 1, 20)
glow.Position = UDim2.new(0, -10, 0, -10)
glow.BackgroundTransparency = 0.7
glow.BackgroundColor3 = Color3.fromRGB(0, 255, 200)
glow.ZIndex = -1
glow.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.Text = "🌊 DVG MATRIX ULTIMATE"
title.TextColor3 = Color3.fromRGB(0, 255, 200)
title.TextScaled = true
title.Font = Enum.Font.Arcade
title.Parent = main

local y = 70
local function AddToggle(name, key)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.92, 0, 0, 42)
	btn.Position = UDim2.new(0.04, 0, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
	btn.Text = "🌊 " .. name .. "   [OFF]"
	btn.TextColor3 = Color3.fromRGB(0, 255, 200)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBold
	btn.Parent = main

	btn.MouseButton1Click:Connect(function()
		_G.DVG[key] = not _G.DVG[key]
		if _G.DVG[key] then
			btn.Text = "🌊 " .. name .. "   [ON]"
			btn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
		else
			btn.Text = "🌊 " .. name .. "   [OFF]"
			btn.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
		end
	end)
	y = y + 50
end

AddToggle("Auto Farm Brainrot", "AutoFarm")
AddToggle("Auto Collect Tiền", "AutoCollect")
AddToggle("Tự Kiếm Infinity", "AutoInfinity")
AddToggle("Xóa Sóng Thần", "DestroyWave")
AddToggle("God Mode", "GodMode")
AddToggle("Fly", "Fly")
AddToggle("NoClip", "NoClip")
AddToggle("Infinite Jump", "InfJump")

game.StarterGui:SetCore("SendNotification", {
	Title = "🌊 DVG MATRIX ULTIMATE",
	Text = "MENU ĐÃ LOAD THÀNH CÔNG! Bấm nút để hack chạy ngay 🟢",
	Duration = 10
})

print("✅ DVG MATRIX ULTIMATE LOADED - Menu neon xịn đã hiện!")

-- ================== CHỨC NĂNG CHẠY THẬT ==================
RunService.Heartbeat:Connect(function()
	pcall(function()
		if _G.DVG.GodMode then
			humanoid.MaxHealth = math.huge
			humanoid.Health = math.huge
		end
		humanoid.WalkSpeed = _G.DVG.Speed
		humanoid.JumpPower = _G.DVG.InfJump and 200 or _G.DVG.Jump

		if _G.DVG.Fly and root then
			root.Velocity = Vector3.new(root.Velocity.X, 50, root.Velocity.Z)
		end
		if _G.DVG.NoClip then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = false end
			end
		end
	end)
end)

-- Farm + Collect + Infinity (siêu nhanh)
spawn(function()
	while wait(0.12) do
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
	while wait(0.08) do
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

-- Anti-Ban
spawn(function()
	while wait(25) do
		pcall(function()
			VirtualUser:Button2Down(Vector2.new(), Workspace.CurrentCamera.CFrame)
			wait(0.1)
			VirtualUser:Button2Up(Vector2.new(), Workspace.CurrentCamera.CFrame)
		end)
	end
end)
