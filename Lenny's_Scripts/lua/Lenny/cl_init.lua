CreateClientConVar("lenny_esp", 0, true, false)
CreateClientConVar("lenny_esp_entities", 0, true, false)
CreateClientConVar("lenny_esp_additionals", 0, true, false)

local entities = {
	"printer",
	"shipment",
	"gunlab",
	"spawned_weapon"
}

local function eespe()
local vdis = 1
	for k, v in pairs(ents.GetAll()) do
		if v:IsPlayer() then
			if GetConVarNumber("lenny_esp") == 1 then
				if LocalPlayer():Alive() and v:Alive() then
					 vdis = (v:GetPos() - LocalPlayer():GetPos()):Length()
				else
					vdis = 0
				end
					
				local plypos = (v:GetPos() + Vector(0,0,100)):ToScreen()
				
				local plyps = v:GetPos():ToScreen()
				if v:IsAdmin() or v:IsSuperAdmin() then
					draw.DrawText("" ..v:Name().. "[Admin]", "TabLarge", plypos.x, plypos.y, Color(220,60,90,255), 1)
				elseif v:GetFriendStatus() == "friend" then
					surface.SetDrawColor(0,255,0,255)
					draw.DrawText("" ..v:Name().. "[Friend]", "TabLarge", plypos.x, plypos.y, Color(0,255,0,255), 1)
				else
					draw.DrawText(v:Name(), "Trebuchet18", plypos.x, plypos.y, Color(255,255,255), 1)
				end
				if GetConVarNumber("lenny_esp_additionals") == 1 then
					if v:Alive() and vdis and vdis <= 400 then
						draw.DrawText(v:GetActiveWeapon():GetClass(), "Trebuchet18", plypos.x, plypos.y + 10, Color(255,255,255), 1)
					end
				end
			end
		else
			if GetConVarNumber("lenny_esp_entities") == 1 then
				for _, names in pairs(entities) do
					if string.find(string.lower(tostring(v:GetClass())), tostring(names)) then
						if names == "shipment" then
							local plypos = (v:GetPos() + Vector(0,0,20)):ToScreen()
							draw.DrawText(CustomShipments[v:Getcontents()].name.." shipment", "Trebuchet18", plypos.x, plypos.y, Color(255,193,37), 1)
						else
							local plypos = (v:GetPos() + Vector(0,0,20)):ToScreen()
							draw.DrawText(v:GetClass(), "Trebuchet18", plypos.x, plypos.y, Color(255,193,37), 1)
						end
					end
				end
			end
		end
	end
end

hook.Add("HUDPaint", "EESPE", eespe)

--Derma


local DLabel5
local DLabel4
local DLabel3
local DLabel2
local espconfig_textentry


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
	espconfig_list:Clear()
	updatelist()
end





espconfig_textentry = vgui.Create('DTextEntry')
espconfig_textentry:SetParent(espconfig_frame)
espconfig_textentry:SetSize(205, 20)
espconfig_textentry:SetPos(5, 145)
espconfig_textentry.OnEnter = function()
	table.insert(entities, espconfig_textentry:GetValue())
	updatelist()

end


DLabel2 = vgui.Create('DLabel')
DLabel2:SetParent(espconfig_frame)
DLabel2:SetPos(10, 40)
DLabel2:SetText('The list below shows all entities which')
DLabel2:SizeToContents()

DLabel3 = vgui.Create('DLabel')
DLabel3:SetParent(espconfig_frame)
DLabel3:SetPos(10, 50)
DLabel3:SetText('will be detected by the ESP.')
DLabel3:SizeToContents()

DLabel4 = vgui.Create('DLabel')
DLabel4:SetParent(espconfig_frame)
DLabel4:SetPos(10, 60)
DLabel4:SetText('To add entities, type its class name')
DLabel4:SizeToContents()

DLabel5 = vgui.Create('DLabel')
DLabel5:SetParent(espconfig_frame)
DLabel5:SetPos(10, 70)
DLabel5:SetText('into the textbox below and hit enter.')
DLabel5:SizeToContents()


local function updatelist()
		espconfig_list:Clear()
	for k, v in pairs(entities) do
		espconfig_list:AddLine(v)
	end
end




local function lenny_espconfig_open()
	espconfig_frame:SetVisible(true)
	updatelist()
end

concommand.Add("lenny_espopen", lenny_espconfig_open)