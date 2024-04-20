local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "Advanced Key System", HidePremium = false, SaveConfig = true, ConfigFolder = "KeySystem", IntroText = "Advanced Key System"})
local function randomNumbers(min, max, length)
    local key = ""
    for i = 1, length do
        key = key .. tostring(math.random(min, max))
    end
    return key
end

math.randomseed(os.time())

function keyresulter(value)
    return randomNumbers(0, 9, value)
end

local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local keyInput = "string"
local Key = keyresulter(15)
Tab:AddLabel("Your key is:", Key)

Tab:AddTextbox({
    Name = "Key input",
    Default = "Input key here",
    TextDisappear = true,
    Callback = function(Value)
        keyInput = Value:lower() -- Convertendo a entrada para minúsculas
    end      
})

Tab:AddButton({
    Name = "Verify Key",
    Callback = function()
        local key = Key:lower() -- Convertendo a chave gerada para minúsculas
        if keyInput == key then
            print("Correct Key")
            OrionLib:MakeNotification({
                Name = "Correct Key",
                Content = "Your Key is Correct!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Invalid Key",
                Content = "Your Key is Invalid Sorry.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            print("Incorrect Key")
        end
    end
})
