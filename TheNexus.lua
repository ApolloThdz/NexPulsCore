local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "Nexus Pulse"})
local EstilosdeLuta = {"Combat", "Dark Step","Electric","Water Kung Fu","Dragon Breath","Superhuman","Death Step","Sharkman Karate","Electric Claw","Dragon Talon","Godhuman","Sanguine Art"}
local Dropin = {"Meele","BloxFruit","Sword"}
local OrionLib = {
	Themes = {
		Default = {
			Main = Color3.fromRGB(25, 25, 25),
			Second = Color3.fromRGB(32, 32, 32),
			Stroke = Color3.fromRGB(126, 0, 255),
			Divider = Color3.fromRGB(60, 60, 60),
			Text = Color3.fromRGB(240, 240, 240),
			TextDark = Color3.fromRGB(150, 150, 150)
		}
	},
	SelectedTheme = "Default",
}



local Auto_Farm = false -- Variável para ativar ou desativar o farm automático

local SelectToolWeapon -- Variável para selecionar a arma a ser equipada
local SelectMonster -- Variável para selecionar o monstro

local MagnetActive = true

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(0.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

function TP(CFramePos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFramePos
end


local Shop = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://7734056813",
	PremiumOnly = false
})

Shop:AddLabel("Abilities")
Shop:AddButton({
	Name = "SkyJump",
	Callback = function()
      		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
  	end
})
Shop:AddButton({
	Name = "Buso Haki",
	Callback = function()
      		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
  	end
})
Shop:AddButton({
	Name = "Soru Haki",
	Callback = function()
      		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
  	end
})
Shop:AddButton({
	Name = "Ken Haki",
	Callback = function()
      		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
  	end
})
Shop:AddLabel("Fragments Shop")
      Shop:AddButton({
	    Name = "Refund Status [2500 F]",
	    Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2")
      end
      })
      Shop:AddButton({
	    Name = "Reroll Race [3000 F]",
	    Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","1")
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Reroll","2")
      end
      })
Shop:AddLabel("Accessory")
      Shop:AddButton({
	    Name = "[Black Cape]",
	    Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Black Cape")
      end
})
      Shop:AddButton({
	    Name = "[Swordsman Hat]",
	    Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Swordsman Hat")
      end
})  
      Shop:AddButton({
	    Name = "[Tomoe Ring]",
	    Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Tomoe Ring")
      end
})
  
