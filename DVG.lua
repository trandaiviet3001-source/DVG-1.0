-- =============================================
-- 🌊 DVG - Sóng Thần Brainrot (Siêu Nhẹ + Fix Mobile 2026)
-- Tối ưu cho Delta Mobile & Xeno - Farm thật sự chạy
-- =============================================

print("🌊 DVG Siêu Nhẹ Mobile - Loading...")

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

-- ================== BIẾN THẬT ==================
_G.AutoFarm = false
_G.AutoCollect = false
_G.AutoInfinity = false
_G.DestroyWave = false
_G.GodMode = false
_G.Fly = false
_G.NoClip = false
_G.Speed = 130

-- Anti-Ban Mobile ổn định
spawn(function()
    while wait(28) do
        pcall(function()
            VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            wait(0.15)
            VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
        end)
    end
end)

-- ================== GUI SIÊU NHẸ (Tối ưu Mobile) ==================
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 380)
frame.Position = UDim2.new(0.5, -170, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 85, 125)
frame.BorderSizePixel = 0
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,45)
title.BackgroundTransparency = 1
title.Text = "🌊 DVG CHILL BIỂN"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local posY = 55
local function createBtn(text, toggleName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 36)
    btn.Position = UDim2.new(0.05, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(0, 110, 160)
    btn.Text = "🌊 " .. text .. " : OFF"
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.Parent = frame

    btn.MouseButton1Click:Connect(function()
        _G[toggleName] = not _G[toggleName]
        if _G[toggleName] then
            btn.Text = "🌊 " .. text .. " : ON"
            btn.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
        else
            btn.Text = "🌊 " .. text .. " : OFF"
            btn.BackgroundColor3 = Color3.fromRGB(0, 110, 160)
        end
    end)
    posY = posY + 42
end

createBtn("Auto Farm Brainrot", "AutoFarm")
createBtn("Auto Collect Tiền", "AutoCollect")
createBtn("Tự Kiếm Infinity", "AutoInfinity")
createBtn("Xóa Sóng Thần", "DestroyWave")
createBtn("God Mode", "GodMode")
createBtn("Fly", "Fly")
createBtn("NoClip", "NoClip")

print("✅ 🌊 DVG Mobile Ready! Bấm nút để farm thật sự.")

-- ================== MAIN FUNCTIONS (Tối ưu Mobile) ==================
RunService.Heartbeat:Connect(function()
    pcall(function()
        if _G.GodMode then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        end
        humanoid.WalkSpeed = _G.Speed

        if _G.Fly and root then
            root.Velocity = Vector3.new(root.Velocity.X, 45, root.Velocity.Z)
        end

        if _G.NoClip then
            for _, v in pairs(character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

-- Farm siêu nhanh + nhẹ
spawn(function()
    while wait(0.17) do
        pcall(function()
            if not (_G.AutoFarm or _G.AutoCollect or _G.AutoInfinity) then return end

            for _, item in ipairs(Workspace:GetDescendants()) do
                if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
                    local name = item.Name:lower()
                    if (_G.AutoFarm and (name:find("brainrot") or name:find("pet"))) or
                       (_G.AutoCollect and (name:find("cash") or name:find("coin") or name:find("money") or name:find("gem"))) or
                       (_G.AutoInfinity and (name:find("infinity") or name:find("divine"))) then
                        firetouchinterest(root, item, 0)
                        task.wait(0.01)
                        firetouchinterest(root, item, 1)
                    end
                end
            end
        end)
    end
end)

-- Xóa sóng thần
spawn(function()
    while wait(0.13) do
        if _G.DestroyWave then
            pcall(function()
                for _, v in ipairs(Workspace:GetDescendants()) do
                    local n = v.Name:lower()
                    if n:find("tsunami") or n:find("wave") or n:find("sóng") or n:find("flood") then
                        v:Destroy()
                    end
                end
            end)
        end
    end
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "🌊 DVG Mobile",
    Text = "Đã fix hoàn toàn! Bấm nút là farm chạy ngay trên Delta & Xeno 🏖️",
    Duration = 8
})
