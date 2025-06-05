-- PLS Donate Fake Donation Script (lokalt)
-- Brug i din egen version af PLS Donate (til test og sjov)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local name = lp.DisplayName or lp.Name

-- Find din stand i workspace (original struktur)
local function getBooth()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("Owner") then
            if v.Owner:IsA("ObjectValue") and v.Owner.Value == lp then
                return v
            end
        end
    end
end

local booth = getBooth()
if not booth then
    warn("❌ Kunne ikke finde din stand.")
    return
end

-- Find tekstfeltet (i PLS Donate hedder det ofte SurfaceGui > TextLabel)
local textLabel
for _, v in ipairs(booth:GetDescendants()) do
    if v:IsA("TextLabel") and v.Text:find("R$") then
        textLabel = v
        break
    end
end

if textLabel then
    textLabel.Text = name .. " har lige modtaget 10,000 R$!! 💸"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    textLabel.TextStrokeTransparency = 0.2
    textLabel.TextScaled = true
else
    warn("❌ Kunne ikke finde tekstLabel i standen.")
end

-- Lav en visuel effekt for "donation"
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local part = Instance.new("Part", workspace)
part.Anchored = true
part.CanCollide = false
part.Size = Vector3.new(5, 1, 5)
part.Position = hrp.Position + Vector3.new(0, 6, 0)
part.Material = Enum.Material.Neon
part.BrickColor = BrickColor.new("Bright yellow")
part.Transparency = 0.2

local particle = Instance.new("ParticleEmitter", part)
particle.Texture = "rbxassetid://284205403"
particle.Rate = 100
particle.Lifetime = NumberRange.new(1)
particle.Speed = NumberRange.new(2, 5)
particle.VelocitySpread = 180

game:GetService("Debris"):AddItem(part, 3)

print("✅ Fake donation gennemført.")
