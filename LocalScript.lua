local replicatedStorage 	= game:GetService("ReplicatedStorage")
local playerService 		= game:GetService("Players")
local starterGui 			= game:GetService("StarterGui")

local localPlayer 		= playerService.LocalPlayer
local data 				= require(replicatedStorage.Data)
local menu 				= script.Parent:WaitForChild("Background"):WaitForChild("Container")

local menuHome 			= menu:WaitForChild("Home")
local menuInfo 			= menu:WaitForChild("Info")
local menuNav  			= menu:WaitForChild("Navbar")
local menuHomeSide 		= menuHome:WaitForChild("Side")
local menuHomePlaylists 	= menuHome:WaitForChild("List")
local menuNavOptions		= menuNav:WaitForChild("Container")
local menuNavHome 		= menuNavOptions:WaitForChild("Home")
local menuNavInfo			= menuNavOptions:WaitForChild("Info")
local listTemplate 		= menuHomePlaylists:WaitForChild("Template")

local promptText 			= menuHome:WaitForChild("Prompt")

-- Theming
menu:WaitForChild("Back").ImageColor3                      						= data.theme.bg1
menu.Parent.Parent:WaitForChild("Topbar").BackgroundColor3 						= data.theme.bg2
menu.Parent.BackgroundColor3 							   						= data.theme.bg2

menuInfo:WaitForChild("TextLabel").TextColor3 			   						= data.theme.text
menuHomeSide:WaitForChild("Greeting").TextColor3 								= data.theme.text
menuHomeSide:WaitForChild("Info").TextColor3 									= data.theme.text
menuHomeSide.Info.BackgroundColor3 											= data.theme.bg2

menuNav:WaitForChild("Back").ImageColor3                   						= data.theme.navbg
menuNav.Back:WaitForChild("Bottom").BackgroundColor3							= data.theme.navbg
menuNavHome.TextColor3 														= data.theme.accent
menuNavInfo.TextColor3 														= data.theme.navtext
if data.theme.naviconImage == nil then
else
	menuNavOptions:WaitForChild("ALogo").Image 								= data.theme.naviconImage
	menuNavOptions.ALogo:WaitForChild("UIAspectRatioConstraint").AspectRatio 	= data.theme.naviconAspectRatio
	menuNavOptions.ALogo.ScaleType 											= data.theme.naviconScaleType
	menuNavOptions.ALogo.Visible 												= true
	if data.theme.naviconUseAccent then menuNavOptions.ALogo.ImageColor3 		= data.theme.accent
	end
end

listTemplate:WaitForChild("Name").TextColor3 									= data.theme.text
listTemplate:WaitForChild("Info").TextColor3 									= data.theme.text
listTemplate:WaitForChild("Load").TextColor3 									= data.theme.text
listTemplate:WaitForChild("Loading").TextColor3 								= data.theme.text
listTemplate.Load.BackgroundColor3 											= data.theme.bg2
listTemplate.Loading.BackgroundColor3 											= data.theme.bg2

promptText.TextColor3 														= data.theme.text

-- UI
menuHomeSide.Greeting.Text = "Hello, <b>" .. localPlayer.DisplayName .. "</b>"
if game.GameId == 4831741269 then
else
	menuInfo:WaitForChild("TextLabel").Text = "This is a custom audio loader for my project titled " .. data.projectname .. ". \n\nGame originally made by ImNotFireMan123\nhttps://www.roblox.com/games/13940978880/Custom-Music-Engine" 
end
local success, result = pcall(function()
	return playerService:GetUserThumbnailAsync(localPlayer.UserId, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420)
end)
if success then
	if result then
		menuHomeSide:WaitForChild("Player").Image = result
	end
else
	warn(result)
	menuHomeSide:WaitForChild("Player").Image = ""
end

-- Navigation
function toggleMenu(menu:Frame) 
	if menu == menuInfo then
		menuNavInfo.TextColor3 = data.theme.accent
		menuNavHome.TextColor3 = data.theme.text
	else
		menuNavInfo.TextColor3 = data.theme.text
		menuNavHome.TextColor3 = data.theme.accent
	end
	menuInfo.Visible = false
	menuHome.Visible = false

	menu.Visible = true
end

menuHomeSide.Info.MouseButton1Click:Connect(function() toggleMenu(menuInfo) end)
menuNavInfo.MouseButton1Click:Connect(function() toggleMenu(menuInfo) end)
menuNavHome.MouseButton1Click:Connect(function() toggleMenu(menuHome) end)

-- Playlists
function prompt(textToPrompt:string, duration:number)
	promptText.Visible = false
	promptText.Text = textToPrompt .. " (Hidden in " .. duration .. "s)"
	promptText.Visible = true

	local index = duration
	while index > 0 do 
		promptText.Text = textToPrompt .. " (Hidden in " .. index .. "s)"
		index = index - 1
		task.wait(1)
	end

	promptText.Visible = false
end

local sound = Instance.new("Sound")
sound.Parent = menu
sound.Volume = 0

for index, value in pairs(data.playlists) do
	local newTemplate = listTemplate:Clone()
	newTemplate.Parent = menuHomePlaylists
	newTemplate:WaitForChild("Name").Text = data.playlists[index].name

	local songs = data.playlists[index].songs
	if #songs == 1 then 
		newTemplate:WaitForChild("Info").Text = #songs .. " song"
	else
		newTemplate:WaitForChild("Info").Text = #songs .. " songs"
	end
	newTemplate.Visible = true

	newTemplate:WaitForChild("Load").MouseButton1Click:Connect(function()
		local songsLoaded = 0
		--local songsSkipped = 0
		
		starterGui:SetCore("SendNotification",{
			Title = "Started", -- Required
			Text = "Started to load the playlist \"" .. data.playlists[index].name .. "\"!"
		})
		newTemplate:WaitForChild("Loading").Text = "..."
		newTemplate:WaitForChild("Info")
		newTemplate.Loading.Visible = true
		newTemplate.Load.Visible = false
		
		for index, value in pairs(songs) do
			
			sound.SoundId = value
			sound.Loaded:Wait()
			
			if #songs == 1 then 
				newTemplate.Info.Text = #songs .. " song (" .. index .. "/" .. #songs .. " loaded)"
			else
				newTemplate.Info.Text = #songs .. " songs (" .. index .. "/" .. #songs .. " loaded)"
			end
			
		end
		
		starterGui:SetCore("SendNotification",{
			Title = "Finished", -- Required
			Text = "Finished loading the playlist \"" .. data.playlists[index].name .. "\"!"
		})
		newTemplate.Loading.Text = "Done!"
		prompt("The playlist has loaded, you can return to " .. data.promptGame .. " now.", data.promptDuration)
	end)
end

starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
starterGui:SetCore("ResetButtonCallback", false)
