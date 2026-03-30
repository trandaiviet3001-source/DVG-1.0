-- =============================================
-- 🌊 DVG - Sóng Thần Brainrot (Siêu Nhẹ - 2026)
-- Chill biển - Full tiếng Việt - Nhẹ máy - Farm nhanh
-- Custom riêng cho bạn - Chạy tốt Xeno & Delta
-- =============================================

print("🌊 Đang load DVG Siêu Nhẹ...")

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

-- ================== BIẾN ==================
local AutoFarm = false
local AutoCollect = false
local AutoInfinity = false
local DestroyWave = false
local GodMode = false
local Fly = false
local NoClip = false
local Speed = 120

-- ================== ANTI-BAN NHẸ ==================
spawn(function()
    while wait(30) do
        pcall(function()
            VirtualUser:Button2Down(Vector2.new(), Workspace.CurrentCamera.CFrame)
            wait(0.1)
            VirtualUser:Button2Up(Vector2.new(), Workspace.CurrentCamera.CFrame)
        end)
    end
end)

-- ================== GUI SIÊU NHẸ ==================
local sg = Instance.new("ScreenGui")
sg.Name = "DVG_Light"
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 380, 0, 420)
frame.Position = UDim2.new(0.5, -190, 0.5, -210)
frame.BackgroundColor3 = Color3.fromRGB(0, 90, 130)  -- màu biển chill
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
local function AddToggle(txt, callback)
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
        callback()
        if btn.Text:find("OFF") then
            btn.Text = "🌊 " .. txt .. " : ON"
            btn.BackgroundColor3 = Color3.fromRGB(0, 180, 80)
        else
            btn.Text = "🌊 " .. txt .. " : OFF"
            btn.BackgroundColor3 = Color3.fromRGB(0, 120, 180)
        end
    end)
    y = y + 45
end

AddToggle("Auto Farm Brainrot", function() AutoFarm = not AutoFarm end)
AddToggle("Auto Collect Tiền", function() AutoCollect = not AutoCollect end)
AddToggle("Tự Kiếm Infinity", function() AutoInfinity = not AutoInfinity end)
AddToggle("Xóa Sóng Thần", function() DestroyWave = not DestroyWave end)
AddToggle("God Mode", function() GodMode = not GodMode end)
AddToggle("Fly", function() Fly = not Fly end)
AddToggle("NoClip", function() NoClip = not NoClip end)

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

print("✅ 🌊 DVG Siêu Nhẹ đã load! Menu nhẹ, farm nhanh, ít lag.")

-- ================== MAIN LOOP (TỐI ƯU NHẸ) ==================
RunService.Heartbeat:Connect(function()
    pcall(function()
        if GodMode then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        end
        humanoid.WalkSpeed = Speed

        if Fly and root then
            root.Velocity = Vector3.new(root.Velocity.X, 40, root.Velocity.Z)
        end

        if NoClip then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)
end)

-- Farm siêu nhanh nhưng nhẹ máy (wait 0.2)
spawn(function()
    while wait(0.2) do
        pcall(function()
            if not (AutoFarm or AutoCollect or AutoInfinity) then return end
            for _, item in pairs(Workspace:GetDescendants()) do
                if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
                    local n = item.Name:lower()
                    if (AutoFarm and (n:find("brainrot") or n:find("pet"))) or
                       (AutoCollect and (n:find("cash") or n:find("coin") or n:find("money") or n:find("gem"))) or
                       (AutoInfinity and (n:find("infinity") or n:find("divine"))) then
                        firetouchinterest(root, item, 0)
                        wait(0.02)
                        firetouchinterest(root, item, 1)
                    end
                end
            end
        end)
    end
end)

-- Xóa sóng
spawn(function()
    while wait(0.15) do
        if DestroyWave then
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

game.StarterGui:SetCore("SendNotification", {Title = "🌊 DVG", Text = "Phiên bản siêu nhẹ đã sẵn sàng! Farm chill nào bro 🏖️", Duration = 6})
