CreateClientConVar("lenny_esp", 0, true, false)
CreateClientConVar("lenny_esp_entities", 0, true, false)


local entities = {
	"money_printer",
}

local function wallhack()
	if GetConVarNumber("lenny_esp_entities") == 1 then
			for k, v1 in pairs (entities) do
				for k, v in pairs (ents.FindByClass(v1)) do
					local plypos = (v:GetPos() + Vector(0,0,20)):ToScreen()
					draw.DrawText( v1, "Trebuchet18", plypos.x, plypos.y, Color(200,100,50), 1)
				end
			end
	end

		
	end
	if GetConVarNumber("lenny_esp") == 1 then
				for k, v in pairs (ents.GetAll()) do
					if v:IsPlayer() then
						local plypos = (v:GetPos() + Vector(0,0,80)):ToScreen()
						if v:IsAdmin() or v:IsSuperAdmin() then
							draw.DrawText("" ..v:Name().. "[Admin]", "TabLarge", plypos.x, plypos.y, Color(220,60,90,255), 1)
						else
							draw.DrawText(v:Name(), "Trebuchet18", plypos.x, plypos.y, Color(255,255,255), 1)
						end
					end
	end
end

hook.Add("HUDPaint", "ESP", wallhack)

--Derma

local DLabel5
local DLabel4
local DLabel3
local DLabel2
local espconfig_textentry
local espconfig_list

espconfig_frame = vgui.Create('DFrame')
espconfig_frame:SetSize(215, 410)
espconfig_frame:SetPos(300, 0)
espconfig_frame:SetTitle('ESP config')
espconfig_frame:SetSizable(true)
espconfig_frame:SetDeleteOnClose(false)
espconfig_frame:SetVisible(false)
espconfig_frame:MakePopup()

espconfig_list = vgui.Create('DListView')
espconfig_list:SetParent(espconfig_frame)
espconfig_list:SetSize(205, 235)
espconfig_list:SetPos(5, 170)
espconfig_list:AddColumn("Class Name")
espconfig_list.OnClickLine = function()
	table.remove(entities, espconfig_list:GetSelectedLine())
end

classlist_button = vgui.Create('DButton')
classlist_button:SetParent(espconfig_frame)
classlist_button:SetSize(70, 25)
classlist_button:SetPos(5, 115)
classlist_button:SetText('Update')
classlist_button.DoClick = function()
	espconfig_list:Clear()
	for k, v in pairs(entities) do
		espconfig_list:AddLine(v)
	end

end


espconfig_textentry = vgui.Create('DTextEntry')
espconfig_textentry:SetParent(espconfig_frame)
espconfig_textentry:SetSize(205, 20)
espconfig_textentry:SetPos(5, 145)
espconfig_textentry.OnEnter = function()
	print("works")
	table.insert(entities, espconfig_textentry:GetValue())
end


DLabel2 = vgui.Create('DLabel')
DLabel2:SetParent(espconfig_frame)
DLabel2:SetPos(10, 40)
DLabel2:SetText('The list below shows all entities wich')
DLabel2:SizeToContents()

DLabel3 = vgui.Create('DLabel')
DLabel3:SetParent(espconfig_frame)
DLabel3:SetPos(10, 50)
DLabel3:SetText('will be detected by the ESP.')
DLabel3:SizeToContents()

DLabel4 = vgui.Create('DLabel')
DLabel4:SetParent(espconfig_frame)
DLabel4:SetPos(10, 60)
DLabel4:SetText('To add entities, type its class name in')
DLabel4:SizeToContents()

DLabel5 = vgui.Create('DLabel')
DLabel5:SetParent(espconfig_frame)
DLabel5:SetPos(10, 70)
DLabel5:SetText('to the textbox below and hit enter.')
DLabel5:SizeToContents()

function lenny_espconfig_open()
	espconfig_frame:SetVisible(true)
end