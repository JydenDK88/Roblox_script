-- FAKE DONATION SCRIPT - Kun til testmiljøer du selv ejer!

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Find spillerens stand i workspace
local function getBooth()
    for _, model in pairs(workspace:GetDescendants()) do
        if model:IsA("Model") and model:FindFirstChild("Owner") then
            if model.Owner:IsA("ObjectValue") and model.Owner.Value == plr then
                return model
            end
        end
    end
    return nil
end

local booth = getBooth()

if not booth then
    warn("❌ Din stand blev ikke fundet!")
    return
end

-- Find tekstobjekt i standen
local function findTextLabel(model)
    for _, v in pairs(model:GetDescendants()) do
        if v:IsA("TextLabel") then
            return v
        end
    end
    return nil
end

local textLabel = findTextLabel(booth)

if textLabel then
    textLabel.Text = "🔥 " .. plr.DisplayName .. " fik 999,999 R$ DONATION! 🔥"
    textLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0
else
    warn("❌ Tekst kunne ikke findes i standen!")
end

-- Lav en fed visuel effekt
local part = Instance.new("Part", workspace)
part.Size = Vector3.new(5,1,5)
part.Position = hrp.Position + Vector3.new(0,5,0)
part.Anchored = true
part.Material = Enum.Material.Neon
part.BrickColor = BrickColor.new("Bright yellow")

local emitter = Instance.new("ParticleEmitter", part)
emitter.Texture = "rbxassetid://284205403" -- Robux-mønt
emitter.Rate = 100
emitter.Lifetime = NumberRange.new(1.5)
emitter.Speed = NumberRange.new(2,5)
emitter.SpreadAngle = Vector2.new(360, 360)
game:GetService("Debris"):AddItem(part, 3)

print("✅ Fake donation vist.")
