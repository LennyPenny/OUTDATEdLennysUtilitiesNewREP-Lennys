local function ReloadLennys()
	include("autorun/client/Lennys.lua")
end
concommand.Add("lenny_reload", ReloadLennys)

local files, folders = file.Find("lua/Lenny/*.lua", "GAME")
for k, v in pairs(files) do
	include("Lenny/" .. v)
end


--Derma

local DLabel3
local DLabel2
local FlspamCheckbox
local BunnyCheckBox
local MainWindow

MainWindow = vgui.Create('DFrame')
MainWindow:SetSize(280, 159)
MainWindow:Center()
MainWindow:SetTitle("Lenny's Scripts")
MainWindow:SetSizable(true)
MainWindow:SetDeleteOnClose(false)
MainWindow:SetVisible(false)

BunnyCheckBox = vgui.Create('DCheckBoxLabel')
BunnyCheckBox:SetParent(MainWindow)
BunnyCheckBox:SetPos(10, 69)
BunnyCheckBox:SetText('Bunnyhop')
BunnyCheckBox:SetValue(true)
BunnyCheckBox:SetConVar("lenny_bunnyhop")
BunnyCheckBox.DoClick = function() end
BunnyCheckBox:SizeToContents()

FlspamCheckbox = vgui.Create('DCheckBoxLabel')
FlspamCheckbox:SetParent(MainWindow)
FlspamCheckbox:SetPos(10, 99)
FlspamCheckbox:SetText('Flashlight Spam')
FlspamCheckbox:SetConVar("lenny_flashlight")
FlspamCheckbox.DoClick = function() end
FlspamCheckbox:SizeToContents()

DLabel2 = vgui.Create('DLabel')
DLabel2:SetParent(MainWindow)
DLabel2:SetPos(130, 100)
DLabel2:SetText('Hold "H" to spam the flahlight')
DLabel2:SizeToContents()

DLabel3 = vgui.Create('DLabel')
DLabel3:SetParent(MainWindow)
DLabel3:SetPos(130, 70)
DLabel3:SetText('Hold space to bunnyhop')
DLabel3:SizeToContents()

DCheckBox4 = vgui.Create('DCheckBoxLabel')
DCheckBox4:SetParent(MainWindow)
DCheckBox4:SetPos(10, 126)
DCheckBox4:SetText('Simeple ESP +  admin recognition')
DCheckBox4:SetConVar("lenny_esp")
DCheckBox4.DoClick = function() end
DCheckBox4:SizeToContents()


concommand.Add("lenny_menu", Lenny_Menu)

function Lenny_Menu()


	MainWindow:SetVisible(true)
	surface.CreateFont ("MenuLarge", ScreenScale(20), 400, true, false, "MenuSmall")
end
