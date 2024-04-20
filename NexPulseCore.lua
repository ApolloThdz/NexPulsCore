local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "Advanced Key System", HidePremium = false, SaveConfig = true, ConfigFolder = "KeySystem", IntroText = "Advanced Key System"})

local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local keyInput = "string"
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
