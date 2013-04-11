local function ReloadLennys()
	include("autorun/client/Lennys.lua")
end
concommand.Add("lenny_reload", ReloadLennys)

local files, folders = file.Find("lua/Lenny/*.lua", "GAME")
for k, v in pairs(files) do
	include("Lenny/" .. v)
end


--Derma

local entsesp_checkbox
local espconfig_button
local esp_checkbox
local flashlight_checkbox
local bunnyhop_checkbox
local MainWindow

MainWindow = vgui.Create('DFrame')
MainWindow:SetSize(270, 170)
MainWindow:SetPos(0, 0)
MainWindow:SetTitle("Lenny's  Utilities")
MainWindow:SetSizable(true)
MainWindow:SetDeleteOnClose(false)
MainWindow:SetVisible(false)
MainWindow:MakePopup()

bunnyhop_checkbox = vgui.Create('DCheckBoxLabel')
bunnyhop_checkbox:SetParent(MainWindow)
bunnyhop_checkbox:SetPos(10, 40)
bunnyhop_checkbox:SetText('Bunnyhop')
bunnyhop_checkbox:SetValue(true)
bunnyhop_checkbox:SetConVar("lenny_bunnyhop")
bunnyhop_checkbox.DoClick = function() end
bunnyhop_checkbox:SizeToContents()

flashlight_checkbox = vgui.Create('DCheckBoxLabel')
flashlight_checkbox:SetParent(MainWindow)
flashlight_checkbox:SetPos(10, 70)
flashlight_checkbox:SetText('Flashlight Spam')
flashlight_checkbox:SetConVar("lenny_flashlight")
flashlight_checkbox.DoClick = function() end
flashlight_checkbox:SizeToContents()

esp_checkbox = vgui.Create('DCheckBoxLabel')
esp_checkbox:SetParent(MainWindow)
esp_checkbox:SetPos(10, 95)
esp_checkbox:SetText('Simple ESP with admin recognition')
esp_checkbox:SetConVar("lenny_esp")
esp_checkbox.DoClick = function() end
esp_checkbox:SizeToContents()

entsesp_checkbox = vgui.Create('DCheckBoxLabel')
entsesp_checkbox:SetParent(MainWindow)
entsesp_checkbox:SetPos(30, 120)
entsesp_checkbox:SetText('Printer/Entity Esp')
entsesp_checkbox:SetConVar("lenny_esp_entities")
entsesp_checkbox.DoClick = function() end
entsesp_checkbox:SizeToContents()

espconfig_button = vgui.Create('DButton')
espconfig_button:SetParent(MainWindow)
espconfig_button:SetSize(70, 25)
espconfig_button:SetPos(140, 115)
espconfig_button:SetText('ESP Options')
espconfig_button.DoClick = lenny_espconfig_open

espconfig_textentry = vgui.Create('DTextEntry')
espconfig_textentry:SetParent(MainWindow)
espconfig_textentry:SetSize(205, 20)
espconfig_textentry:SetPos(5, 145)


concommand.Add("lenny_menu", lenny_Menu)
concommand.Add("lenny_espconfig", lenny_espconfig_open)


function lenny_Menu()
	MainWindow:SetVisible(true)
end

