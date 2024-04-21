local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "Nex Pulse", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "Nex Pulse Loading.."})

--- { S C R I P T - - - H E R E } --- 

-- OPÇÃO MIRAGEM - ACHAR MIRAGEM
local MirageIs = false

function mirageFinder(a)
    local mirage = (a.p - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
    tweenrach = game:GetService('TweenService'):Create(
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
        TweenInfo.new(mirage / 250, Enum.EasingStyle.Linear),
        {CFrame = a}
    )
    tweenrach:Play()
    MirageIs = true
end

-- IR ATÉ A MIRAGEM
function GotoMirage()
    toTargetWait(workspace.Map.MysticIsland.PrimaryPart.CFrame * CFrame.new(0, 250, 0))
end

-- NOTIFICAR MIRAGEM
local notifymirages = false

function NotifyMirage()
    if MirageIs then
        print("Mirage was FOUND")
        OrionLib:MakeNotification({
            Name = "Mirage Finder!",
            Content = "Mirage Was Founded",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    else
        print("Mirage was not Found")
    end
end

while notifymirages do
    wait(5.5)
    if notifymirages then
        NotifyMirage()
    end
end

Tab:AddToggle({
	Name = "Mirage Notify",
	Default = false,
	Callback = function(Value)
		notifymirages = Value
	end    
})
Tab:AddToggle({
	Name = "Auto goto Mirage",
	Default = false,
	Callback = function(Value)
		notifymirages = Value
	end    
})

local Webhook_URL = "Your webhook"
local Headers = {
    ['Content-Type'] = 'application/json',
}

-- Função para obter se é dia ou noite
local function getTimeOfDay()
    local time = game.Lighting:GetMinutesAfterMidnight() / 60
    if time >= 6 and time < 18 then
        return "Day"
    else
        return "Night"
    end
end

-- Função para contar jogadores
local function getPlayerCount()
    return #game.Players:GetPlayers()
end

local jobID = game.JobId
local timeOfDay = getTimeOfDay()
local playerCount = getPlayerCount()

-- Lista de embeds com diferentes informações
local embeds = {
    ["player_count"] = {
        ["title"] = "Player Count",
        ["description"] = "Currently there are " .. playerCount .. " players on the server.",
    },
    ["time"] = {
        ["title"] = "Time",
        ["description"] = "It's currently " .. timeOfDay .. " time on the server.",
    },
    ["job_id"] = {
        ["title"] = "Job ID",
        ["description"] = "The server's Job ID is: " .. jobID,
    },
    ["join_script"] = {
        ["title"] = "Join Script",
        ["description"] = "```lua\ngame:GetService(\"TeleportService\"):TeleportToPlaceInstance(7449423635,".. jobID ..", game:GetService(\"Players\").LocalPlayer)\n```",
    }
}

-- Enviar cada embed separadamente
for _, embed in pairs(embeds) do
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed["title"],
                ["description"] = embed["description"],
                ["type"] = "rich",
                ["color"] = tonumber(0xff0000), -- Vermelho
                ["fields"] = {
                    {
                        ["name"] = "HWID:",
                        ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                        ["inline"] = true,
                    },
                },
            },
        },
    }

    local PlayerData = game:GetService('HttpService'):JSONEncode(data)

    local http = game:GetService("HttpService")
    local HttpService = game:GetService("HttpService")
    local Request = http_request or request or HttpPost or syn.request
    Request({Url = Webhook_URL, Body = PlayerData, Method = "POST", Headers = Headers})
end



