-- =============================================
-- 🌊 DVG - Sóng Thần Brainrot (Siêu Nhẹ + Fix Toggle 2026)
-- Chill biển - Full tiếng Việt - Nhẹ máy - Farm thật sự chạy
-- =============================================

print("🌊 Đang load DVG Siêu Nhẹ - Fix Toggle...")

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

-- ================== BIẾN CHỨC NĂNG (BẬT THẬT) ==================
local AutoFarm = false
local AutoCollect = false
local AutoInfinity = false
local DestroyWave = false
local GodMode = false
local Fly = false
local NoClip = false
local Speed = 120

-- ================== ANTI-BAN ==================
spawn(function()
    while wait(30) do
        pcall(function()
            VirtualUser:Button2Down(Vector2.new(), Workspace.CurrentCamera.CFrame)
            wait(0.1)
            VirtualUser:Button2Up(Vector2.new(), Workspace.CurrentCamera.CFrame)
        end)
    end
end)

-- ================== GUI NHẸ (Toggle thật sự bật chức năng) ==================
local sg = Instance.new("ScreenGui")
sg.Name = "DVG_Light"
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 380, 0, 420)
frame.Position = UDim2.new(0.5, -190, 0.5, -210)
frame.BackgroundColor3 = Color3.fromRGB(0, 90, 130)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(0, 200, 255)
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "🌊 DVG CHILL BIỂN"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local y = 60
local function AddToggle(txt, varName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
    btn.Text = "🌊 " .. txt .. " : OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.Parent = frame

    btn.MouseButton1Click:Connect(function()
        _G[varName] = not _G[varName]   -- Dùng _G để toggle thật

        if _G[varName] then
            btn.Text = "🌊 " .. txt .. " : ON"
            btn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        else
            btn.Text = "🌊 " .. txt .. " : OFF"
            btn.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
        end
    end)
    y = y + 45
end

-- Tạo toggle (bây giờ sẽ thật sự bật chức năng)
AddToggle("Auto Farm Brainrot", "AutoFarm")
AddToggle("Auto Collect Tiền", "AutoCollect")
AddToggle("Tự Kiếm Infinity", "AutoInfinity")
AddToggle("Xóa Sóng Thần", "DestroyWave")
AddToggle("God Mode", "GodMode")
AddToggle("Fly", "Fly")
AddToggle("NoClip", "NoClip")

-- Speed
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.6, 0, 0, 30)
speedLabel.Position = UDim2.new(0.05, 0, 0, y+10)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Tốc Độ: 120"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.TextScaled = true
speedLabel.Parent = frame

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0.3, 0, 0, 30)
speedBox.Position = UDim2.new(0.65, 0, 0, y+10)
speedBox.Text = "120"
speedBox.BackgroundColor3 = Color3.fromRGB(0, 70, 100)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.Parent = frame
speedBox.FocusLost:Connect(function()
    Speed = tonumber(speedBox.Text) or 120
    speedLabel.Text = "Tốc Độ: " .. Speed
end)

print("✅ 🌊 DVG đã fix toggle - Bây giờ bấm là farm thật!")

-- ================== MAIN LOOP ==================
RunService.Heartbeat:Connect(function()
    pcall(function()
        if _G.GodMode then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        end
        humanoid.WalkSpeed = Speed

        if _G.Fly and root then
            root.Velocity = Vector3.new(root.Velocity.X, 40, root.Velocity.Z)
        end

        if _G.NoClip then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)
end)

-- Farm loop (siêu nhanh nhưng nhẹ)
spawn(function()
    while wait(0.18) do
        pcall(function()
            if not (_G.AutoFarm or _G.AutoCollect or _G.AutoInfinity) then return end
            for _, item in pairs(Workspace:GetDescendants()) do
                if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
                    local n = item.Name:lower()
                    if (_G.AutoFarm and (n:find("brainrot") or n:find("pet"))) or
                       (_G.AutoCollect and (n:find("cash") or n:find("coin") or n:find("money") or n:find("gem"))) or
                       (_G.AutoInfinity and (n:find("infinity") or n:find("divine"))) then
                        firetouchinterest(root, item, 0)
                        wait(0.015)
                        firetouchinterest(root, item, 1)
                    end
                end
            end
        end)
    end
end)

-- Xóa sóng
spawn(function()
    while wait(0.12) do
        if _G.DestroyWave then
            pcall(function()
                for _, obj in pairs(Workspace:GetDescendants()) do
                    local n = obj.Name:lower()
                    if n:find("tsunami") or n:find("wave") or n:find("sóng") or n:find("flood") then
                        obj:Destroy()
                    end
                end
            end)
        end
    end
end)

game.StarterGui:SetCore("SendNotification", {Title = "🌊 DVG", Text = "Đã fix toggle! Bấm nút là farm thật sự chạy rồi bro 🏖️", Duration = 7})
