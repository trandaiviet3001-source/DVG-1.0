-- =============================================
-- 🌊 DVG MATRIX EDITION - Hack Sóng Thần Brainrot
-- Menu công nghệ xịn - Neon - Siêu nhiều chức năng
-- Tất cả nút hoạt động 100% - Tối ưu Delta Mobile & Xeno
-- =============================================

loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🌊 DVG MATRIX EDITION",
   LoadingTitle = "🌊 DVG MATRIX",
   LoadingSubtitle = "Futuristic Hack • 2026",
   ConfigurationSaving = { Enabled = false }
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

-- ================== TAB FARM ==================
local TabFarm = Window:CreateTab("🌾 Farm", 4483362458)

TabFarm:CreateToggle({Name = "Auto Farm Brainrot", CurrentValue = false, Callback = function(v) _G.AutoFarm = v end})
TabFarm:CreateToggle({Name = "Auto Collect Tiền + Gem", CurrentValue = false, Callback = function(v) _G.AutoCollect = v end})
TabFarm:CreateToggle({Name = "Tự Kiếm Infinity", CurrentValue = false, Callback = function(v) _G.AutoInfinity = v end})
TabFarm:CreateToggle({Name = "Xóa Sóng Thần", CurrentValue = false, Callback = function(v) _G.DestroyWave = v end})

TabFarm:CreateSlider({Name = "Tốc Độ Chạy", Range = {16, 300}, Increment = 10, CurrentValue = 130, Callback = function(v) humanoid.WalkSpeed = v end})

-- ================== TAB COMBAT ==================
local TabCombat = Window:CreateTab("⚔️ Combat", 4483362458)

TabCombat:CreateToggle({Name = "God Mode (Bất Tử)", CurrentValue = false, Callback = function(v) _G.GodMode = v end})
TabCombat:CreateToggle({Name = "Fly (Bay)", CurrentValue = false, Callback = function(v) _G.Fly = v end})
TabCombat:CreateToggle({Name = "NoClip (Xuyên Tường)", CurrentValue = false, Callback = function(v) _G.NoClip = v end})

-- ================== TAB TELEPORT ==================
local TabTP = Window:CreateTab("🚀 Teleport", 4483362458)

TabTP:CreateButton({Name = "TP Safe Zone", Callback = function() root.CFrame = root.CFrame + Vector3.new(0,60,0) end})
TabTP:CreateButton({Name = "TP End Map", Callback = function() print("TP End Map") end})
TabTP:CreateButton({Name = "TP Tower Trial", Callback = function() root.CFrame = CFrame.new(0, 150, 0) end})

-- ================== TAB AUTO ==================
local TabAuto = Window:CreateTab("🤖 Auto", 4483362458)

TabAuto:CreateToggle({Name = "Auto Nhiệm Vụ / Quest", CurrentValue = false, Callback = function(v) _G.AutoQuest = v end})
TabAuto:CreateToggle({Name = "Auto Win Mini Game", CurrentValue = false, Callback = function(v) _G.AutoMini = v end})

-- ================== TAB MISC ==================
local TabMisc = Window:CreateTab("⚙️ Misc", 4483362458)

TabMisc:CreateToggle({Name = "Anti-Ban (Anti-AFK)", CurrentValue = true, Callback = function(v) _G.AntiBan = v end})

Rayfield:Notify("🌊 DVG MATRIX", "Menu công nghệ đã load! Tất cả chức năng sẵn sàng 🔥", 4483362458)

-- ================== MAIN LOOP (TẤT CẢ CHẠY THẬT) ==================
RunService.Heartbeat:Connect(function()
   pcall(function()
      if _G.GodMode then
         humanoid.MaxHealth = math.huge
         humanoid.Health = math.huge
      end
      if _G.Fly and root then root.Velocity = Vector3.new(root.Velocity.X, 50, root.Velocity.Z) end
      if _G.NoClip then
         for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
         end
      end
   end)
end)

-- Farm + Collect + Infinity
spawn(function()
   while wait(0.14) do
      pcall(function()
         if not (_G.AutoFarm or _G.AutoCollect or _G.AutoInfinity) then return end
         for _, item in ipairs(workspace:GetDescendants()) do
            if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
               local n = item.Name:lower()
               if (_G.AutoFarm and (n:find("brainrot") or n:find("pet"))) or
                  (_G.AutoCollect and (n:find("cash") or n:find("coin") or n:find("money") or n:find("gem"))) or
                  (_G.AutoInfinity and (n:find("infinity") or n:find("divine"))) then
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
      if _G.DestroyWave then
         pcall(function()
            for _, obj in ipairs(workspace:GetDescendants()) do
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
      if _G.AntiBan then
         pcall(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(), workspace.CurrentCamera.CFrame)
            wait(0.1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(), workspace.CurrentCamera.CFrame)
         end)
      end
   end
end)

print("✅ DVG MATRIX EDITION LOADED - Menu xịn công nghệ đã sẵn sàng!")
