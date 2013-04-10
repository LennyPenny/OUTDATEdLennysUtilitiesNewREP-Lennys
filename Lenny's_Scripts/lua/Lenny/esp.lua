CreateClientConVar("lenny_esp", 0, true, false)
CreateClientConVar("lenny_esp_printers", 0, true, false)

local function wallhack()
	if GetConVar("lenny_esp"):GetInt() == 1 then
		for k, v in pairs (player.GetAll()) do
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